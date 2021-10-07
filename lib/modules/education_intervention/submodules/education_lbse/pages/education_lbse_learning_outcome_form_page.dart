import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/education_lbse_learning_outcome_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/education_lbse_learning_referral_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/skip_logics/education_lbse_learning_outcome_skip_logic.dart';
import 'package:provider/provider.dart';

class EducationLbseLearningOutcomeFormPage extends StatefulWidget {
  const EducationLbseLearningOutcomeFormPage({
    Key? key,
    required this.isNewLearningOutcomeForm,
  }) : super(key: key);
  final bool isNewLearningOutcomeForm;

  @override
  State<EducationLbseLearningOutcomeFormPage> createState() =>
      _EducationLbseLearningOutcomeFormPageState();
}

class _EducationLbseLearningOutcomeFormPageState
    extends State<EducationLbseLearningOutcomeFormPage> {
  final String label = "Learning Outcome Form";
  List<FormSection>? formSections;
  final List<String> mandatoryFields =
      EducationLbseLearningOutcomeForm.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  List unFilledMandatoryFields = [];
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = EducationLbseLearningOutcomeForm.getFormSections();
    if (widget.isNewLearningOutcomeForm) {
      formSections!.addAll(
          EducationLbseLearningOutcomeForm.getReferralCheckFormSections());
      formSections!.addAll(EducationLbseReferralForm.getFormSections());
      mandatoryFields.addAll(EducationLbseReferralForm.getMandatoryField());
      mandatoryFields
          .add(EducationLbseLearningOutcomeForm.learningOutComeToReferralCheck);
    }
    for (String id in mandatoryFields) {
      mandatoryFieldObject[id] = true;
    }
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await EducationLbseLearningOutcomeSkipLogic.evaluateSkipLogics(
          context,
          formSections!,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    onUpdateFormAutoSaveState(context);
  }

  bool isLearningOutcomeReferralNeeded(Map dataObject) {
    String inputFieldId =
        EducationLbseLearningOutcomeForm.learningOutComeToReferralCheck;
    String value = '${dataObject[inputFieldId]}';
    return widget.isNewLearningOutcomeForm && '$value' == 'true';
  }

  List<String> getMandatoryFielOnFormSubmission(bool isReferralNeed) {
    List<String> allMandatoryFields =
        widget.isNewLearningOutcomeForm && isReferralNeed
            ? mandatoryFields
            : EducationLbseLearningOutcomeForm.getMandatoryField();
    allMandatoryFields
        .add(EducationLbseLearningOutcomeForm.learningOutComeToReferralCheck);
    return allMandatoryFields.toSet().toList();
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    EducationBeneficiary lbseBeneficiary,
  ) async {
    bool isReferralNeed = isLearningOutcomeReferralNeeded(dataObject);
    List<String> allMandatoryFields =
        getMandatoryFielOnFormSubmission(isReferralNeed);
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(allMandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      String learningOutcomeToReferralLinkage =
          LbseInterventionConstant.learningOutcomeToReferralLinkage;
      String referralToReferralOutcomeLinkage =
          LbseInterventionConstant.referralToReferralOutcomeLinkage;
      dataObject[learningOutcomeToReferralLinkage] =
          dataObject[learningOutcomeToReferralLinkage] ?? AppUtil.getUid();
      dataObject[referralToReferralOutcomeLinkage] =
          dataObject[referralToReferralOutcomeLinkage] ?? AppUtil.getUid();
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      List<String> hiddenFields = [
        EducationLbseLearningOutcomeForm.learningOutComeToReferralCheck,
        learningOutcomeToReferralLinkage
      ];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          LbseInterventionConstant.program,
          LbseInterventionConstant.learningOutcomeProgamStage,
          lbseBeneficiary.orgUnit,
          formSections!,
          dataObject,
          eventDate,
          lbseBeneficiary.id,
          eventId,
          hiddenFields,
        );
        if (isReferralNeed) {
          hiddenFields = [
            learningOutcomeToReferralLinkage,
            referralToReferralOutcomeLinkage
          ];
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            LbseInterventionConstant.program,
            LbseInterventionConstant.referralProgamStage,
            lbseBeneficiary.orgUnit,
            formSections!,
            dataObject,
            eventDate,
            lbseBeneficiary.id,
            eventId,
            hiddenFields,
          );
        }
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(lbseBeneficiary.id);
        Timer(Duration(seconds: 1), () {
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          clearFormAutoSaveState(
            context,
            lbseBeneficiary.id,
            eventId ?? '',
          );
          Navigator.pop(context);
        });
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
          });
        });
      }
    } else {
      setState(() {
        unFilledMandatoryFields =
            AppUtil.getUnFilledMandatoryFields(allMandatoryFields, dataObject);
      });
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
    }
  }

  void clearFormAutoSaveState(
      BuildContext context, String? beneficiaryId, String eventId) async {
    String formAutoSaveId =
        "${LbseRoutesConstant.learningOutcomePageModule}_${beneficiaryId}_$eventId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    var lbseBeneficiary =
        Provider.of<EducationInterventionCurrentSelectionState>(context,
                listen: false)
            .currentBeneficiciary;
    String? beneficiaryId = lbseBeneficiary!.id;
    Map dataObject =
        Provider.of<ServiceFormState>(context, listen: false).formState;
    String eventId = dataObject['eventId'] ?? '';
    String id =
        "${LbseRoutesConstant.learningOutcomePageModule}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: LbseRoutesConstant.learningOutcomePageModule,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : LbseRoutesConstant.learningOutcomeNextPageModule
          : LbseRoutesConstant.learningOutcomePageModule,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
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
              return Consumer<EducationInterventionCurrentSelectionState>(
                builder: (context, educationInterventionCurrentSelectionState,
                    child) {
                  return Consumer<ServiceFormState>(
                    builder: (context, serviceFormState, child) {
                      EducationBeneficiary? lbseBeneficiary =
                          educationInterventionCurrentSelectionState
                              .currentBeneficiciary;
                      return Container(
                        child: Column(
                          children: [
                            EducationBeneficiaryTopHeader(
                              educationBeneficiary: lbseBeneficiary!,
                            ),
                            Container(
                              child: !isFormReady
                                  ? Container(
                                      child: CircularProcessLoader(
                                        color: Colors.blueGrey,
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10.0,
                                            left: 13.0,
                                            right: 13.0,
                                          ),
                                          child: EntryFormContainer(
                                            hiddenFields:
                                                serviceFormState.hiddenFields,
                                            hiddenSections:
                                                serviceFormState.hiddenSections,
                                            formSections: formSections,
                                            mandatoryFieldObject:
                                                mandatoryFieldObject,
                                            hiddenInputFieldOptions:
                                                serviceFormState
                                                    .hiddenInputFieldOptions,
                                            unFilledMandatoryFields:
                                                unFilledMandatoryFields,
                                            isEditableMode:
                                                serviceFormState.isEditableMode,
                                            dataObject:
                                                serviceFormState.formState,
                                            onInputValueChange:
                                                onInputValueChange,
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              serviceFormState.isEditableMode,
                                          child: EntryFormSaveButton(
                                            label: isSaving
                                                ? 'Saving ...'
                                                : currentLanguage == 'lesotho'
                                                    ? 'Boloka'
                                                    : 'Save',
                                            labelColor: Colors.white,
                                            buttonColor: Color(0xFF009688),
                                            fontSize: 15.0,
                                            onPressButton: () => onSaveForm(
                                              context,
                                              serviceFormState.formState,
                                              lbseBeneficiary,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
