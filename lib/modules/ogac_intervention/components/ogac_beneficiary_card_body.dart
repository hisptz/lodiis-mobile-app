import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/ogac_beneficiary.dart';
import 'package:provider/provider.dart';

class OgacBeneficiaryCardBody extends StatelessWidget {
  const OgacBeneficiaryCardBody({
    Key? key,
    required this.ogacBeneficiary,
  }) : super(key: key);

  final OgacBeneficiary ogacBeneficiary;

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
                color: Color(0xFF651900).withOpacity(0.4),
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
                color: Color(0xFF651900).withOpacity(0.8),
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
                  key: 'Beneficiary Id',
                  value: ogacBeneficiary.beneficiaryId!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Lilemo' : 'Age',
                  value: ogacBeneficiary.age!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Boleng' : 'Sex',
                  value: ogacBeneficiary.sex!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho'
                      ? 'Nomoro ea mohala'
                      : 'Phone number',
                  value: ogacBeneficiary.phoneNumber!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Sebaka' : 'Location',
                  value: ogacBeneficiary.location!,
                ),
                _getRowBeneficiaryData(
                  key: currentLanguage == 'lesotho' ? 'Motse' : 'Village',
                  value: ogacBeneficiary.village!,
                ),
                _getRowBeneficiaryData(
                  key: 'Created on',
                  value: ogacBeneficiary.beneficiaryId!,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
