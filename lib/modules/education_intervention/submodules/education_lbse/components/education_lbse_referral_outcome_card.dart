import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_outcome_event.dart';

class EducationLbseReferralOutcomeCard extends StatelessWidget {
  const EducationLbseReferralOutcomeCard({
    Key? key,
    required this.referralOutcomeEvent,
    this.onEditReferralOutcome,
  }) : super(key: key);

  final LbseReferralOutcomeEvent referralOutcomeEvent;
  final VoidCallback? onEditReferralOutcome;

  final double iconHeight = 18.0;
  final String svgIcon = 'assets/icons/edit-icon.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Outcome',
                    style: TextStyle().copyWith(
                      color: Color(0xFFB2B7B9),
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    onTap: onEditReferralOutcome,
                    child: Container(
                      height: iconHeight,
                      width: iconHeight,
                      margin: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                      child: SvgPicture.asset(
                        svgIcon,
                        color: Color(0xFF009688),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          LineSeparator(
            color: Color(0xFFB2B7B9),
            height: 1.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 15.0,
            ),
            child: Text('Listi of outcome $referralOutcomeEvent'),
          )
        ],
      ),
    );
  }
}
