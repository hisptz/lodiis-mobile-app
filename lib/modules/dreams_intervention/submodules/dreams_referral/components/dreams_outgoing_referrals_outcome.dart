import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/core/components/input_fields/search_input.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';

class DreamsOutgoingReferralsOutcome extends StatefulWidget {
  DreamsOutgoingReferralsOutcome({@required this.agywList});
  final List<AgywDream> agywList;

  @override
  _DreamsOutgoingReferralsOutcomeState createState() =>
      _DreamsOutgoingReferralsOutcomeState();
}

class _DreamsOutgoingReferralsOutcomeState
    extends State<DreamsOutgoingReferralsOutcome> {
  final String svgIcon = 'assets/icons/dreams-header-icon.svg';

  onView(AgywDream agyw) {
    print('Viewing: ${agyw.id}');
  }

  onSearchBeneficiary(String value) {
    print('Searching: $value');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Column(children: [
            SearchInput(
              onSearch: (value) => onSearchBeneficiary(value),
            ),
            SizedBox(
              height: 10,
            ),
            ...widget.agywList
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
                                              Wrap(children: [
                                                Text(agyw.toString(),
                                                    style: TextStyle().copyWith(
                                                        color:
                                                            Color(0xFF05131B),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                              Wrap(children: [
                                                Text(agyw.primaryUIC)
                                              ])
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
                .toList()
          ]),
        ),
      ),
    );
  }
}
