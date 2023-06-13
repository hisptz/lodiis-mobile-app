import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/models/pp_prev_referral_event.dart';
import 'package:provider/provider.dart';

class PpPrevReferralCardBody extends StatelessWidget {
  const PpPrevReferralCardBody({
    Key? key,
    required this.referralEvent,
    required this.labelColor,
    required this.valueColor,
  }) : super(key: key);

  final PpPrevReferralEvent referralEvent;
  final Color valueColor;
  final Color labelColor;

  Widget _getReferralDetails({
    required String key,
    required String value,
    bool isVisible = true,
  }) {
    return Visibility(
      visible: isVisible,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 2.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                key,
                style: const TextStyle().copyWith(
                  fontSize: 14.0,
                  color: labelColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                value != "" ? value : 'N/A',
                style: const TextStyle().copyWith(
                  fontSize: 14.0,
                  color: valueColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 13.0,
        vertical: 10.0,
      ),
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Column(
            children: [
              _getReferralDetails(
                key: currentLanguage == 'lesotho'
                    ? 'Phetisetso ea Lits’ebeletso'
                    : 'Referral service',
                value: referralEvent.referralService!,
              ),
              _getReferralDetails(
                key: currentLanguage == 'lesotho'
                    ? 'Sebaka sa phetisetso'
                    : 'Referral point',
                value: referralEvent.referralPoint!,
              ),
              _getReferralDetails(
                key: currentLanguage == 'lesotho'
                    ? 'Setsi kapa council ea phetisetso'
                    : 'Location',
                value: referralEvent.referredTo!,
              ),
              _getReferralDetails(
                key: currentLanguage == 'lesotho'
                    ? 'Letsatsi la Phetisetso'
                    : 'Referral Date',
                value: referralEvent.referralDate!,
              ),
            ],
          );
        },
      ),
    );
  }
}
