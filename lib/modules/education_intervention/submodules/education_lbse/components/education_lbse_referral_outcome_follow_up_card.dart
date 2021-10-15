import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_follow_up_event.dart';

class EducationLbseReferralOutcomeFollowUpCard extends StatelessWidget {
  const EducationLbseReferralOutcomeFollowUpCard({
    Key? key,
    required this.color,
    required this.followUpIndex,
    required this.referralOutcomeFollowUpEvent,
    required this.onAddOutComeFollowingUp,
  }) : super(key: key);

  final Color color;
  final int followUpIndex;
  final LbseReferralOutcomeFollowUpEvent referralOutcomeFollowUpEvent;
  final VoidCallback? onAddOutComeFollowingUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LineSeparator(color: color),
        Container(
          child: Text("FOLLOW UP $followUpIndex"),
        ),
        LineSeparator(color: color),
        Container(
          child: Text("$referralOutcomeFollowUpEvent"),
        )
      ],
    );
  }
}
