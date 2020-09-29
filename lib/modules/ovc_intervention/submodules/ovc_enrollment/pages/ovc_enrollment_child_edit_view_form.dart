import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
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
  final String label = 'Child form';

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

  void updateOvcCount() {
    //@TODO update caregiver values
    // int male = 0;
    // int female = 0;
    // for (Map childMapObject in childMapObjects) {
    //   String sexValue = childMapObject['vIX4GTSCX4P'];
    //   if (sexValue != null) {
    //     if (sexValue == 'Male') {
    //       male++;
    //     } else if (sexValue == 'Female') {
    //       female++;
    //     }
    //   }
    // }
    // Provider.of<EnrollmentFormState>(context, listen: false)
    //     .setFormFieldState('kQehaqmaygZ', male.toString());
    // Provider.of<EnrollmentFormState>(context, listen: false)
    //     .setFormFieldState('BXUNH6LXeGA', female.toString());
  }

  void onSaveForm(BuildContext context, Map dataObject) async {
// String parentTrackedEntityInstance,
//     String orgUnit,
//     List<Map> childrenObjects,
//     String enrollment,
//     String enrollmentDate,
//     String incidentDate,
    List<Map> childrenObjects = [];
    childrenObjects.add(dataObject);
    print(dataObject);

    // bool hadAllMandatoryFilled =
    //     AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, childMapObject);
    // if (hadAllMandatoryFilled) {
    //   String name = childMapObject['s1eRvsL2Ly4'] ?? '';
    //   Widget modal = AddChildConfirmation(name: name);
    //   bool response = await AppUtil.showPopUpModal(context, modal);
    //   if (response != null) {
    //     if (response) {
    //       setState(() {
    //         isSaving = true;
    //       });
    //       Timer(Duration(milliseconds: 500),
    //           () => resetMapObject(childMapObject));
    //     } else {
    //       setState(() {
    //         childMapObjects.add(childMapObject);
    //       });
    //       updateOvcCount();
    //       Provider.of<EnrollmentFormState>(context, listen: false)
    //           .setFormFieldState('children', childMapObjects);
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => OvcEnrollmentHouseHoldForm(),
    //           ));
    //     }
    //   }
    // } else {
    //   AppUtil.showToastMessage(
    //       message: 'Please fill all mandatory field',
    //       position: ToastGravity.TOP);
    // }
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
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
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
                          builder: (context, enrollmentFormState, child) {
                            return Column(
                              children: [
                                Container(
                                  child: EntryFormContainer(
                                    formSections: formSections,
                                    mandatoryFieldObject: mandatoryFieldObject,
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
                                    onPressButton: () => onSaveForm(
                                        context, enrollmentFormState.formState),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
              ),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
