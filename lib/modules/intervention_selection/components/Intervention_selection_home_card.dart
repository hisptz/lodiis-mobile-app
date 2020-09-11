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
    _animatedHeight = 0.0;
  }

  Widget referral() {
    return GestureDetector(
      onTap: () {
        
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
        
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
         
         Padding(padding: EdgeInsets.only(top:12 ,bottom: 14,left:20 ,),
         child:  Text("ASSESS", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12)),
         
         
         ),
          Padding(padding: EdgeInsets.only(top:12 ,bottom: 14,left:60 ,) ,
          
          child: Text("PLAN", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12)),
          
          ),
         Padding(padding: EdgeInsets.only(top:12 ,bottom: 14,left:60 ,) ,
         child:  Text("MONITOR", style: TextStyle(color: Color(0xFF4B9F46),fontWeight: FontWeight.bold,fontSize: 12))
       
       ,
         )
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
        margin: const EdgeInsets.only(top: 13,left: 13,right: 13,bottom: 15),
        elevation: 2,
    //      shape: RoundedRectangleBorder(
    // borderRadius: BorderRadius.only(
    //   bottomRight: Radius.circular(10),
    //   topRight: Radius.circular(10)),
    // side: BorderSide(width: 5, color: Colors.green),
        child: Column(
          children: [
            
       
       
                    Column(
                      children: [
                        Row(
                          children: [
                            
                                 Container(
                                   width: width,
                                   child: Card(
                                     color: Colors.red,
                                     
                                     
                                    elevation: 1,
                                    margin: EdgeInsets.only(top: 0,right: 0,left: 0,bottom: 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        
                                       Padding(padding: EdgeInsets.only(left:20.25,top: 17,bottom: 14.9 ),
                                       child:  SvgPicture.asset(
                                            "assets/icons/hh_icon.svg"),
                                       ),
                                        
                                         Padding(padding: EdgeInsets.only(left:13.65,top: 20,bottom: 15 ),
                                         child: Text(
                                          "HHID-IL-00120820",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(26, 53, 24, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                         )
                                        ,
                                        widgetindex == 0 || widgetindex == 1
                                            ? 
                                             Row(
                                                children: [
                                               
                                                  GestureDetector(
                                                    child: _animatedHeight == 0.0
                                                        ? Padding(padding:EdgeInsets.only(left:88,top: 26.67,bottom: 19.33,right: 25),
                                                        child: SvgPicture.asset(
                                                            "assets/icons/chevron_down.svg",),
                                                        )
                                                        : Padding(padding:EdgeInsets.only(left:88,top: 26.67,bottom: 19.33,right: 25), 
                                                        child: SvgPicture.asset(
                                                            "assets/icons/chevron_up.svg"),
                                                        ),
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
                                                  
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left:27.3,top: 22.5,bottom: 13.5,right: 20.85),
                                                    
                                                    child: SvgPicture.asset(
                                                        "assets/icons/expand_icon.svg"),
                                                    ),
                                                  ),
                                             
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left:0,top: 23.19,bottom: 14.33,right: 0),
                                                    
                                                    child: SvgPicture.asset(
                                                        "assets/icons/edit_icon.svg"),
                                                    ),
                                                  ),
                                                 
                                                  GestureDetector(
                                                    child: _animatedHeight == 0.0
                                                        ?Padding(padding:EdgeInsets.only(right:29.19 ,top:28.33,bottom:17.67,left:24 ),child:  SvgPicture.asset(
                                                            "assets/icons/chevron_down.svg"),)
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
                                ),
                                 ),
                          ],
                        ),
                        Row(
                          children: [
                           
                               Column(
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
                            
                          ],
                        ),
                        SingleChildScrollView(child: ovc_widgets[widgetindex],)
                     
                      ],
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
