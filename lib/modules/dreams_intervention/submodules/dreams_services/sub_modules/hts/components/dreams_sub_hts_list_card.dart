import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/events.dart';

class DreamsSubHTSListCard extends StatelessWidget {
  const DreamsSubHTSListCard({
    Key key,
    @required this.eventData,
    @required this.sessionCount,
    @required this.eventId,
    @required this.indexCard,
    this.onViewConsent,
    this.onViewIntake,
    this.onViewStatus,
    this.onEditConsent,
    this.onEditIntake,
    this.onEditStatus, 
  }) : super(key: key);

  final Events eventData;
  final Function onViewConsent;
  final Function onEditConsent;
  final Function onViewIntake;
  final Function onEditIntake;
  final Function onViewStatus;
  final Function onEditStatus;
  final int sessionCount;
  final String eventId;
  final Widget indexCard;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 17.0,
      ),
      child:  Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom:15.0),
                child: MaterialCard(
                    body: Container(
                      margin: EdgeInsets.only(left:10.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                                    text:"Consent",
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
                              onTap: onViewConsent,
                              child: Container(
                                height: iconHeight,
                                width: iconHeight,
                                margin:
                                    EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: SvgPicture.asset(
                                  'assets/icons/expand_icon.svg',
                                  color: Color(0xFF1F8ECE),
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: InkWell(
                              onTap: onEditConsent,
                              child: Container(
                                height: iconHeight,
                                width: iconHeight,
                                margin:
                                    EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: SvgPicture.asset(
                                  'assets/icons/edit-icon.svg',
                                  color: Color(0xFF1F8ECE),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
               Container(
                 margin: EdgeInsets.only(bottom:15.0),
                 child: MaterialCard(
                    body: Container(
                    margin: EdgeInsets.only(left:10.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                                   text:
                                        "Client Intake",
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
                              onTap: onViewIntake,
                              child: Container(
                                height: iconHeight,
                                width: iconHeight,
                                margin:
                                    EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: SvgPicture.asset(
                                  'assets/icons/expand_icon.svg',
                                  color: Color(0xFF1F8ECE),
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: InkWell(
                              onTap: onEditIntake,
                              child: Container(
                                height: iconHeight,
                                width: iconHeight,
                                margin:
                                    EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: SvgPicture.asset(
                                  'assets/icons/edit-icon.svg',
                                  color: Color(0xFF1F8ECE),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
              ),
               ),
                Container(
                  margin: EdgeInsets.only(bottom:15.0),
                  child: MaterialCard(
                    body: Container(
                    margin: EdgeInsets.only(left:10.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                                   text:
                                        "Status Consent",
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
                              onTap: onViewStatus,
                              child: Container(
                                height: iconHeight,
                                width: iconHeight,
                                margin:
                                    EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: SvgPicture.asset(
                                  'assets/icons/expand_icon.svg',
                                  color: Color(0xFF1F8ECE),
                                ),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: InkWell(
                              onTap: onEditStatus,
                              child: Container(
                                height: iconHeight,
                                width: iconHeight,
                                margin:
                                    EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: SvgPicture.asset(
                                  'assets/icons/edit-icon.svg',
                                  color: Color(0xFF1F8ECE),
                                ),
                              )),
                        ),
                      ],
                    ),
              ),
               ),
                ),
              indexCard
            ],
          ),
        ),
    );
  }
}
