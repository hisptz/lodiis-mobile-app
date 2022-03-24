import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_follow_up_modal.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_follow_up_container.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_modal.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/education_lbse_referral_outcome_follow_up_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/education_lbse_referral_outcome_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_follow_up_event.dart';
import 'package:provider/provider.dart';

class EducationLbseReferralOutComeContainer extends StatelessWidget {
  const EducationLbseReferralOutComeContainer({
    Key? key,
    required this.lbseReferral,
  }) : super(key: key);

  final LbseReferralEvent lbseReferral;

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('location', lbseReferral.eventData!.orgUnit);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onAddOrEditOutcome(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) async {
    updateFormState(context, isEditableMode, eventData);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
        LbseInterventionConstant.referralToReferralOutcomeLinkage,
        lbseReferral.referralToReferralOutcomeLinkage);
    List<FormSection> formSections =
        EducationLbseReferralOutcomeForm.getFormSections();
    List mandatoryFields = EducationLbseReferralOutcomeForm.getMandatoryField();
    Widget modal = EducationLbseRefferalOutcomeModal(
      formSections: formSections,
      mandatoryFields: mandatoryFields,
    );
    await AppUtil.showPopUpModal(
      context,
      modal,
      true,
      title: 'Referral Outcome',
    );
  }

  void onAddOrEditOutcomeFollowingUp(
    BuildContext context,
    LbseReferralOutcomeEvent referralOutcomeEvent,
    bool isEditableMode,
    Events? eventData,
  ) async {
    updateFormState(context, isEditableMode, eventData);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
        LbseInterventionConstant
            .referralOutcomeToReferralOutComeFollowingUpLinkage,
        referralOutcomeEvent
            .referralOutcomeToReferralOutComeFollowingUpLinkage);
    List mandatoryFields =
        EducationLbseReferralOutcomeFollowUpForm.getMandatoryField();
    List<FormSection> formSections =
        EducationLbseReferralOutcomeFollowUpForm.getFormSections();
    Widget modal = EducationLbseRefferalOutcomeFollowUpModal(
      formSections: formSections,
      mandatoryFields: mandatoryFields,
    );
    await AppUtil.showPopUpModal(
      context,
      modal,
      true,
      title: 'Referral Follow up',
    );
  }

  void onAddingOutcome(BuildContext context) {
    bool isEditableMode = true;
    onAddOrEditOutcome(context, isEditableMode, null);
  }

  void onEditOutcome(
    BuildContext context,
    LbseReferralOutcomeEvent referralOutcomeEvent,
  ) {
    bool isEditableMode = true;
    onAddOrEditOutcome(context, isEditableMode, referralOutcomeEvent.eventData);
  }

  void onAddOutComeFollowingUp(
    BuildContext context,
    LbseReferralOutcomeEvent referralOutcomeEvent,
  ) {
    bool isEditableMode = true;
    onAddOrEditOutcomeFollowingUp(
      context,
      referralOutcomeEvent,
      isEditableMode,
      null,
    );
  }

  void onEditOutComeFollowingUp(
    BuildContext context,
    LbseReferralOutcomeEvent referralOutcomeEvent,
    Events eventData,
  ) {
    bool isEditableMode = true;
    onAddOrEditOutcomeFollowingUp(
      context,
      referralOutcomeEvent,
      isEditableMode,
      eventData,
    );
  }

  ClipRRect _getActionButton({
    required Color backgroundColor,
    required String label,
    required Color labelColor,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12.0),
        bottomRight: Radius.circular(12.0),
      ),
      child: Container(
        width: double.infinity,
        color: backgroundColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 15.0,
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle().copyWith(
                  color: labelColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      LbseInterventionConstant.referralOutcomeProgamStage
    ];

    return Consumer<ServiceEventDataState>(
        builder: (context, serviceEventDataState, child) {
      bool isLoading = serviceEventDataState.isLoading;
      Map<String?, List<Events>> eventListByProgramStage =
          serviceEventDataState.eventListByProgramStage;
      List<Events> events = TrackedEntityInstanceUtil
          .getAllEventListFromServiceDataStateByProgramStages(
              eventListByProgramStage, programStageIds);
      List<LbseReferralOutcomeEvent> referralOutcomeEvents = events
          .map((Events eventData) =>
              LbseReferralOutcomeEvent().fromTeiModel(eventData))
          .toList()
          .where((LbseReferralOutcomeEvent referralOutcomeEvent) =>
              referralOutcomeEvent.referralToReferralOutcomeLinkage ==
              lbseReferral.referralToReferralOutcomeLinkage)
          .toList();
      bool shouldAddOutcome = referralOutcomeEvents.isEmpty;
      return isLoading
          ? const CircularProcessLoader(
              color: Colors.blueGrey,
            )
          : Column(
              children: [
                Visibility(
                  visible:
                      shouldAddOutcome && lbseReferral.enrollmentOuAccessible!,
                  child: LineSeparator(
                    color: const Color(0xFF009688).withOpacity(0.3),
                  ),
                ),
                Container(
                  child: shouldAddOutcome
                      ? Visibility(
                          visible: lbseReferral.enrollmentOuAccessible!,
                          child: _getActionButton(
                            backgroundColor:
                                const Color(0xFF009688).withOpacity(0.1),
                            label: 'ADD OUTCOME',
                            labelColor: const Color(0xFF009688),
                            onTap: () => onAddingOutcome(context),
                          ))
                      : Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFB2B7B9),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: referralOutcomeEvents
                                  .map(
                                    (LbseReferralOutcomeEvent
                                            referralOutcomeEvent) =>
                                        Column(
                                      children: [
                                        EducationLbseReferralOutcomeCard(
                                          referralOutcomeEvent:
                                              referralOutcomeEvent,
                                          onEditReferralOutcome: () =>
                                              onEditOutcome(context,
                                                  referralOutcomeEvent),
                                        ),
                                        EdcucationLbseReferralOutcomeFollowUpContainer(
                                          referralOutcomeEvent:
                                              referralOutcomeEvent,
                                          isFollowingUpNeeded:
                                              referralOutcomeEvent
                                                  .isRequireFollowUp!,
                                          onAddOutComeFollowingUp: () =>
                                              onAddOutComeFollowingUp(context,
                                                  referralOutcomeEvent),
                                          editAddOutComeFollowingUp:
                                              (LbseReferralOutcomeFollowUpEvent
                                                      referralOutcomeFollowUpEvent) =>
                                                  onEditOutComeFollowingUp(
                                                      context,
                                                      referralOutcomeEvent,
                                                      referralOutcomeFollowUpEvent
                                                          .eventData!),
                                        )
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                ),
              ],
            );
    });
  }
}
