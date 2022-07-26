import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event_notification.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:provider/provider.dart';

class AgywDreamsReferralUtil {
  static List<Events> getAgywDreamBeneficiaryReferrals({
    required Map<String?, List<Events>> eventListByProgramStage,
    required List<String> programStageIds,
    required List<String> incomingReferrals,
    required String currentInterventionBottomNavigationId,
  }) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
      eventListByProgramStage,
      programStageIds,
      shouldSortByDate: true,
    );
    if (currentInterventionBottomNavigationId == 'incomingReferral') {
      events.removeWhere((event) => !incomingReferrals.contains(event.event));
    }
    return events;
  }

  static updateViewStatusOfReferralNotification(
    BuildContext context,
    Events eventData,
  ) {
    try {
      ReferralOutcomeEvent referralOutComeEvent =
          ReferralOutcomeEvent().fromTeiModel(eventData, "");
      bool hasReferralOutCome =
          referralOutComeEvent.dateClientReachStation != "";
      String currentImplementingPartner =
          Provider.of<ReferralNotificationState>(context, listen: false)
              .currentImplementingPartner;
      List<ReferralEventNotification> incomingResolvedReferrals =
          Provider.of<ReferralNotificationState>(context, listen: false)
              .incomingResolvedReferrals;
      ReferralEventNotification? incomingResolvedReferral =
          incomingResolvedReferrals.firstWhereOrNull(
        (ReferralEventNotification referralEventNotification) =>
            referralEventNotification.id == eventData.event &&
            referralEventNotification.fromImplementingPartner ==
                currentImplementingPartner &&
            referralEventNotification.isCompleted!,
      );
      if (incomingResolvedReferral != null && hasReferralOutCome) {
        bool isCompleted = true;
        bool isViewed = true;
        Provider.of<ReferralNotificationState>(context, listen: false)
            .updateReferralNotificationEvent(eventData.event,
                eventData.trackedEntityInstance, isCompleted, isViewed);
      }
    } catch (error) {
      //
    }
  }
}
