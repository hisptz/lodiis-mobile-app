import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';

class EducationLbseReferralBody extends StatelessWidget {
  const EducationLbseReferralBody({
    Key? key,
    required this.lbseReferral,
  }) : super(key: key);

  final LbseReferralEvent lbseReferral;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            Container(
              child: LineSeparator(
                color: Color(0xFF009688).withOpacity(0.2),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Text('Referal Body')),
          ],
        ),
      ),
    );
  }
}
