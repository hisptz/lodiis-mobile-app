import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_outcome_modal.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dreams_referral_outcome.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral_outcome.dart';
import 'package:provider/provider.dart';

class BeneficiaryRefereralOutcomeContainer extends StatelessWidget {
  const BeneficiaryRefereralOutcomeContainer({
    Key? key,
    required this.enrollmentOuAccessible,
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
  final bool enrollmentOuAccessible;
  final ReferralEvent referralEvent;
  final String referralProgram;
  final bool isOvcIntervention;
  final bool isHouseholdReferral;
  final bool isIncomingReferral;
  final Color valueColor;
  final Color labelColor;

  void updateFormState(
    BuildContext context,
    ReferralOutcomeEvent? referralOutcomeEvent,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    String location = enrollmentOuAccessible ? beneficiary.orgUnit ?? '' : '';
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('location', location);
    if (referralOutcomeEvent != null) {
      Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
          'eventDate', referralOutcomeEvent.eventData?.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', referralOutcomeEvent.eventData?.event);
      Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
          'location', referralOutcomeEvent.eventData?.orgUnit);
      for (Map dataValue in referralOutcomeEvent.eventData?.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onAddOrEditReferralOutcome(
    BuildContext context,
    ReferralOutcomeEvent? referralOutcomeEvent,
  ) {
    double modalRatio = 0.75;
    updateFormState(context, referralOutcomeEvent);
    Widget modal = ReferralOutcomeModal(
      enrollmentOuAccessible: enrollmentOuAccessible,
      beneficiary: beneficiary,
      isOvcIntervention: isOvcIntervention,
      formSections: isOvcIntervention
          ? OvcReferralOutCome.getFormSections(
              firstDate: referralEvent.date!,
            )
          : DreamsReferralOutCome.getFormSections(
              firstDate: referralEvent.date!,
            ),
      hiddenFields: [
        referralOutcomeFollowingUpProgramStage,
        referralOutcomeLinkage
      ],
      mandatoryFields: isOvcIntervention
          ? OvcReferralOutCome.getMandatoryFields()
          : DreamsReferralOutCome.getMandatoryFields(),
      referralEvent: referralEvent,
      themeColor:
          isOvcIntervention ? const Color(0xFF4B9F46) : const Color(0xFF1F8ECE),
      referralProgramStage: referralOutcomeProgramStage,
      referralToFollowUpLinkage: referralOutcomeFollowingUpProgramStage,
      referralOutcomeLinkage: referralOutcomeLinkage,
    );
    AppUtil.showActionSheetModal(
      context: context,
      containerBody: modal,
      initialHeightRatio: modalRatio,
      maxHeightRatio: modalRatio,
    );
  }

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
            referralOutComeEvent.dateClientReachStation != "";
        return serviceEventDataState.isLoading
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: const CircularProcessLoader(
                  color: Colors.blueGrey,
                ),
              )
            : !_hasReferralOutcome && isIncomingReferral
                ? BeneficiaryReferralOutcomeButton(
                    onTap: () => onAddOrEditReferralOutcome(context, null),
                    color: labelColor,
                  )
                : Visibility(
                    visible: _hasReferralOutcome,
                    child: Container(
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
                        '$referralEvent : $_hasReferralOutcome $referralOutComeEvent',
                        style: const TextStyle().copyWith(
                          fontSize: 14.0,
                          color: labelColor,
                          fontWeight: FontWeight.w500,
                        ),
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
