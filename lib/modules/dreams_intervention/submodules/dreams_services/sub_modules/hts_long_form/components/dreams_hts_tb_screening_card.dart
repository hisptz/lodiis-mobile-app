import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/dreams_hts_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/dreams_hts_tb_screening_event.dart';

class DreamsHTSTBScreeningCard extends StatefulWidget {
  const DreamsHTSTBScreeningCard({
    Key key,
    @required this.tbEvents,
    this.onViewTB,
    this.onEditTB,
  }) : super(key: key);

  final Function onViewTB;
  final Function onEditTB;
  final DreamsHTSTBScreeningEvent tbEvents;

  @override
  _DreamsHTSTBScreeningCardState createState() =>
      _DreamsHTSTBScreeningCardState();
}

class _DreamsHTSTBScreeningCardState extends State<DreamsHTSTBScreeningCard> {
  DreamsHTSEvent dreamsHTSEventCard;

  @override
  Widget build(BuildContext context) {
    double iconHeight = 20;
    return widget.tbEvents == null
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 0.0,
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: MaterialCard(
                      body: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: '${widget.tbEvents.date}   ',
                                    style: TextStyle().copyWith(
                                      color: Color(0xFF82898D),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "TB Screening",
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
                                  onTap: widget.onViewTB,
                                  child: Container(
                                    height: iconHeight,
                                    width: iconHeight,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
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
                                  onTap: widget.onEditTB,
                                  child: Container(
                                    height: iconHeight,
                                    width: iconHeight,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
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
                ],
              ),
            ),
          );
  }
}
