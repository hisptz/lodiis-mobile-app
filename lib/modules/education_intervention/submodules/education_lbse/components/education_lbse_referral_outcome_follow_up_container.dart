import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/components/education_lbse_referral_outcome_follow_up_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_event.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_follow_up_event.dart';
import 'package:provider/provider.dart';

class EdcucationLbseReferralOutcomeFollowUpContainer extends StatelessWidget {
  const EdcucationLbseReferralOutcomeFollowUpContainer({
    Key? key,
    required this.isFollowingUpNeeded,
    required this.referralOutcomeEvent,
    this.onAddOutComeFollowingUp,
    required this.editAddOutComeFollowingUp,
  }) : super(key: key);

  final bool isFollowingUpNeeded;
  final LbseReferralOutcomeEvent referralOutcomeEvent;
  final VoidCallback? onAddOutComeFollowingUp;
  final Function editAddOutComeFollowingUp;

  final Color color = const Color(0xFF009688);

  Container _getActionButton({
    required Color backgroundColor,
    required String label,
    required Color labelColor,
    required VoidCallback onTap,
  }) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          child: Container(
            child: InkWell(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle().copyWith(
                      color: labelColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isOutcomeRequireFollowUp(
    List<LbseReferralOutcomeFollowUpEvent> referralOutcomeFollowUps,
  ) {
    bool hasOutcomeRequireFollowUp = false;
    for (LbseReferralOutcomeFollowUpEvent referralOutcomeFollowUpEvent
        in referralOutcomeFollowUps) {
      if (referralOutcomeFollowUpEvent.isRequireFollowUp!) {
        hasOutcomeRequireFollowUp = true;
      }
    }
    return hasOutcomeRequireFollowUp || referralOutcomeFollowUps.length == 0;
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      LbseInterventionConstant.referralOutcomeFollowUpProgamStage
    ];
    return Container(
      child: Visibility(
        visible: isFollowingUpNeeded,
        child: Consumer<ServiceEventDataState>(
            builder: (context, serviceEventDataState, child) {
          bool isLoading = serviceEventDataState.isLoading;
          Map<String?, List<Events>> eventListByProgramStage =
              serviceEventDataState.eventListByProgramStage;
          List<Events> events = TrackedEntityInstanceUtil
              .getAllEventListFromServiceDataStateByProgramStages(
                  eventListByProgramStage, programStageIds);
          List<LbseReferralOutcomeFollowUpEvent> referralOutcomeFollowUps =
              events
                  .map((Events eventData) => LbseReferralOutcomeFollowUpEvent()
                      .fromTeiModel(eventData))
                  .toList()
                  .where((LbseReferralOutcomeFollowUpEvent
                          referralOutcomeFollowUpEvent) =>
                      referralOutcomeFollowUpEvent
                          .referralOutcomeToReferralOutComeFollowingUpLinkage ==
                      referralOutcomeEvent
                          .referralOutcomeToReferralOutComeFollowingUpLinkage)
                  .toList();
          int followUpIndex = 0;
          return isLoading
              ? Container(
                  child: Center(
                    child: CircularProcessLoader(
                      color: Colors.blueGrey,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Column(
                        children: referralOutcomeFollowUps.map(
                          (LbseReferralOutcomeFollowUpEvent
                              referralOutcomeFollowUpEvent) {
                            followUpIndex++;
                            return Container(
                              child: EducationLbseReferralOutcomeFollowUpCard(
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
                              ),
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
      ),
    );
  }
}
