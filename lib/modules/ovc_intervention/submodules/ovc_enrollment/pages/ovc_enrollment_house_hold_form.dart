import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_child_services.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_house_hold_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/skip_logics/ovc_house_hold_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentHouseHoldForm extends StatefulWidget {
  const OvcEnrollmentHouseHoldForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentHouseHoldFormState createState() =>
      _OvcEnrollmentHouseHoldFormState();
}

class _OvcEnrollmentHouseHoldFormState
    extends State<OvcEnrollmentHouseHoldForm> {
  List<FormSection> formSections;
  final String label = 'Household Enrolment Form';
  final List<String> mandatoryFields =
      OvcEnrollmentHouseHold.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  final String trackedEntityInstance = AppUtil.getUid();

  bool isSaving = false;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = OvcEnrollmentHouseHold.getFormSections();
      isFormReady = true;
      evaluateSkipLogics();
    });
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      dataObject['PN92g65TkVI'] = dataObject['PN92g65TkVI'] ?? 'Active';
      List<String> hiddenFields = [
        BeneficiaryIdentification.beneficiaryId,
        BeneficiaryIdentification.beneficiaryIndex,
        'PN92g65TkVI'
      ];
      List<Map> childrenObjects = dataObject['children'];
      String orgUnit = dataObject['location'];
      bool shouldEnroll = true;
      await OvcEnrollmentHouseHoldService().savingHouseHoldform(
        dataObject,
        trackedEntityInstance,
        orgUnit,
        null,
        null,
        null,
        shouldEnroll,
        hiddenFields,
      );
      await OvcEnrollmentChildService().savingChildrenEnrollmentForms(
        trackedEntityInstance,
        orgUnit,
        childrenObjects,
        null,
        null,
        shouldEnroll,
        hiddenFields,
      );
      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcList();
      Timer(Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
          setState(() {
            isSaving = false;
          });
          AppUtil.showToastMessage(
              message: 'Form has been saved successfully',
              position: ToastGravity.TOP);
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      });
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
    }
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await OvcHouseHoldEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: Consumer<IntervetionCardState>(
                builder: (context, intervetionCardState, child) {
                  InterventionCard activeInterventionProgram =
                      intervetionCardState.currentIntervetionProgram;
                  return SubPageAppBar(
                    label: label,
                    activeInterventionProgram: activeInterventionProgram,
                  );
                },
              ),
            ),
            body: SubPageBody(
                body: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
                    child: !isFormReady
                        ? Column(
                            children: [
                              Center(
                                child: CircularProcessLoader(
                                  color: Colors.blueGrey,
                                ),
                              )
                            ],
                          )
                        : Container(
                            child: Consumer<EnrollmentFormState>(
                                builder: (context, enrollmentFormState,
                                        child) =>
                                    Column(
                                      children: [
                                        Container(
                                          child: EntryFormContainer(
                                            hiddenFields: enrollmentFormState
                                                .hiddenFields,
                                            hiddenSections: enrollmentFormState
                                                .hiddenSections,
                                            formSections: formSections,
                                            mandatoryFieldObject:
                                                mandatoryFieldObject,
                                            dataObject:
                                                enrollmentFormState.formState,
                                            onInputValueChange:
                                                onInputValueChange,
                                          ),
                                        ),
                                        OvcEnrollmentFormSaveButton(
                                          label: isSaving
                                              ? 'Saving House Hold ...'
                                              : 'Save House Hold',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF4B9F46),
                                          fontSize: 15.0,
                                          onPressButton: () => isSaving
                                              ? null
                                              : onSaveAndContinue(
                                                  context,
                                                  enrollmentFormState
                                                      .formState),
                                        )
                                      ],
                                    )),
                          ))),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
