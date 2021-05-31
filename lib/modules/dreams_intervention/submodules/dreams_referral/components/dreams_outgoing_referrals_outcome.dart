import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';

class DreamsOutgoingReferralsOutcome extends StatelessWidget {
  DreamsOutgoingReferralsOutcome({@required this.agywList});
  final List<AgywDream> agywList;
  final String svgIcon = 'assets/icons/dreams-header-icon.svg';

  onView(AgywDream agyw) {
    print('Viewing: ${agyw.id}');
  }

  @override
  Widget build(BuildContext context) {
    double iconHeight = 25;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Column(
              children: agywList
                  .map((agyw) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: MaterialCard(
                          body: GestureDetector(
                            onTap: () => onView(agyw),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 5.0),
                                                height: 20.0,
                                                width: 20.0,
                                                child: SvgPicture.asset(
                                                  svgIcon,
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 10,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${agyw.firstname} ${agyw.surname}',
                                                    style: TextStyle().copyWith(
                                                        color:
                                                            Color(0xFF05131B),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(agyw.primaryUIC)
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
