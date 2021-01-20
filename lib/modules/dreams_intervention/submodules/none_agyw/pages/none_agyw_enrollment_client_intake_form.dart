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
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/none_agyw_enrollment_client_intake.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/skip_logics/none_agyw_enrollment_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';
import 'none_agyw_enrollment_prep_screening_form.dart';

class NoneAgywEnrollmentClientInTakeForm extends StatefulWidget {
  const NoneAgywEnrollmentClientInTakeForm({Key key}) : super(key: key);

  @override
  _NoneAgywEnrollmentClientInTakeFormState createState() =>
      _NoneAgywEnrollmentClientInTakeFormState();
}

class _NoneAgywEnrollmentClientInTakeFormState
    extends State<NoneAgywEnrollmentClientInTakeForm> {
  final List<String> mandatoryFields =
      NoneAgywEnrollmentFormSection.getMandatoryField();
  List<FormSection> formSections;
  final Map mandatoryFieldObject = Map();
  final String label = 'Non AGYW PReP Intake';
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = NoneAgywEnrollmentFormSection.getFormSections();
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
        await NoneAgywEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) async {
    CurrentUser user = await UserService().getCurrentUser();
    dataObject['klLkGxy328c'] =
        dataObject['klLkGxy328c'] ?? user.implementingPartner;
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoneAgywEnrollmentPrepScreeningForm(),
          ));
    } else {
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
              body: !isFormReady
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
                      margin: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 13.0),
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
                                    dataObject: enrollmentFormState.formState,
                                    mandatoryFieldObject: mandatoryFieldObject,
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
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
