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
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/skip_logics/education_lbse_referral_outcome_follow_up_skip_logic.dart';
import 'package:provider/provider.dart';

class EducationLbseRefferalOutcomeFollowingUpModal extends StatefulWidget {
  const EducationLbseRefferalOutcomeFollowingUpModal({
    Key? key,
    required this.formSections,
    required this.mandatoryFields,
  }) : super(key: key);

  final List<FormSection> formSections;
  final List mandatoryFields;

  @override
  State<EducationLbseRefferalOutcomeFollowingUpModal> createState() =>
      _EducationLbseRefferalOutcomeFollowingUpModalState();
}

class _EducationLbseRefferalOutcomeFollowingUpModalState
    extends State<EducationLbseRefferalOutcomeFollowingUpModal> {
  Map mandatoryFieldObject = Map();
  List unFilledMandatoryFields = [];
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in widget.mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
    });
    evaluateSkipLogics();
    isFormReady = true;
    Timer(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
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

      try {
        // await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
        //   LbseInterventionConstant.program,
        //   LbseInterventionConstant.referralOutcomeProgamStage,
        //   lbseBeneficiary?.orgUnit,
        //   widget.formSections,
        //   dataObject,
        //   eventDate,
        //   lbseBeneficiary?.id,
        //   eventId,
        //   hiddenFields,
        // );
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
          Provider.of<ServiceEventDataState>(context, listen: false)
              .resetServiceEventDataState(lbseBeneficiary?.id);
          Navigator.pop(context);
        });
      } catch (e) {
        Timer(Duration(seconds: 1), () {
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
    return Container(
      child: Consumer<LanguageTranslationState>(
          builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Consumer<ServiceFormState>(
            builder: (context, serviceFormState, child) {
          return Container(
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
                          elevation: 0.0,
                          hiddenFields: serviceFormState.hiddenFields,
                          hiddenSections: serviceFormState.hiddenSections,
                          formSections: widget.formSections,
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
                        borderRadius: BorderRadius.only(
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
                                    backgroundColor: Color(0xFF009688),
                                  ),
                                  onPressed: () => !isSaving
                                      ? onSaveForm(
                                          context,
                                          serviceFormState.formState,
                                        )
                                      : null,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 22.0,
                                    ),
                                    child: Text(
                                      isSaving
                                          ? 'SAVING FOLLOW UP ...'
                                          : currentLanguage == 'lesotho'
                                              ? 'SAVE FOLLOW UP'
                                              : 'SAVE FOLLOW UP',
                                      style: TextStyle().copyWith(
                                        color: Color(0xFFFAFAFA),
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
      }),
    );
  }
}
