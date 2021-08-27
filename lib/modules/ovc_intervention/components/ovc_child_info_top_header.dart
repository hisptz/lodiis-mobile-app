import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:provider/provider.dart';

class OvcChildInfoTopHeader extends StatelessWidget {
  const OvcChildInfoTopHeader({
    Key? key,
  }) : super(key: key);

  Expanded _getOvcChildInfoDetailsWidget({
    String? currentLanguage,
    required String key,
    required Color keyColor,
    required String value,
    required Color valueColor,
    required double fontSize,
  }) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          text: key != '' ? '$key: ' : '',
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
    );
  }

//@TODO refector to reusble widget
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String? currentLanguage = languageTranslationState.currentLanguage;
          return Consumer<OvcHouseholdCurrentSelectionState>(
            builder: (context, ovcHouseholdCurrentSelectionState, child) {
              var currentOvcHouseholdChild =
                  ovcHouseholdCurrentSelectionState.currentOvcHouseholdChild!;
              var currentOvcHousehold =
                  ovcHouseholdCurrentSelectionState.currentOvcHousehold;
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
                          vertical: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: "",
                              value: currentOvcHouseholdChild.toString(),
                              keyColor: Color(0xFF1A3518),
                              valueColor: Color(0xFF1A3518),
                              fontSize: 14.0,
                            ),
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: "",
                              value: currentOvcHouseholdChild.primaryUIC ?? "",
                              keyColor: Color(0xFF1A3518),
                              valueColor: Color(0xFF1A3518),
                              fontSize: 14.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: LineSeparator(color: Color(0XFFECF5EC)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: currentLanguage == 'lesotho'
                                  ? 'Boleng'
                                  : 'Sex',
                              value: currentOvcHouseholdChild.sex ?? "",
                              keyColor: Color(0xFF92A791),
                              valueColor: Color(0xFF4B9F46),
                              fontSize: 12.0,
                            ),
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: currentLanguage == 'lesotho'
                                  ? 'Lilemo'
                                  : 'Age',
                              value: currentOvcHouseholdChild.age ?? "",
                              keyColor: Color(0xFF92A791),
                              valueColor: Color(0xFF4B9F46),
                              fontSize: 12.0,
                            ),
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: currentLanguage == 'lesotho'
                                  ? 'HIV Status'
                                  : 'HIV Status',
                              value: currentOvcHouseholdChild.hivStatus ?? "",
                              keyColor: Color(0xFF92A791),
                              valueColor: Color(0xFF4B9F46),
                              fontSize: 12.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: currentLanguage == 'lesotho'
                                  ? 'Mohlokomeli'
                                  : 'Caregiver',
                              value: currentOvcHousehold.toString(),
                              keyColor: Color(0xFF92A791),
                              valueColor: Color(0xFF4B9F46),
                              fontSize: 12.0,
                            ),
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: currentLanguage == 'lesotho'
                                  ? 'Nomoro ea mohala'
                                  : 'Phone #',
                              value: currentOvcHousehold!.phoneNumber ?? '',
                              keyColor: Color(0xFF92A791),
                              valueColor: Color(0xFF4B9F46),
                              fontSize: 12.0,
                            ),
                            _getOvcChildInfoDetailsWidget(
                              currentLanguage: currentLanguage,
                              key: currentLanguage == 'lesotho'
                                  ? 'Motse'
                                  : 'Village',
                              value: currentOvcHousehold.village ?? '',
                              keyColor: Color(0xFF92A791),
                              valueColor: Color(0xFF4B9F46),
                              fontSize: 12.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
