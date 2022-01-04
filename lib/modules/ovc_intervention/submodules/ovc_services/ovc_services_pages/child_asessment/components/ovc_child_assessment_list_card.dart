import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/events.dart';

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
    double iconHeight = 20;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 17.0,
      ),
      child: MaterialCard(
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: '${eventData.eventDate}   ',
                          style: TextStyle().copyWith(
                            color: Color(0xFF92A791),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: programStageMap[eventData.programStage] ??
                                  'Assessment',
                              style: TextStyle().copyWith(
                                color: Color(0xFF1A3518),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: InkWell(
                        onTap: onViewAssessment as void Function()?,
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/expand_icon.svg',
                            color: Color(0xFF4B9F46),
                          ),
                        )),
                  ),
                  Visibility(
                    visible: eventData.enrollmentOuAccessible!,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: InkWell(
                        onTap: onEditAssessment as void Function()?,
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/edit-icon.svg',
                            color: Color(0xFF4B9F46),
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
  }
}
