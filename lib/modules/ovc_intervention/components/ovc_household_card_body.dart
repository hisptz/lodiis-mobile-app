import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_child_count.dart';
import 'package:provider/provider.dart';

class OvcHouseholdCardBody extends StatelessWidget {
  const OvcHouseholdCardBody({
    Key? key,
    required this.ovcHousehold,
  }) : super(key: key);

  final OvcHousehold ovcHousehold;

  Expanded _getOvcHouseholdDetailsWidget({
    required String value,
    required int flex,
    required Color color,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        value,
        style: const TextStyle().copyWith(
          fontSize: 14.0,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Container _getOvcHouseholdRowWidget({
    required String key,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getOvcHouseholdDetailsWidget(
            value: key,
            flex: 1,
            color: const Color(0XFF536852),
          ),
          _getOvcHouseholdDetailsWidget(
            value: value,
            flex: 2,
            color: const Color(0XFF92A791),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
        String? currentLanguage = languageTranslationState.currentLanguage;
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 13.0,
            vertical: 10.0,
          ),
          child: Column(
            children: [
              _getOvcHouseholdRowWidget(
                key: currentLanguage == 'lesotho' ? 'Mohlokomeli' : 'Caregiver',
                value: ovcHousehold.toString(),
              ),
              _getOvcHouseholdRowWidget(
                key: "Created",
                value: ovcHousehold.createdDate!,
              ),
              _getOvcHouseholdRowWidget(
                key: currentLanguage == 'lesotho' ? 'Sebaka' : 'Location',
                value: ovcHousehold.location!,
              ),
              OvcHouseholdChildCount(
                currentLanguage: currentLanguage,
                ovcHousehold: ovcHousehold,
              )
            ],
          ),
        );
      },
    );
  }
}
