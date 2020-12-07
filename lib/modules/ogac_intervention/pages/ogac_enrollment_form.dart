import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/models/ogac_enrollment_form_section.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/services/ogac_enrollment_service.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/skip_logics/ogac_intervention_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class OgacEnrollemntForm extends StatefulWidget {
  OgacEnrollemntForm({Key key}) : super(key: key);

  @override
  _OgacEnrollemntFormState createState() => _OgacEnrollemntFormState();
}

class _OgacEnrollemntFormState extends State<OgacEnrollemntForm> {
  List<FormSection> formSections;
  List<FormSection> stageFormSections;
  final String label = 'OGAC Enrollment Form';
  final List<String> mandatoryFields =
      OgacInterventionFormSection.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool isSaving = false;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = OgacInterventionFormSection.getEnrollmentFormSections();
      stageFormSections = OgacInterventionFormSection.getStageFormSections();
      formSections.addAll(stageFormSections);
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
        await OgacInterventionSkipLogic.evaluateSkipLogics(
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
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      String trackedEntityInstance =
          dataObject['trackedEntityInstance'] ?? AppUtil.getUid();
      String orgUnit = dataObject['location'];
      String enrollment = dataObject['enrollment'];
      String enrollmentDate = dataObject['enrollmentDate'];
      String incidentDate = dataObject['incidentDate'];
      List<String> hiddenFields = [
        BeneficiaryIdentification.beneficiaryId,
        BeneficiaryIdentification.beneficiaryIndex,
      ];
      try {
        await OgacEnrollementservice().savingOgacBeneficiaryEnrollement(
          dataObject,
          trackedEntityInstance,
          orgUnit,
          enrollment,
          enrollmentDate,
          incidentDate,
          hiddenFields,
        );
        Provider.of<OgacInterventionListState>(context, listen: false)
            .refreshOgacList();
        Timer(Duration(seconds: 1), () {
          if (Navigator.canPop(context)) {
            setState(() {
              isSaving = false;
            });
            String currentLanguage =
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
      } catch (e) {
        setState(() {
          isSaving = false;
        });
        AppUtil.showToastMessage(
            message: e.toString(), position: ToastGravity.BOTTOM);
      }
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
                                  isEditableMode:
                                      enrollmentFormState.isEditableMode,
                                  hiddenFields:
                                      enrollmentFormState.hiddenFields,
                                  hiddenSections:
                                      enrollmentFormState.hiddenSections,
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  dataObject: enrollmentFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                ),
                              ),
                              Container(
                                child: Visibility(
                                  visible: enrollmentFormState.isEditableMode,
                                  child: EntryFormSaveButton(
                                    label: isSaving
                                        ? 'Saving ...'
                                        : currentLanguage == 'lesotho'
                                            ? 'Boloka'
                                            : 'Save',
                                    labelColor: Colors.white,
                                    buttonColor: Color(0xFFF05A2A),
                                    fontSize: 15.0,
                                    onPressButton: () => onSaveAndContinue(
                                      context,
                                      enrollmentFormState.formState,
                                    ),
                                  ),
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
      ),
    );
  }
}
