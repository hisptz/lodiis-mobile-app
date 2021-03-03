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
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/care_giver_age_confirmation.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollement_basic_info.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_child_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/skip_logics/ovc_house_hold_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentBasicInfoForm extends StatefulWidget {
  const OvcEnrollmentBasicInfoForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentBasicInfoFormState createState() =>
      _OvcEnrollmentBasicInfoFormState();
}

class _OvcEnrollmentBasicInfoFormState
    extends State<OvcEnrollmentBasicInfoForm> {
  List<FormSection> formSections = OvcEnrollmentBasicInfo.getFormSections();
  final String label = 'Basic caregiver information';
  final List<String> mandatoryFields =
      OvcEnrollmentBasicInfo.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool isFormReady = false;
  List unFilledMandatoryFields = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = OvcEnrollmentBasicInfo.getFormSections();
      isFormReady = true;
      evaluateSkipLogics();
    });
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

  void onSaveAndContinue(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    int careGiverAge = int.parse(dataObject['ls9hlz2tyol']);
    if (hadAllMandatoryFilled) {
      if (careGiverAge < 18) {
        Widget modal = CareGiverAgeConfirmation();
        bool response = await AppUtil.showPopUpModal(context, modal, false);
        response
            ? Navigator.canPop(context)
            : Navigator.of(context).popUntil((route) => route.isFirst);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OvcEnrollmentChildForm(),
          ),
        );
      }
    } else {
      setState(() {
        unFilledMandatoryFields = AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
      });
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
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
                    child: Consumer<LanguageTranslationState>(
                      builder: (context, languageTranslationState, child) {
                        String currentLanguage =
                            languageTranslationState.currentLanguage;
                        return Consumer<EnrollmentFormState>(
                          builder: (context, enrollmentFormState, child) =>
                              Column(
                            children: [
                              Container(
                                child: Consumer<EnrollmentFormState>(
                                  builder:
                                      (context, enrollmentFormState, child) =>
                                          EntryFormContainer(
                                    hiddenSections:
                                        enrollmentFormState.hiddenSections,
                                    hiddenFields:
                                        enrollmentFormState.hiddenFields,
                                    formSections: formSections,
                                    mandatoryFieldObject: mandatoryFieldObject,
                                    dataObject: enrollmentFormState.formState,
                                    onInputValueChange: onInputValueChange, unFilledMandatoryFields:
                                          unFilledMandatoryFields,
                                  ),
                                ),
                              ),
                              EntryFormSaveButton(
                                label: currentLanguage == 'lesotho'
                                    ? 'Boloka ebe u fetela pele'
                                    : 'Save and Continue',
                                labelColor: Colors.white,
                                buttonColor: Color(0xFF4B9F46),
                                fontSize: 15.0,
                                onPressButton: () => onSaveAndContinue(
                                  context,
                                  enrollmentFormState.formState,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
