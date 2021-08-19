import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_child_service_home_constant.dart';
import 'package:provider/provider.dart';

class OvcServiceChildCard extends StatelessWidget {
  final OvcChildServiceHomeConstant ovcChildServiceHomeCard;
  final String countValue;

  OvcServiceChildCard({
    required this.ovcChildServiceHomeCard,
    required this.countValue,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialCard(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF35B638),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text(
                        countValue,
                        style: TextStyle().copyWith(
                          fontSize: 10.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      bottom: 9,
                    ),
                    child: SvgPicture.asset(
                      ovcChildServiceHomeCard.icon!,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5.0,
              ),
              child: LineSeparator(
                color: Color(0xFFECF9EB),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Consumer<LanguageTranslationState>(
                builder: (context, languageTranslationState, child) {
                  String? currentLanguage =
                      languageTranslationState.currentLanguage;
                  return Text(
                    currentLanguage == 'lesotho' &&
                            ovcChildServiceHomeCard.translatedTitle != null
                        ? ovcChildServiceHomeCard.translatedTitle!
                        : ovcChildServiceHomeCard.title!,
                    style: TextStyle().copyWith(
                      color: Color(0xFF143D14),
                      fontSize: 12.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
