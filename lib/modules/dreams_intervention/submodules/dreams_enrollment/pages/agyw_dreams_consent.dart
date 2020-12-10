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
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/skip_logics/agyw_dreams_enrollment_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';
import 'agyw_dreams_risk_assessment.dart';

class AgywDreamsConsentForm extends StatefulWidget {
  const AgywDreamsConsentForm({Key key}) : super(key: key);

  @override
  _AgywEnrollmentConsetFormState createState() =>
      _AgywEnrollmentConsetFormState();
}

class _AgywEnrollmentConsetFormState extends State<AgywDreamsConsentForm> {
  List<FormSection> formSections;
  final String label = 'Consent Form';
  final List<String> mandatoryFields =
      AgywEnrollmentConcent.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = AgywEnrollmentConcent.getFormSections();
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
        await AgywDreamsEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      AppUtil.showToastMessage(
          message: 'Ensure you have documented AGYW consent on File',
          position: ToastGravity.TOP);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgywDreamServiceForm(),
          ));
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
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
                                    child: EntryFormContainer(
                                      hiddenFields:
                                          enrollmentFormState.hiddenFields,
                                      hiddenSections:
                                          enrollmentFormState.hiddenSections,
                                      formSections: formSections,
                                      mandatoryFieldObject:
                                          mandatoryFieldObject,
                                      dataObject: enrollmentFormState.formState,
                                      onInputValueChange: onInputValueChange,
                                    ),
                                  ),
                                  EntryFormSaveButton(
                                    label: currentLanguage == 'lesotho'
                                        ? 'Boloka ebe u fetela pele'
                                        : 'Save and Continue',
                                    labelColor: Colors.white,
                                    buttonColor: Color(0xFF258DCC),
                                    fontSize: 15.0,
                                    onPressButton: () => onSaveAndContinue(
                                        context, enrollmentFormState.formState),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
