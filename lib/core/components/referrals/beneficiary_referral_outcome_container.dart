import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/referral_event.dart';

class BeneficiaryRefereralOutcomeContainer extends StatelessWidget {
  const BeneficiaryRefereralOutcomeContainer({
    Key? key,
    required this.referralEvent,
    required this.labelColor,
    required this.valueColor,
  }) : super(key: key);
  final ReferralEvent referralEvent;
  final Color valueColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        '$referralEvent',
        style: const TextStyle().copyWith(
          fontSize: 14.0,
          color: labelColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
