import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/models/lbse_referral_event.dart';
import 'package:provider/provider.dart';

class EducationLbseReferralBody extends StatelessWidget {
  const EducationLbseReferralBody({
    Key? key,
    required this.lbseReferral,
  }) : super(key: key);

  final LbseReferralEvent lbseReferral;

  final Color labelColor = const Color(0xFF009688);
  final Color valueColor = const Color(0xFF82898D);

  Container _getReferralDetailData({
    required Color labelColor,
    required Color valueColor,
    required String label,
    String? value,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle().copyWith(
                color: labelColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value!,
              style: TextStyle().copyWith(
                color: valueColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
          builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Column(
          children: [
            Container(
              child: LineSeparator(
                color: Color(0xFF009688).withOpacity(0.2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Column(
                  children: [
                    _getReferralDetailData(
                      labelColor: labelColor,
                      valueColor: valueColor,
                      label: currentLanguage == 'lesotho' ? 'Date' : 'Date',
                      value: lbseReferral.date,
                    ),
                    _getReferralDetailData(
                      labelColor: labelColor,
                      valueColor: valueColor,
                      label: currentLanguage == 'lesotho'
                          ? 'Case Type'
                          : 'Case Type',
                      value: lbseReferral.casetType,
                    ),
                    _getReferralDetailData(
                      labelColor: labelColor,
                      valueColor: valueColor,
                      label: currentLanguage == 'lesotho'
                          ? 'Referred To'
                          : 'Referred To',
                      value: lbseReferral.referralTo,
                    ),
                    _getReferralDetailData(
                      labelColor: labelColor,
                      valueColor: valueColor,
                      label: currentLanguage == 'lesotho'
                          ? 'Description'
                          : 'Description',
                      value: lbseReferral.description,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
