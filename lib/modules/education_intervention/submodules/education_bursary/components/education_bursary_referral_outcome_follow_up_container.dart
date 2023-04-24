import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/components/education_bursary_referral_outcome_follow_up_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/bursary_referral_outcome_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/bursary_referral_outcome_follow_up_event.dart';
import 'package:provider/provider.dart';

class EdcucationBursaryReferralOutcomeFollowUpContainer
    extends StatelessWidget {
  const EdcucationBursaryReferralOutcomeFollowUpContainer({
    Key? key,
    required this.isFollowingUpNeeded,
    required this.referralOutcomeEvent,
    this.onAddOutComeFollowingUp,
    required this.editAddOutComeFollowingUp,
  }) : super(key: key);

  final bool isFollowingUpNeeded;
  final BursaryReferralOutcomeEvent referralOutcomeEvent;
  final VoidCallback? onAddOutComeFollowingUp;
  final Function editAddOutComeFollowingUp;

  final Color color = const Color(0xFF009688);

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

  bool _isOutcomeRequireFollowUp(
    List<BursaryReferralOutcomeFollowUpEvent> referralOutcomeFollowUps,
  ) {
    bool hasOutcomeRequireFollowUp = false;
    for (BursaryReferralOutcomeFollowUpEvent referralOutcomeFollowUpEvent
        in referralOutcomeFollowUps) {
      if (referralOutcomeFollowUpEvent.isRequireFollowUp!) {
        hasOutcomeRequireFollowUp = true;
      }
    }
    return hasOutcomeRequireFollowUp || referralOutcomeFollowUps.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      BursaryInterventionConstant
          .clubAttendanceReferralOutcomeFollowUpProgamStage
    ];
    return Visibility(
      visible: isFollowingUpNeeded,
      child: Consumer<ServiceEventDataState>(
          builder: (context, serviceEventDataState, child) {
        bool isLoading = serviceEventDataState.isLoading;
        Map<String?, List<Events>> eventListByProgramStage =
            serviceEventDataState.eventListByProgramStage;
        List<Events> events = TrackedEntityInstanceUtil
            .getAllEventListFromServiceDataStateByProgramStages(
                eventListByProgramStage, programStageIds);
        List<BursaryReferralOutcomeFollowUpEvent> referralOutcomeFollowUps =
            events
                .map((Events eventData) => BursaryReferralOutcomeFollowUpEvent()
                    .fromTeiModel(eventData))
                .toList()
                .where((BursaryReferralOutcomeFollowUpEvent
                        referralOutcomeFollowUpEvent) =>
                    referralOutcomeFollowUpEvent
                        .referralOutcomeToReferralOutComeFollowingUpLinkage ==
                    referralOutcomeEvent
                        .referralOutcomeToReferralOutComeFollowingUpLinkage)
                .toList();
        int followUpIndex = 0;
        return isLoading
            ? const Center(
                child: CircularProcessLoader(
                  color: Colors.blueGrey,
                ),
              )
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Column(
                      children: referralOutcomeFollowUps.map(
                        (BursaryReferralOutcomeFollowUpEvent
                            referralOutcomeFollowUpEvent) {
                          followUpIndex++;
                          return EducationBursaryReferralOutcomeFollowUpCard(
                            color: color,
                            shouldEditFollowingUp: followUpIndex ==
                                    referralOutcomeFollowUps.length &&
                                referralOutcomeFollowUpEvent
                                    .enrollmentOuAccessible!,
                            followUpIndex: followUpIndex,
                            referralOutcomeFollowUpEvent:
                                referralOutcomeFollowUpEvent,
                            onAddOutComeFollowingUp: () =>
                                editAddOutComeFollowingUp(
                                    referralOutcomeFollowUpEvent),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Visibility(
                    visible:
                        _isOutcomeRequireFollowUp(referralOutcomeFollowUps) &&
                            referralOutcomeEvent.enrollmentOuAccessible!,
                    child: _getActionButton(
                      backgroundColor: color,
                      label: 'ADD FOLLOW UP',
                      labelColor: Colors.white,
                      onTap: onAddOutComeFollowingUp!,
                    ),
                  )
                ],
              );
      }),
    );
  }
}
