import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:provider/provider.dart';

class EducationBeneficiaryTopHeader extends StatelessWidget {
  const EducationBeneficiaryTopHeader({
    required this.educationBeneficiary,
    Key? key,
  }) : super(key: key);

  final EducationBeneficiary educationBeneficiary;

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
                        value: educationBeneficiary.toString(),
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF82898D),
                        fontSize: 14.0,
                      ),
                      _getBeneficiaryDetailsWidget(
                        key: '',
                        value: educationBeneficiary.beneficiaryId!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF82898D),
                        fontSize: 14.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: LineSeparator(
                    color: const Color(0xFF009688).withOpacity(0.1),
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
                        key: currentLanguage == 'lesotho' ? 'Lilemo' : 'Age',
                        value: educationBeneficiary.age!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF009688),
                        fontSize: 12.0,
                      ),
                      _getBeneficiaryDetailsWidget(
                        key: currentLanguage == 'lesotho' ? 'Boleng' : 'Sex',
                        value: educationBeneficiary.sex!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF009688),
                        fontSize: 12.0,
                      ),
                      _getBeneficiaryDetailsWidget(
                        key: currentLanguage == 'lesotho' ? 'Grade' : 'Grade',
                        value: educationBeneficiary.grade!,
                        keyColor: const Color(0xFF82898D),
                        valueColor: const Color(0xFF009688),
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
