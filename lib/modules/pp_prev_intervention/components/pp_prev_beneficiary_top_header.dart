import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:provider/provider.dart';

class PpPrevBeneficiaryTopHeader extends StatelessWidget {
  const PpPrevBeneficiaryTopHeader({
    required this.ppPrevBeneficiary,
    Key? key,
  }) : super(key: key);

  final PpPrevBeneficiary ppPrevBeneficiary;

  Expanded _getBeneficiaryDetailsWidget({
    required String key,
    required Color keyColor,
    required String value,
    required Color valueColor,
    required double fontSize,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: RichText(
          text: TextSpan(
            text: key != '' ? '$key: ' : "",
            style: const TextStyle().copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: keyColor,
            ),
            children: [
              TextSpan(
                text: value,
                style: const TextStyle().copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: valueColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Material(
          type: MaterialType.card,
          elevation: 1.0,
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getBeneficiaryDetailsWidget(
                        key: '',
                        value: ppPrevBeneficiary.toString(),
                        keyColor: const Color(0xFF05131B),
                        valueColor: const Color(0xFF05131B),
                        fontSize: 14.0,
                      ),
                      _getBeneficiaryDetailsWidget(
                        key: '',
                        value: '',
                        keyColor: const Color(0xFF05131B),
                        valueColor: const Color(0xFF05131B),
                        fontSize: 14.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: LineSeparator(
                    color: const Color(0xFF9B2BAE).withOpacity(0.2),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getBeneficiaryDetailsWidget(
                        key: currentLanguage == 'lesotho' ? 'Boleng' : 'Sex',
                        value: ppPrevBeneficiary.sex!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF9B2BAE),
                        fontSize: 12.0,
                      ),
                      _getBeneficiaryDetailsWidget(
                        key: currentLanguage == 'lesotho' ? 'Lilemo' : 'Age',
                        value: ppPrevBeneficiary.age!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF9B2BAE),
                        fontSize: 12.0,
                      ),
                      _getBeneficiaryDetailsWidget(
                        key: currentLanguage == 'lesotho'
                            ? 'Nomoro ea mohala'
                            : 'Phone #',
                        value: ppPrevBeneficiary.phoneNumber!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF9B2BAE),
                        fontSize: 12.0,
                      ),
                      _getBeneficiaryDetailsWidget(
                        key: currentLanguage == 'lesotho' ? 'Motse' : 'Village',
                        value: ppPrevBeneficiary.village!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF9B2BAE),
                        fontSize: 12.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
