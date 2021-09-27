import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:provider/provider.dart';

class PpPrevBeneficiaryCardBody extends StatelessWidget {
  const PpPrevBeneficiaryCardBody({
    Key? key,
    required this.ppPrevBeneficiary,
  }) : super(key: key);

  final PpPrevBeneficiary ppPrevBeneficiary;

  Container _getRowBeneficiaryData({
    required String key,
    required String value,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              key,
              style: TextStyle().copyWith(
                color: Color(0xFF9B2BAE).withOpacity(0.4),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle().copyWith(
                color: Color(0xFF9B2BAE).withOpacity(0.9),
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
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15.0,
            ),
            child: Column(
              children: [
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Sebaka' : 'Location',
                  value: ppPrevBeneficiary.location!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Motse' : 'Village',
                  value: ppPrevBeneficiary.village!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Lilemo' : 'Age',
                  value: ppPrevBeneficiary.age!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Boleng' : 'Sex',
                  value: ppPrevBeneficiary.sex!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho'
                      ? 'Nomoro ea mohala'
                      : 'Phone number',
                  value: ppPrevBeneficiary.phoneNumber!,
                ),
                _getRowBeneficiaryData(
                  key: 'Created on',
                  value: ppPrevBeneficiary.createdDate!,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
