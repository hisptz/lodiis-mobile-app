import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';

class EducationLbseReferralOutComeContainer extends StatelessWidget {
  const EducationLbseReferralOutComeContainer({
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
              child: Container(
                color: "0" == 0 ? Color(0xFF009688).withOpacity(0.1) : null,
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  child: Text('Referal outcomes'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
