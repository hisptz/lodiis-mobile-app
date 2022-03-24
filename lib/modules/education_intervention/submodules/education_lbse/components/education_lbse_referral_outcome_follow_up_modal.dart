import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/skip_logics/education_lbse_referral_outcome_follow_up_skip_logic.dart';
import 'package:provider/provider.dart';

class EducationLbseRefferalOutcomeFollowUpModal extends StatefulWidget {
  const EducationLbseRefferalOutcomeFollowUpModal({
    Key? key,
    required this.formSections,
    required this.mandatoryFields,
  }) : super(key: key);

  final List<FormSection> formSections;
  final List mandatoryFields;

  @override
  State<EducationLbseRefferalOutcomeFollowUpModal> createState() =>
      _EducationLbseRefferalOutcomeFollowUpModalState();
}

class _EducationLbseRefferalOutcomeFollowUpModalState
    extends State<EducationLbseRefferalOutcomeFollowUpModal> {
  Map mandatoryFieldObject = {};
  List<FormSection>? defaultFormSections;
  List<FormSection>? formSections;
  List unFilledMandatoryFields = [];
  List mandatoryFields = [];
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    setFormSections();
    Timer(const Duration(seconds: 1), () {
      evaluateSkipLogics();
      isFormReady = true;
      setState(() {});
    });
  }

  void setMandatoryFields(Map<dynamic, dynamic> dataObject) {
    unFilledMandatoryFields =
        AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
    setState(() {});
  }

  setFormSections() {
    EducationBeneficiary lbseBeneficiary =
        Provider.of<EducationInterventionCurrentSelectionState>(context,
                listen: false)
            .currentBeneficiciary!;
    defaultFormSections = widget.formSections;
    mandatoryFields.addAll(widget.mandatoryFields);
    if (lbseBeneficiary.enrollmentOuAccessible!) {
      formSections = defaultFormSections;
    } else {
      FormSection serviceProvisionForm =
          AppUtil.getServiceProvisionLocationSection(
        inputColor: LbseInterventionConstant.inputColor,
        labelColor: LbseInterventionConstant.labelColor,
        sectionLabelColor: LbseInterventionConstant.inputColor,
        allowedSelectedLevels: LbseInterventionConstant.allowedSelectedLevels,
        program: LbseInterventionConstant.program,
      );
      formSections = [serviceProvisionForm, ...defaultFormSections!];
      mandatoryFields.addAll(FormUtil.getFormFieldIds(
        [serviceProvisionForm],
        includeLocationId: true,
      ));
    }
    for (String fieldId in mandatoryFields) {
      mandatoryFieldObject[fieldId] = true;
    }
  }

  evaluateSkipLogics() {
    Timer(
      const Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await EducationLbseReferralOutcomeFollowUpSkipLogic.evaluateSkipLogics(
          context,
          widget.formSections,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
  ) async {
    EducationBeneficiary? lbseBeneficiary =
        Provider.of<EducationInterventionCurrentSelectionState>(context,
                listen: false)
            .currentBeneficiciary;
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(widget.mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      String referralOutcomeToReferralOutComeFollowingUpLinkage =
          LbseInterventionConstant
              .referralOutcomeToReferralOutComeFollowingUpLinkage;
      dataObject[referralOutcomeToReferralOutComeFollowingUpLinkage] =
          dataObject[referralOutcomeToReferralOutComeFollowingUpLinkage] ??
              AppUtil.getUid();
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      List<String> hiddenFields = [
        referralOutcomeToReferralOutComeFollowingUpLinkage
      ];
      String orgUnit = dataObject['location'] ?? lbseBeneficiary?.orgUnit;
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          LbseInterventionConstant.program,
          LbseInterventionConstant.referralOutcomeFollowUpProgamStage,
          orgUnit,
          defaultFormSections!,
          dataObject,
          eventDate,
          lbseBeneficiary?.id,
          eventId,
          hiddenFields,
        );
        Timer(const Duration(seconds: 1), () {
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          Provider.of<ServiceEventDataState>(context, listen: false)
              .resetServiceEventDataState(lbseBeneficiary?.id);
          Navigator.pop(context);
        });
      } catch (e) {
        Timer(const Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
              message: e.toString(),
              position: ToastGravity.BOTTOM,
            );
          });
        });
      }
    } else {
      unFilledMandatoryFields = AppUtil.getUnFilledMandatoryFields(
          widget.mandatoryFields, dataObject);
      setState(() {});
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
      String? currentLanguage = languageTranslationState.currentLanguage;
      return Consumer<ServiceFormState>(
          builder: (context, serviceFormState, child) {
        return Container(
          child: !isFormReady
              ? const CircularProcessLoader(
                  color: Colors.blueGrey,
                )
              : Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                        left: 13.0,
                        right: 13.0,
                      ),
                      child: EntryFormContainer(
                        elevation: 0.0,
                        hiddenFields: serviceFormState.hiddenFields,
                        hiddenSections: serviceFormState.hiddenSections,
                        formSections: formSections,
                        mandatoryFieldObject: mandatoryFieldObject,
                        hiddenInputFieldOptions:
                            serviceFormState.hiddenInputFieldOptions,
                        unFilledMandatoryFields: unFilledMandatoryFields,
                        isEditableMode: serviceFormState.isEditableMode,
                        dataObject: serviceFormState.formState,
                        onInputValueChange: onInputValueChange,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                      child: Visibility(
                        visible: serviceFormState.isEditableMode,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFF009688),
                                ),
                                onPressed: () => !isSaving
                                    ? onSaveForm(
                                        context,
                                        serviceFormState.formState,
                                      )
                                    : null,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 22.0,
                                  ),
                                  child: Text(
                                    isSaving
                                        ? 'SAVING FOLLOW UP ...'
                                        : currentLanguage == 'lesotho'
                                            ? 'SAVE FOLLOW UP'
                                            : 'SAVE FOLLOW UP',
                                    style: const TextStyle().copyWith(
                                      color: const Color(0xFFFAFAFA),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      });
    });
  }
}
