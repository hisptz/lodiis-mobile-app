import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';

class EducationLbseReferralContainer extends StatelessWidget {
  const EducationLbseReferralContainer({
    Key? key,
    required this.referralIndex,
    required this.lbseReferral,
  }) : super(key: key);

  final int referralIndex;
  final LbseReferralEvent lbseReferral;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$lbseReferral => $referralIndex"),
    );
  }
}
