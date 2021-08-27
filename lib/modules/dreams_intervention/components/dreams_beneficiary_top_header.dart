import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:provider/provider.dart';

class DreamsBeneficiaryTopHeader extends StatelessWidget {
  const DreamsBeneficiaryTopHeader({
    required this.agywDream,
    Key? key,
  }) : super(key: key);

  final AgywDream? agywDream;

  Expanded _getDreamBeneficiaryDetailsWidget({
    required String key,
    required Color keyColor,
    required String value,
    required Color valueColor,
    required double fontSize,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: RichText(
          text: TextSpan(
            text: key != '' ? '$key: ' : "",
            style: TextStyle().copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: keyColor,
            ),
            children: [
              TextSpan(
                text: value,
                style: TextStyle().copyWith(
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

  //@TODO add row for display contact info
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Material(
            type: MaterialType.card,
            elevation: 1.0,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _getDreamBeneficiaryDetailsWidget(
                          key: '',
                          value: agywDream.toString(),
                          keyColor: Color(0xFF05131B),
                          valueColor: Color(0xFF05131B),
                          fontSize: 14.0,
                        ),
                        _getDreamBeneficiaryDetailsWidget(
                          key: '',
                          value: agywDream!.primaryUIC!,
                          keyColor: Color(0xFF05131B),
                          valueColor: Color(0xFF05131B),
                          fontSize: 14.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: LineSeparator(color: Color(0XFFE9F4FA)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _getDreamBeneficiaryDetailsWidget(
                          key: currentLanguage == 'lesotho' ? 'Boleng' : 'Sex',
                          value: agywDream!.sex!,
                          keyColor: Color(0xFF82898D),
                          valueColor: Color(0xFF1F8ECE),
                          fontSize: 12.0,
                        ),
                        _getDreamBeneficiaryDetailsWidget(
                          key: currentLanguage == 'lesotho' ? 'Lilemo' : 'Age',
                          value: agywDream!.age!,
                          keyColor: Color(0xFF82898D),
                          valueColor: Color(0xFF1F8ECE),
                          fontSize: 12.0,
                        ),
                        _getDreamBeneficiaryDetailsWidget(
                          key: currentLanguage == 'lesotho'
                              ? 'Nomoro ea mohala'
                              : 'Phone #',
                          value: agywDream!.phoneNumber!,
                          keyColor: Color(0xFF82898D),
                          valueColor: Color(0xFF1F8ECE),
                          fontSize: 12.0,
                        ),
                        _getDreamBeneficiaryDetailsWidget(
                          key: currentLanguage == 'lesotho'
                              ? 'Motse'
                              : 'Village',
                          value: agywDream!.village!,
                          keyColor: Color(0xFF82898D),
                          valueColor: Color(0xFF1F8ECE),
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
      ),
    );
  }
}
