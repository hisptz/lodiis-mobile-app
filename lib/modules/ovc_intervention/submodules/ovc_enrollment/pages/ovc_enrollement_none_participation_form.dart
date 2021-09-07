import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_none_participation_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollement_none_participation.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentNoneParticipationForm extends StatefulWidget {
  OvcEnrollmentNoneParticipationForm({Key? key}) : super(key: key);

  @override
  _OvcEnrollmentNoneParticipationFormState createState() =>
      _OvcEnrollmentNoneParticipationFormState();
}

class _OvcEnrollmentNoneParticipationFormState
    extends State<OvcEnrollmentNoneParticipationForm> {
  List<FormSection>? formSections;
  final String label = 'None Participation Form';
  final List<String> mandatoryFields =
      OvcEnrollmentNoneParticipation.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  final String eventId = AppUtil.getUid();

  List unFilledMandatoryFields = [];

  bool isSaving = false;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = OvcEnrollmentNoneParticipation.getFormSections();
      isFormReady = true;
    });
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      await OvcEnrollmentNoneParticipationService()
          .saveNoneParticipationForm(formSections!, dataObject, eventId);
      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcList();
      Timer(Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
          setState(() {
            isSaving = false;
          });
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      });
    } else {
      unFilledMandatoryFields =
          AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
      setState(() {});
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  void autoFillInputFields(String id, dynamic value) {
    if (id == 'jVSwC6Ln95H') {
      int age = AppUtil.getAgeInYear(value);
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('mZs1YsN56cR', age.toString());
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
            margin: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 13.0,
            ),
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
                        String? currentLanguage =
                            languageTranslationState.currentLanguage;
                        return Consumer<EnrollmentFormState>(
                          builder: (context, enrollmentFormState, child) =>
                              Column(
                            children: [
                              Container(
                                child: EntryFormContainer(
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  dataObject: enrollmentFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                  unFilledMandatoryFields:
                                      unFilledMandatoryFields,
                                ),
                              ),
                              EntryFormSaveButton(
                                label: isSaving
                                    ? 'Saving ...'
                                    : currentLanguage == 'lesotho'
                                        ? 'Boloka'
                                        : 'Save',
                                labelColor: Colors.white,
                                buttonColor: Color(0xFF4B9F46),
                                fontSize: 15.0,
                                onPressButton: () => isSaving
                                    ? null
                                    : onSaveAndContinue(
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
