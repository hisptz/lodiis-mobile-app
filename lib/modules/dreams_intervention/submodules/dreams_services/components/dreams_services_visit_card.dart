import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/events.dart';

class DreamsServiceVisitListCard extends StatelessWidget {
  const DreamsServiceVisitListCard({
    Key key,
    @required this.eventData,
    @required this.visitName,
    this.visitCount,
    this.onView,
    this.onEdit,
    this.editDisabled,
  }) : super(key: key);

  final Events eventData;
  final Function onView;
  final Function onEdit;
  final int visitCount;
  final String visitName;
  final bool editDisabled;

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
                            color: Color(0xFF82898D),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: visitCount == null || visitCount == 0
                                  ? "      $visitName "
                                  : "      $visitName " + visitCount.toString(),
                              style: TextStyle().copyWith(
                                color: Color(0xFF05131B),
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
                      onTap: onView,
                      child: Container(
                        height: iconHeight,
                        width: iconHeight,
                        margin: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/expand_icon.svg',
                          color: Color(0xFF1F8ECE),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: InkWell(
                      onTap: editDisabled == true ? null : onEdit,
                      child: Container(
                        height: iconHeight,
                        width: iconHeight,
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/edit-icon.svg',
                          color: Color(0xFF1F8ECE),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
