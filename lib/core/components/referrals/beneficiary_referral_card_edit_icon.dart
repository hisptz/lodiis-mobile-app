import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:provider/provider.dart';

class BeneficiaryReferralCardEditIcon extends StatelessWidget {
  const BeneficiaryReferralCardEditIcon({
    Key? key,
    required this.referralEvent,
    required this.referralOutcomeProgramStage,
    required this.isOnEditMode,
    required this.isIncomingReferral,
    required this.color,
    required this.referralOutcomeLinkage,
    required this.referralOutcomeFollowingUpLinkage,
    required this.onEditReferral,
  }) : super(key: key);

  final ReferralEvent referralEvent;
  final String referralOutcomeProgramStage;
  final String referralOutcomeLinkage;
  final String referralOutcomeFollowingUpLinkage;
  final bool isOnEditMode;
  final bool isIncomingReferral;
  final Color color;

  final VoidCallback onEditReferral;

  final double editIconHeight = 20.0;

  ReferralOutcomeEvent _getReferralOutcomeEvent({
    required Map<String?, List<Events>> eventListByProgramStage,
  }) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
      eventListByProgramStage,
      [referralOutcomeProgramStage],
      shouldSortByDate: true,
    ).where((Events eventData) {
      ReferralOutcomeEvent referralOutComeEvent =
          ReferralOutcomeEvent().fromTeiModel(
        eventData: eventData,
        referralToComeReference: referralOutcomeLinkage,
        referralToFollowUpLinkage: referralOutcomeFollowingUpLinkage,
      );
      return referralOutComeEvent.referralReference == referralEvent.id;
    }).toList();
    ReferralOutcomeEvent referralOutComeEvent =
        ReferralOutcomeEvent().fromTeiModel(
      eventData: events.isEmpty ? Events(dataValues: []) : events.first,
      referralToComeReference: referralOutcomeLinkage,
      referralToFollowUpLinkage: referralOutcomeFollowingUpLinkage,
    );
    return referralOutComeEvent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Consumer<ServiceEventDataState>(
        builder: (context, serviceEventDataState, child) {
          ReferralOutcomeEvent referralOutComeEvent = _getReferralOutcomeEvent(
            eventListByProgramStage:
                serviceEventDataState.eventListByProgramStage,
          );
          bool hasReferralOutcome =
              referralOutComeEvent.dateClientReachStation != "";
          return Visibility(
            visible: isOnEditMode &&
                !hasReferralOutcome &&
                referralEvent.enrollmentOuAccessible! &&
                !isIncomingReferral,
            child: InkWell(
              onTap: onEditReferral,
              child: Container(
                height: editIconHeight,
                width: editIconHeight,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/edit-icon.svg',
                  colorFilter: ColorFilter.mode(
                    color,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
