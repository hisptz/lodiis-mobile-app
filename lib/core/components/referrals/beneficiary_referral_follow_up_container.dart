import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/referral_outcome_follow_up_event.dart';

class BeneficiaryReferralFollowUpContainer extends StatelessWidget {
  const BeneficiaryReferralFollowUpContainer({
    Key? key,
    required this.valueColor,
    required this.referralOutcomeFollowUpEvents,
    required this.labelColor,
    required this.onEditReferralFollowUp,
  }) : super(key: key);

  final Color valueColor;
  final List<ReferralOutcomeFollowUpEvent> referralOutcomeFollowUpEvents;
  final Color labelColor;

  final Function onEditReferralFollowUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: Text(
        'referral following ups $valueColor $referralOutcomeFollowUpEvents',
        style: const TextStyle().copyWith(
          fontSize: 14.0,
          color: labelColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
