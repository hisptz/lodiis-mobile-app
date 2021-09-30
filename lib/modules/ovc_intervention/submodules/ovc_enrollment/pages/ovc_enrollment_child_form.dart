import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/add_child_confirmation.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/enrolled_children_list.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollment_child_form_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_household_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/skip_logics/ovc_child_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentChildForm extends StatefulWidget {
  const OvcEnrollmentChildForm({Key? key}) : super(key: key);

  @override
  _OvcEnrollmentChildFormState createState() => _OvcEnrollmentChildFormState();
}

class _OvcEnrollmentChildFormState extends State<OvcEnrollmentChildForm> {
  final List<FormSection> formSections = OvcEnrollmentChild.getFormSections();
  final String label = 'Child vulnerability form';
  final List<Map?> childMapObjects = [];
  bool isLoading = true;
  Map? childMapObject;
  final List<String> mandatoryFields = OvcEnrollmentChild.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool onSkipButton = false;
  List unFilledMandatoryFields = [];

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

  void resetMapObject(Map? map) {
    setState(() {
      if (map != null) {
        //Check for Duplicates
        if (!isADuplicateChildObject(map)) {
          map['fullName'] = '${map['WTZ7GLTrE8Q']} ${map['rSP9c21JsfC']}';
          childMapObjects.add(map);
        }
      }
      childMapObject = Map();
      childMapObject!['PN92g65TkVI'] = 'Active';
      isLoading = false;
      evaluateSkipLogics();
    });
  }
    evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await OvcChildEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }



  assignInputFieldValue(
    String inputFieldId,
    String? value,
  ) {
    childMapObject![inputFieldId] = value;
  }

  assignPrimaryVulnerability(Map? dataObject) {
    List<String> vulnerabilities = [
      'wmKqYZML8GA',
      'GMcljM7jbNG',
      'br1xvwAQ6el',
      'ZKMhrjWoXnD',
      'Gkjp5XZD70V',
      'UeF4OvjIIEK',
      'YR7Xxk14qoP'
    ];
    List<String> primaryVulnerabilitiesOptions = [
      'Child living with HIV',
      'HIV exposed infants',
      'Child of a sex worker (FSW)',
      'Child of PLHIV',
      'Child exposed/experiencing violence and abuse (Survivors of Vac)',
      'Orphan',
      'Child living with disability'
    ];
    for (var vulnerabilityKey in vulnerabilities) {
      if (dataObject![vulnerabilityKey] == true) {
        assignInputFieldValue(
            OvcEnrollmentChildConstant.primaryVulnerabilityKey,
            primaryVulnerabilitiesOptions[
                vulnerabilities.indexOf(vulnerabilityKey)]);
        break;
      } else
        continue;
    }
    if (vulnerabilities.every((element) =>
        (dataObject![element] == false || dataObject[element] == null))) {
      assignInputFieldValue(
          OvcEnrollmentChildConstant.primaryVulnerabilityKey, null);
    }
  }

  void updateOvcCount() {
    int male = 0;
    int female = 0;
    for (Map? childMapObject in childMapObjects) {
      String? sexValue = childMapObject!['vIX4GTSCX4P'];
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
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, childMapObject!);
    if (hadAllMandatoryFilled) {
      String name = childMapObject!['WTZ7GLTrE8Q'] ?? '';
      Widget modal = AddChildConfirmation(name: name);
      bool response = await AppUtil.showPopUpModal(context, modal, false);
      CurrentUser? user = await (UserService().getCurrentUser());
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
            if (!isADuplicateChildObject(childMapObject)) {
              // Assign implementing partner and service provider
              childMapObject!['klLkGxy328c'] =
                  childMapObject!['klLkGxy328c'] ?? user!.implementingPartner;
              childMapObject!['DdnlE8kmIkT'] =
                  childMapObject!['DdnlE8kmIkT'] ?? user!.username;
              if (user!.subImplementingPartner != '') {
                childMapObject!['fQInK8s2RNR'] =
                    childMapObject!['fQInK8s2RNR'] ??
                        user.subImplementingPartner;
              }
              childMapObject!['fullName'] =
                  '${childMapObject!['WTZ7GLTrE8Q']} ${childMapObject!['rSP9c21JsfC']}';
              childMapObjects.add(childMapObject);
            }
          });
          updateOvcCount();
          Provider.of<EnrollmentFormState>(context, listen: false)
              .setFormFieldState('children', childMapObjects);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OvcEnrollmentHouseholdForm(),
            ),
          );
        }
      }
    } else {
      setState(() {
        unFilledMandatoryFields = AppUtil.getUnFilledMandatoryFields(
            mandatoryFields, childMapObject!);
      });
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  void onInputValueChange(String id, dynamic value) {
    childMapObject![id] = value;
    evaluateSkipLogics();
  }

  void onSkip(Map? childMapObject) {
    setState(() {
      if (isADuplicateChildObject(childMapObject)) {
        childMapObject!['fullName'] =
            '${childMapObject['WTZ7GLTrE8Q']} ${childMapObject['rSP9c21JsfC']}';
        childMapObjects.add(childMapObject);
      }
    });
    updateOvcCount();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('children', childMapObjects);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OvcEnrollmentHouseholdForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<InterventionCardState>(
            builder: (context, interventionCardState, child) {
              InterventionCard activeInterventionProgram =
                  interventionCardState.currentInterventionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            child: Consumer<LanguageTranslationState>(
              builder: (context, languageTranslationState, child) {
                String? currentLanguage =
                    languageTranslationState.currentLanguage;
                return Consumer<EnrollmentFormState>(builder:(context,enrolmentState,child){
                  return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 13.0,
                  ),
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
                            childMapObjects.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 12.0,
                                    ),
                                    child: EnrolledChildrenList(childMapObjects
                                        .map<String?>(
                                            (child) => child!['fullName'])
                                        .toList()),
                                  )
                                : Container(),
                            Container(
                              child: EntryFormContainer(
                                formSections: formSections,
                                hiddenFields:enrolmentState. hiddenFields,
                                hiddenSections:enrolmentState. hiddenSections,
                                hiddenInputFieldOptions:
                                   enrolmentState. hiddenInputFieldOptions,
                                mandatoryFieldObject: mandatoryFieldObject,
                                dataObject: childMapObject,
                                onInputValueChange: onInputValueChange,
                                unFilledMandatoryFields:
                                    unFilledMandatoryFields,
                              ),
                            ),
                            EntryFormSaveButton(
                              label: currentLanguage == 'lesotho'
                                  ? 'Boloka ebe u fetela pele'
                                  : 'Save and Continue',
                              labelColor: Colors.white,
                              buttonColor: Color(0xFF4B9F46),
                              fontSize: 15.0,
                              onPressButton: () => onSaveAndContinue(context),
                            ),
                            Visibility(
                              visible: onSkipButton,
                              child: Container(
                                child: TextButton(
                                  onPressed: () => onSkip(childMapObject),
                                  child: Text(
                                    currentLanguage == 'lesotho'
                                        ? 'Feta'
                                        : 'Skip',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF4B9F46),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                );
             
             
                } );
             
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer(),
      ),
    );
  }

  bool isADuplicateChildObject(Map? map) {
    bool isDuplicate = false;
    childMapObjects.forEach((child) {
      if (child!['WTZ7GLTrE8Q'] == map!['WTZ7GLTrE8Q']) {
        //Compares if firstName are equal
        isDuplicate = true;
      }
    });
    return isDuplicate;
  }
}
