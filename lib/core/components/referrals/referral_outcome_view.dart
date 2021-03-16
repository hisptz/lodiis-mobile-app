import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_follow_up.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_following_up_modal.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:kb_mobile_app/models/referral_outcome_follow_up_event.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class ReferralOutComeView extends StatelessWidget {
  const ReferralOutComeView({
    Key key,
    @required this.themeColor,
    @required this.referralOutComeEvent,
    @required this.beneficiary,
    @required this.referralFollowUpStage,
    @required this.referralToFollowUpLinkage,
    @required this.referralOutcomeFollowUpFormSections,
    @required this.referralProgram,
    @required this.isEditableMode,
  }) : super(key: key);

  final ReferralOutComeEvent referralOutComeEvent;
  final List<FormSection> referralOutcomeFollowUpFormSections;
  final Color themeColor;
  final TrackeEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;
  final bool isEditableMode;

  void updateFormState(BuildContext context, String referralReference) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(referralToFollowUpLinkage, referralReference);
  }

  void onAddReferralOutComeFollowUp(BuildContext context) async {
    updateFormState(context, referralOutComeEvent.referralReference);
    Widget modal = ReferralOutComeFollowUpModal(
      themeColor: themeColor,
      referralProgram: referralProgram,
      referralFollowUpStage: referralFollowUpStage,
      referralToFollowUpLinkage: referralToFollowUpLinkage,
      referralOutcomeFollowUpFormSections: referralOutcomeFollowUpFormSections,
      beneficiary: beneficiary,
    );
    await AppUtil.showPopUpModal(context, modal, true);
  }

  void onEeditOutComeFollowUp(BuildContext context) async {
    Widget modal = ReferralOutComeFollowUpModal(
      themeColor: themeColor,
      referralProgram: referralProgram,
      referralFollowUpStage: referralFollowUpStage,
      referralToFollowUpLinkage: referralToFollowUpLinkage,
      referralOutcomeFollowUpFormSections: referralOutcomeFollowUpFormSections,
      beneficiary: beneficiary,
    );
    await AppUtil.showPopUpModal(context, modal, true);
  }

  List<ReferralOutFollowUpComeEvent> getReferralOutComeFollowUps(
    Map<String, List<Events>> eventListByProgramStage,
  ) {
    TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
      eventListByProgramStage,
      [referralFollowUpStage],
    );
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
      eventListByProgramStage,
      [referralFollowUpStage],
    );
    List<ReferralOutFollowUpComeEvent> referralOutComeFollowUps = events
        .map((Events event) => ReferralOutFollowUpComeEvent()
            .fromTeiModel(event, referralToFollowUpLinkage))
        .toList();
    return referralOutComeFollowUps
        .where((referralOutComeFollowUp) =>
            referralOutComeFollowUp.referralReference ==
            referralOutComeEvent.referralReference)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Date client reached the referral station',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: themeColor.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                referralOutComeEvent.dateClientReachStation,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A3518),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Date service was provided',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: themeColor.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                referralOutComeEvent.dateServiceProvided,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A3518),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Comments or next steps',
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: themeColor.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                referralOutComeEvent.comments,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Color(0xFF1A3518),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Consumer<ServiveEventDataState>(
              builder: (context, serviveEventDataState, child) {
                Map<String, List<Events>> eventListByProgramStage =
                    serviveEventDataState.eventListByProgramStage;
                List<ReferralOutFollowUpComeEvent>
                    referralOutComeFollowUpEvents =
                    getReferralOutComeFollowUps(eventListByProgramStage);
                bool canAddFollowUp = true;
                referralOutComeFollowUpEvents
                    .forEach((referralOutcomeFollowUpEvent) {
                  if (referralOutcomeFollowUpEvent.additionalFollowUpRequired !=
                          null &&
                      !referralOutcomeFollowUpEvent
                          .additionalFollowUpRequired) {
                    canAddFollowUp =
                        referralOutcomeFollowUpEvent.additionalFollowUpRequired;
                  }
                });
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10.0,
                        left: 20.0,
                      ),
                      child: ReferralOutComeFollowUp(
                        themeColor: themeColor,
                        onEditFollowUp: () => onEeditOutComeFollowUp(context),
                        referralOutComeFollowUpEvents:
                            referralOutComeFollowUpEvents,
                      ),
                    ),
                    Container(
                      child: Visibility(
                        visible: isEditableMode &&
                            referralOutComeEvent.requredFollowUp,
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeColor,
                          ),
                          child: Visibility(
                            visible: canAddFollowUp,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => this
                                        .onAddReferralOutComeFollowUp(context),
                                    child: Text(
                                      'ADD FOLLOW-UP',
                                      style: TextStyle().copyWith(
                                        color: Color(0XFFFAFAFA),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
