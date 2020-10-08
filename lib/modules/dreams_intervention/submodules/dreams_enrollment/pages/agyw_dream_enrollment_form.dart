import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsEnrollmentForm extends StatefulWidget {
  const AgywDreamsEnrollmentForm({Key key}) : super(key: key);
  @override
  _AgywDreamsEnrollmentFormState createState() =>
      _AgywDreamsEnrollmentFormState();
}

class _AgywDreamsEnrollmentFormState extends State<AgywDreamsEnrollmentForm> {
  List<FormSection> formSections;
  final String label = 'Enrollment Assessment';
  final List<String> mandatoryFields =
      AgywEnrollmentFormSection.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  final String trackedEntityInstance = AppUtil.getUid();
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = AgywEnrollmentFormSection.getFormSections();
      isFormReady = true;
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
      String orgUnit = dataObject['location'];
      await AgywDreamEnrollmentService().savingAgwyBeneficiary(
        dataObject,
        trackedEntityInstance,
        orgUnit,
        null,
        null,
        null,
        hiddenFields,
      );
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .refreshDreamsList();
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

  void autoFillInputFields(String id, dynamic value) {
    if (id == 'qZP982qpSPS') {
      int age = AppUtil.getAgeInYear(value);
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('ls9hlz2tyol', age.toString());
    }
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    autoFillInputFields(id, value);
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
                              builder: (context, enrollmentFormState, child) =>
                                  Column(
                                    children: [
                                      Container(
                                        child: Consumer<EnrollmentFormState>(
                                          builder: (context,
                                                  enrollmentFormState, child) =>
                                              EntryFormContainer(
                                            formSections: formSections,
                                            mandatoryFieldObject:
                                                mandatoryFieldObject,
                                            dataObject:
                                                enrollmentFormState.formState,
                                            onInputValueChange:
                                                onInputValueChange,
                                          ),
                                        ),
                                      ),
                                      OvcEnrollmentFormSaveButton(
                                        label: isSaving ? 'Saving ...' : 'Save',
                                        labelColor: Colors.white,
                                        buttonColor: Color(0xFF258DCC),
                                        fontSize: 15.0,
                                        onPressButton: () => onSaveAndContinue(
                                          context,
                                          enrollmentFormState.formState,
                                        ),
                                      )
                                    ],
                                  )),
                        )),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
