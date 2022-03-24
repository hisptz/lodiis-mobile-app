import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_child_service_home_constant.dart';
import 'package:provider/provider.dart';

class OvcServiceChildCard extends StatelessWidget {
  final OvcChildServiceHomeConstant ovcChildServiceHomeCard;
  final String countValue;

  const OvcServiceChildCard({
    Key? key,
    required this.ovcChildServiceHomeCard,
    required this.countValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialCard(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(7.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF35B638),
                ),
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Text(
                    countValue,
                    style: const TextStyle().copyWith(
                      fontSize: 10.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  bottom: 9,
                ),
                child: SvgPicture.asset(
                  ovcChildServiceHomeCard.icon!,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 5.0,
            ),
            child: const LineSeparator(
              color: Color(0xFFECF9EB),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 1.0,
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
                  style: const TextStyle().copyWith(
                    color: const Color(0xFF143D14),
                    fontSize: 12.0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
