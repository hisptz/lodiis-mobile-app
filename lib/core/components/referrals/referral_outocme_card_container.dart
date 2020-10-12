import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_card.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class ReferralOutComeCardContainer extends StatelessWidget {
  const ReferralOutComeCardContainer({
    Key key,
    @required this.currentProgramStage,
    @required this.beneficiary,
    @required this.referralFollowUpStage,
    @required this.referralToFollowUpLinkage,
    @required this.referralProgram,
  }) : super(key: key);

  final String currentProgramStage;
  final TrackeEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ServiveEventDataState>(
        builder: (context, serviveEventDataState, child) {
          bool isLoading = serviveEventDataState.isLoading;
          Map<String, List<Events>> eventListByProgramStage =
              serviveEventDataState.eventListByProgramStage;
          List<Events> events =
              TrackedEntityInstanceUtil.getAllEventListFromServiceDataState(
            eventListByProgramStage,
            [currentProgramStage],
          );
          Events eventData = events.length > 0 ? events[0] : null;
          return isLoading
              ? Container(
                  child: CircularProcessLoader(
                    color: Colors.blueGrey,
                  ),
                )
              : eventData != null
                  ? ReferralOutComeCard(
                      beneficiary: beneficiary,
                      eventData: eventData,
                      referralProgram: referralProgram,
                      referralFollowUpStage: referralFollowUpStage,
                      referralToFollowUpLinkage: referralToFollowUpLinkage,
                    )
                  : Container();
        },
      ),
    );
  }
}
