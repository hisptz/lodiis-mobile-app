import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:provider/provider.dart';

class OvcChildAssessmentListCard extends StatelessWidget {
  const OvcChildAssessmentListCard({
    Key? key,
    required this.eventData,
    required this.programStageMap,
    this.onViewAssessment,
    this.onEditAssessment,
  }) : super(key: key);

  final Events eventData;
  final Map programStageMap;
  final Function? onViewAssessment;
  final Function? onEditAssessment;

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
        String currentLanguage = languageTranslationState.currentLanguage;

        double iconHeight = 20;

        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 17.0,
          ),
          child: MaterialCard(
            body: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: '${eventData.eventDate}   ',
                            style: const TextStyle().copyWith(
                              color: const Color(0xFF92A791),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: programStageMap[eventData.programStage] ??
                                        currentLanguage == 'lesotho'
                                    ? 'Hlahlobo'
                                    : 'Assessment',
                                style: const TextStyle().copyWith(
                                  color: const Color(0xFF1A3518),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: InkWell(
                            onTap: onViewAssessment as void Function()?,
                            child: Container(
                              height: iconHeight,
                              width: iconHeight,
                              margin: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 5.0,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/expand_icon.svg',
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF4B9F46),
                                  BlendMode.srcIn,
                                ),
                              ),
                            )),
                      ),
                      Visibility(
                        visible: eventData.enrollmentOuAccessible!,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: InkWell(
                            onTap: onEditAssessment as void Function()?,
                            child: Container(
                              height: iconHeight,
                              width: iconHeight,
                              margin: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 5.0,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/edit-icon.svg',
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF4B9F46),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
