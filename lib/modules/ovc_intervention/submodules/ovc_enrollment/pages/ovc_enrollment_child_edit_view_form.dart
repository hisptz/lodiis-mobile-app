import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_child_services.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';
import 'package:provider/provider.dart';


class OvcEnrollmentChildEditViewForm extends StatefulWidget {
  const OvcEnrollmentChildEditViewForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentChildEditViewFormState createState() =>
      _OvcEnrollmentChildEditViewFormState();

}

class _OvcEnrollmentChildEditViewFormState
    extends State<OvcEnrollmentChildEditViewForm> {

  List<FormSection> formSections;
  final String label = 'Child enrolment form';

  bool isSaving = false;
  bool isFormReady = false;

  List<String> mandatoryFields;
  final Map mandatoryFieldObject = Map();


  @override
  void initState() {
    super.initState();
    formSections = OvcEnrollmentChild.getFormSections();
    mandatoryFields = OvcEnrollmentChild.getMandatoryField();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      isFormReady = true;
    });
  }

  void onSaveForm(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      List<Map> childrenObjects = [];
      childrenObjects.add(dataObject);
      String parentTrackedEntityInstance =
          dataObject['parentTrackedEntityInstance'];
      String orgUnit = dataObject['orgUnit'];
      String enrollmentDate = dataObject['enrollmentDate'];
      String incidentDate = dataObject['incidentDate'];
      bool shouldEnroll = dataObject['trackedEntityInstance'] == null;
      await OvcEnrollmentChildService().savingChildrenEnrollmentForms(
        parentTrackedEntityInstance,
        orgUnit,
        childrenObjects,
        enrollmentDate,
        incidentDate,
        shouldEnroll,
        [],
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
                    : Column(children: [
                        Container(
                          child: Consumer<OvcHouseHoldCurrentSelectionState>(
                            builder: (context,
                                ovcHouseHoldCurrentSelectionState, child) {
                              OvcHouseHold currentOvcHouseHold =
                                  ovcHouseHoldCurrentSelectionState
                                      .currentOvcHouseHold;
                              return OvcHouseHoldInfoTopHeader(
                                currentOvcHouseHold: currentOvcHouseHold,
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 13.0),
                          child: Consumer<EnrollmentFormState>(
                            builder: (context, enrollmentFormState, child) {
                              return Column(
                                children: [
                                  Container(
                                    child: EntryFormContainer(
                                      formSections: formSections,
                                      mandatoryFieldObject:
                                          mandatoryFieldObject,
                                      isEditableMode:
                                          enrollmentFormState.isEditableMode,
                                      dataObject: enrollmentFormState.formState,
                                      onInputValueChange: onInputValueChange,
                                    ),
                                  ),
                                  Visibility(
                                    visible: enrollmentFormState.isEditableMode,
                                    child: OvcEnrollmentFormSaveButton(
                                      label: isSaving ? 'Saving ...' : 'Save',
                                      labelColor: Colors.white,
                                      buttonColor: Color(0xFF4B9F46),
                                      fontSize: 15.0,
                                      onPressButton: () => onSaveForm(context,
                                          enrollmentFormState.formState),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ]),
              ),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
