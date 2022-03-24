import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_card_header.dart';
import 'package:provider/provider.dart';

class OvcHouseholdInfoTopHeader extends StatelessWidget {
  const OvcHouseholdInfoTopHeader({
    Key? key,
    required this.currentOvcHousehold,
  }) : super(key: key);
  final OvcHousehold? currentOvcHousehold;
  final String svgIcon = 'assets/icons/hh_icon.svg';

  Expanded _getOvcHouseholdDetailsWidget({
    required String key,
    required String value,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: RichText(
          text: TextSpan(
            text: '$key: ',
            style: const TextStyle().copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF92A791),
            ),
            children: [
              TextSpan(
                text: value,
                style: const TextStyle().copyWith(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF536852),
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
              horizontal: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OvcHouseholdCardHeader(
                  ovcHousehold: currentOvcHousehold,
                  svgIcon: svgIcon,
                  canEdit: false,
                  canExpand: false,
                  canView: false,
                  isExpanded: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getOvcHouseholdDetailsWidget(
                      key: currentLanguage == 'lesotho'
                          ? 'Mohlokomeli'
                          : 'Caregiver',
                      value: currentOvcHousehold.toString(),
                    ),
                    _getOvcHouseholdDetailsWidget(
                      key: currentLanguage == 'lesotho'
                          ? 'Nomoro ea mohala'
                          : 'Phone #',
                      value: currentOvcHousehold!.phoneNumber ?? '',
                    ),
                    _getOvcHouseholdDetailsWidget(
                      key: currentLanguage == 'lesotho' ? 'Motse' : 'Village',
                      value: currentOvcHousehold!.village ?? '',
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
