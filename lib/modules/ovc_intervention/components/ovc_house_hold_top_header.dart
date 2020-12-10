import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_header.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldInfoTopHeader extends StatelessWidget {
  const OvcHouseHoldInfoTopHeader({
    Key key,
    @required this.currentOvcHouseHold,
  }) : super(key: key);
  final OvcHouseHold currentOvcHouseHold;
  final String svgIcon = 'assets/icons/hh_icon.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;
          return Material(
            type: MaterialType.card,
            elevation: 1.0,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: OvcHouseHoldCardHeader(
                      ovcHouseHold: currentOvcHouseHold,
                      svgIcon: svgIcon,
                      canEdit: false,
                      canExpand: false,
                      canView: false,
                      isExpanded: false,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: currentLanguage == 'lesotho'
                                ? 'Mohlokomeli  '
                                : 'Caregiver  ',
                            style: TextStyle().copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF92A791),
                            ),
                            children: [
                              TextSpan(
                                text: currentOvcHouseHold.toString(),
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF536852),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
