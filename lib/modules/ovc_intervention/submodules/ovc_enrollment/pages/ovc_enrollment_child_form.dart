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
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/add_child_confirmation.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_house_hold_form.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentChildForm extends StatefulWidget {
  const OvcEnrollmentChildForm({Key key}) : super(key: key);
  @override
  _OvcEnrollmentChildFormState createState() => _OvcEnrollmentChildFormState();
}

class _OvcEnrollmentChildFormState extends State<OvcEnrollmentChildForm> {
  final List<FormSection> formSections = OvcEnrollmentChild.getFormSections();
  final String label = 'Child enrolment form';
  final List<Map> childMapObjects = [];
  bool isLoading = true;
  Map childMapObject;
  final List<String> mandatoryFields = OvcEnrollmentChild.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool onSkipButton = false;

  Map hiddenFields = Map();
  Map hiddenSections = Map();

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
    });
    resetMapObject(childMapObject);
  }

  void resetMapObject(Map map) {
    setState(() {
      if (map != null) {
        childMapObjects.add(map);
      }
      childMapObject = Map();
      childMapObject['PN92g65TkVI'] = 'Active';
      isLoading = false;
      evaluateSkipLogics();
    });
  }

  evaluateSkipLogics() async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (String inputFieldId in inputFieldIds) {
      String value = '${childMapObject[inputFieldId]}';
      if (inputFieldId == 'qZP982qpSPS') {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue('ls9hlz2tyol', age.toString());
      }
      if (inputFieldId == 'UeF4OvjIIEK' &&
          (value.isEmpty || '$value'.trim() != 'true')) {
        hiddenFields['nOgf8LKXS4k'] = true;
      }
      if (inputFieldId == 'Gkjp5XZD70V' &&
          (value.isEmpty || '$value'.trim() != 'true')) {
        hiddenFields['Sa0KVprHUr7'] = true;
        hiddenFields['XZh0Uew9Xk0'] = true;
        hiddenFields['wtrZQadTkOL'] = true;
        hiddenFields['Mc3k3bSwXNe'] = true;
        hiddenFields['CePNVGSnj00'] = true;
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'Mc3k3bSwXNe' &&
          (value.isEmpty || '$value'.trim() != 'true')) {
        hiddenFields['CePNVGSnj00'] = true;
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'CePNVGSnj00' &&
          (value.isEmpty || '$value'.trim() != 'Other')) {
        hiddenFields['GM2mJDlGZin'] = true;
      }
    }
    for (String sectionId in hiddenSections.keys) {
      List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections
          .where((formSection) => formSection.id == sectionId)
          .toList());
      for (String inputFieldId in inputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    setState(() {});
  }

  resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(inputFieldId, null);
      }
    }
  }

  assignInputFieldValue(
    String inputFieldId,
    String value,
  ) {
    childMapObject[inputFieldId] = value;
  }

  void updateOvcCount() {
    int male = 0;
    int female = 0;
    for (Map childMapObject in childMapObjects) {
      String sexValue = childMapObject['vIX4GTSCX4P'];
      if (sexValue != null) {
        if (sexValue == 'Male') {
          male++;
        } else if (sexValue == 'Female') {
          female++;
        }
      }
    }
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('kQehaqmaygZ', male.toString());
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('BXUNH6LXeGA', female.toString());
  }

  void onSaveAndContinue(BuildContext context) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, childMapObject);
    if (hadAllMandatoryFilled) {
      String name = childMapObject['WTZ7GLTrE8Q'] ?? '';
      Widget modal = AddChildConfirmation(name: name);
      bool response = await AppUtil.showPopUpModal(context, modal, false);
      if (response != null) {
        if (response) {
          setState(() {
            isLoading = true;
            onSkipButton = true;
          });
          Timer(Duration(milliseconds: 500),
              () => resetMapObject(childMapObject));
        } else {
          setState(() {
            childMapObjects.add(childMapObject);
          });
          updateOvcCount();
          Provider.of<EnrollmentFormState>(context, listen: false)
              .setFormFieldState('children', childMapObjects);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OvcEnrollmentHouseHoldForm(),
              ));
        }
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
    }
  }

  void onInputValueChange(String id, dynamic value) {
    childMapObject[id] = value;
    evaluateSkipLogics();
  }

  void onSkip(Map childMapObject) {
    setState(() {
      childMapObjects.add(childMapObject);
    });
    updateOvcCount();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('children', childMapObjects);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcEnrollmentHouseHoldForm(),
        ));
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
                  child: isLoading
                      ? Column(
                          children: [
                            Center(
                              child: CircularProcessLoader(
                                color: Colors.blueGrey,
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              child: EntryFormContainer(
                                formSections: formSections,
                                hiddenFields: hiddenFields,
                                hiddenSections: hiddenSections,
                                mandatoryFieldObject: mandatoryFieldObject,
                                dataObject: childMapObject,
                                onInputValueChange: onInputValueChange,
                              ),
                            ),
                            OvcEnrollmentFormSaveButton(
                              label: 'Save and Continue',
                              labelColor: Colors.white,
                              buttonColor: Color(0xFF4B9F46),
                              fontSize: 15.0,
                              onPressButton: () => onSaveAndContinue(context),
                            ),
                            Visibility(
                              visible: onSkipButton,
                              child: Container(
                                child: FlatButton(
                                  onPressed: () => onSkip(childMapObject),
                                  child: Text(
                                    'Skip',
                                    style: TextStyle().copyWith(
                                        color: Color(0xFF4B9F46),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
