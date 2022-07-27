import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class BeneficiaryRefereralOutcomeContainer extends StatelessWidget {
  const BeneficiaryRefereralOutcomeContainer({
    Key? key,
    required this.beneficiary,
    required this.referralEvent,
    required this.labelColor,
    required this.valueColor,
    required this.referralProgram,
    required this.referralOutcomeProgramStage,
    required this.referralOutcomeFollowingUpProgramStage,
    required this.referralOutcomeLinkage,
    required this.referralOutcomeFollowingUplinkage,
    required this.isOvcIntervention,
    required this.isIncomingReferral,
    required this.isHouseholdReferral,
  }) : super(key: key);
  final String referralOutcomeProgramStage;
  final String referralOutcomeFollowingUpProgramStage;
  final String referralOutcomeLinkage;
  final String referralOutcomeFollowingUplinkage;
  final TrackedEntityInstance beneficiary;
  final ReferralEvent referralEvent;
  final String referralProgram;
  final bool isOvcIntervention;
  final bool isHouseholdReferral;
  final bool isIncomingReferral;
  final Color valueColor;
  final Color labelColor;

  void onAddReferralOutcome(BuildContext context) {
    print("on add referral outcomes");

    Provider.of<ServiceEventDataState>(context, listen: false)
        .resetServiceEventDataState(
            referralEvent.eventData!.trackedEntityInstance);
  }

  ReferralOutcomeEvent _getReferralOutcomeEvent({
    required Map<String?, List<Events>> eventListByProgramStage,
  }) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
      eventListByProgramStage,
      [referralOutcomeProgramStage],
      shouldSortByDate: true,
    );

    print(events);

    ReferralOutcomeEvent referralOutComeEvent =
        ReferralOutcomeEvent().fromTeiModel(
      eventData: events.isEmpty ? Events(dataValues: []) : events.first,
      referralToComeReference: "",
      referralToFollowUpLinkage: "",
    );
    return referralOutComeEvent;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceEventDataState>(
      builder: (context, serviceEventDataState, child) {
        ReferralOutcomeEvent referralOutComeEvent = _getReferralOutcomeEvent(
          eventListByProgramStage:
              serviceEventDataState.eventListByProgramStage,
        );
        bool _hasReferralOutcome =
            referralOutComeEvent.dateClientReachStation == "";
        return serviceEventDataState.isLoading
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: const CircularProcessLoader(
                  color: Colors.blueGrey,
                ),
              )
            : !_hasReferralOutcome //TODO activate this && isIncomingReferral
                ? BeneficiaryReferralOutcomeButton(
                    onTap: () => onAddReferralOutcome(context),
                    color: labelColor,
                  )
                : Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: valueColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    child: Text(
                      '$referralEvent : $isIncomingReferral $referralOutComeEvent',
                      style: const TextStyle().copyWith(
                        fontSize: 14.0,
                        color: labelColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
      },
    );
  }
}

class BeneficiaryReferralOutcomeButton extends StatelessWidget {
  const BeneficiaryReferralOutcomeButton({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          LineSeparator(
            color: color.withOpacity(
              0.1,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    'COMPLETE OUTCOME',
                    style: const TextStyle().copyWith(
                      color: color,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
