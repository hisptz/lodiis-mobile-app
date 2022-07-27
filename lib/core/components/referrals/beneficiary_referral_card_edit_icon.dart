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
    required this.color,
    required this.referralOutcomeLinkage,
    required this.referralOutcomeFollowingUplinkage,
  }) : super(key: key);

  final ReferralEvent referralEvent;
  final String referralOutcomeProgramStage;
  final String referralOutcomeLinkage;
  final String referralOutcomeFollowingUplinkage;
  final bool isOnEditMode;
  final Color color;

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
        referralToFollowUpLinkage: referralOutcomeFollowingUplinkage,
      );
      return referralOutComeEvent.referralReference == referralEvent.id;
    }).toList();
    ReferralOutcomeEvent referralOutComeEvent =
        ReferralOutcomeEvent().fromTeiModel(
      eventData: events.isEmpty ? Events(dataValues: []) : events.first,
      referralToComeReference: referralOutcomeLinkage,
      referralToFollowUpLinkage: referralOutcomeFollowingUplinkage,
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
          bool _hasReferralOutcome =
              referralOutComeEvent.dateClientReachStation != "";
          return Visibility(
            visible: isOnEditMode && !_hasReferralOutcome,
            child: InkWell(
              onTap: () => {
                // IPS issue references
                //TODO edit referral
              },
              child: Container(
                height: editIconHeight,
                width: editIconHeight,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/edit-icon.svg',
                  color: color,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
