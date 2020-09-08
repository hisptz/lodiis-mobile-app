import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/interverntion_selection_home_collapse_card.dart';

class InterventionSelectionHomeCard extends StatefulWidget {
  int widgetIndex;
  InterventionSelectionHomeCard({@required this.widgetIndex});

  @override
  _InterventionSelectionHomeCardState createState() =>
      _InterventionSelectionHomeCardState(widgetindex: widgetIndex);
}

class _InterventionSelectionHomeCardState
    extends State<InterventionSelectionHomeCard> {
  int widgetindex;
  _InterventionSelectionHomeCardState({@required this.widgetindex});

  double _animatedHeight;

  @override
  void initState() {
    super.initState();
    _animatedHeight = 100.0;
  }

  Widget referral() {
    return GestureDetector(
      onTap: () {
        print("hello");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20.25,
          ),
          SizedBox(
            width: 13.65,
          ),
          Text("REFERRAL", style: TextStyle(color: Color(0xFF4B9F46))),
        ],
      ),
    );
  }

  List<Widget> ovc_widgets = [
    //1
    GestureDetector(
      onTap: () {
        print("hello");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 21.25,
          ),
         
          Text("ASSESS", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12)),
           SizedBox(
            width: 69
          ),
          Text("PLAN", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12)),
           SizedBox(
            width: 69,
          ),
          Text("MONITOR", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12))
        ],
      ),
    ),
    //2
    GestureDetector(
      onTap: () {
        print("hello");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20.25,
          ),
          SizedBox(
            width: 13.65,
          ),
          Text("REFERRAL", style: TextStyle(color: Color(0xFF4B9F46))),
        ],
      ),
    ),
    //3
    GestureDetector(
      onTap: () {
        print("hello");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 21,
          ),
          
          Text("ACHIEVEMENT", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12)),
           SizedBox(
            width: 11
          ),
          Text("EXIT", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12)),
           SizedBox(
            width: 11,
          ),
          Text("TRANSFER", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12)),
           SizedBox(
            width: 20,
          ),
          Text("CLOSURE", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12))
        ],
      ),
    ),
    //4
       GestureDetector(
      onTap: () {
        print("hello");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20.25,
          ),
          SizedBox(
            width: 13.65,
          ),
          Text("REFERRAL", style: TextStyle(color: Color(0xFF4B9F46))),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(width);
    return SingleChildScrollView(
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 3.0, right: 8.0, top: 10.0, bottom: 0.0),
              child: Container(
                height: 228,
                width: 375,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(75, 159, 70, 0.05),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 5.0))
                ]),
                child: Card(
                  elevation: 0,
                  shadowColor: Color.fromRGBO(75, 159, 70, 0.05),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 0,
                      top: 5,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 51,
                                width: 292,
                                child: Card(
                                  elevation: 1,
                                  margin: EdgeInsets.only(top: 13),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20.25,
                                      ),
                                      SvgPicture.asset(
                                          "assets/icons/hh_icon.svg"),
                                      SizedBox(
                                        width: 13.65,
                                      ),
                                      Text(
                                        "HHID-IL-00120820",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(26, 53, 24, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      widgetindex == 0 || widgetindex == 1
                                          ? Row(
                                              children: [
                                                SizedBox(width: 106),
                                                GestureDetector(
                                                  child: _animatedHeight == 0.0
                                                      ? SvgPicture.asset(
                                                          "assets/icons/chevron_down.svg")
                                                      : SvgPicture.asset(
                                                          "assets/icons/chevron_up.svg"),
                                                  onTap: () {
                                                    setState(() {
                                                      _animatedHeight != 0.0
                                                          ? _animatedHeight =
                                                              0.0
                                                          : _animatedHeight =
                                                              100.0;
                                                    });
                                                  },
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                SizedBox(
                                                  width: 40,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SvgPicture.asset(
                                                      "assets/icons/expand_icon.svg"),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SvgPicture.asset(
                                                      "assets/icons/edit_icon.svg"),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                GestureDetector(
                                                  child: _animatedHeight == 0.0
                                                      ? SvgPicture.asset(
                                                          "assets/icons/chevron_down.svg")
                                                      : SvgPicture.asset(
                                                          "assets/icons/chevron_up.svg"),
                                                  onTap: () {
                                                    setState(() {
                                                      _animatedHeight != 0.0
                                                          ? _animatedHeight =
                                                              0.0
                                                          : _animatedHeight =
                                                              100.0;
                                                    });
                                                  },
                                                )
                                              ],
                                            )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Caregiver",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5)),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text("Lenka Mosela",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  26, 53, 24, 0.75)))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Caregiver",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5)),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text("Lenka Mosela",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  26, 53, 24, 0.75)))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Caregiver",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5)),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text("Lenka Mosela",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  26, 53, 24, 0.75)))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Caregiver",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5)),
                                      ),
                                      SizedBox(
                                        width: 23,
                                      ),
                                      Text("Lenka Mosela",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  26, 53, 24, 0.75)))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                color: Color.fromRGBO(75, 159, 70, 0.05),
                                height: 40,
                                width: 292,
                                child: Card(
                                  color: Color.fromRGBO(75, 159, 70, 0.05),
                                  margin: EdgeInsets.only(top: 18),
                                  elevation: 0,
                                  //this widget below may change depend on where in clicked
                                  child: ovc_widgets[widgetindex],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    width: 367,
                    height: _animatedHeight,
                    child: Card(
                        elevation: 0,
                        child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 12,
                              top: 5,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 22.75,
                                    ),
                                    SvgPicture.asset(
                                        "assets/icons/children_ovc_icon.svg"),
                                    SizedBox(
                                      width: 16.75,
                                    ),
                                    Text(
                                      "CHILDREN LIST",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(26, 53, 24, 1)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("1",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5))),
                                    Text(
                                      "Tebello Ramatla",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(26, 53, 24, 0.75)),
                                    ),
                                    Text(
                                      "view",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromRGBO(75, 159, 70, 1)),
                                    ),
                                    Text(
                                      "edit",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(75, 159, 70, 1)),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("2",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5))),
                                    Text(
                                      "Tebello Ramatla",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(26, 53, 24, 0.75)),
                                    ),
                                    Text(
                                      "view",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Color.fromRGBO(75, 159, 70, 1)),
                                    ),
                                    Text(
                                      "edit",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(75, 159, 70, 1)),
                                    )
                                  ],
                                )
                              ],
                            ))))),
          ],
        ),
      ),
    );
  }
}
