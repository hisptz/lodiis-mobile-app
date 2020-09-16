

import 'package:flutter/material.dart';

class OvcInterventionBodyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
                          children: [
                           
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 
                                  Padding(padding: EdgeInsets.only(left:20 ,top: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                     
                                      Text(
                                        "Caregiver",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5)),
                                      ),
                                      SizedBox(
                                        width:( MediaQuery.of(context).size.width/8)+3  ,
                                      ),
                                      Text("Lenka Mosela",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  26, 53, 24, 0.75)))
                                    ],
                                  ),
                                  ),
                                   Padding(padding: EdgeInsets.only(left:20 ,top: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                     
                                      Text(
                                        "Caregiver",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                37, 80, 35, 0.5)),
                                      ),
                                       SizedBox(
                                        width:( MediaQuery.of(context).size.width/8)+3  ,
                                      ),
                                      Text("Lenka Mosela",
                                      overflow: TextOverflow.clip,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  26, 53, 24, 0.75)))
                                    ],
                                  ),
                                  ),
                                   Padding(padding: EdgeInsets.only(left:0 ,top: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                     
                                      Padding(
                                        padding: const EdgeInsets.only(right: 48),
                                        child: Text(
                                          "# of OVC",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  37, 80, 35, 0.5)),
                                        ),
                                      ),
                                       
                                      Text("Female - 2",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  26, 53, 24, 0.75))),
                                                  Container(
                                                    
                                                    child: Text("  "),
  decoration: BoxDecoration(

                    border: Border(
                      right: BorderSide( color: Color.fromRGBO(
                                                  26, 53, 24, 0.75),width: 1)

                    )
                    ),

                                                  ),
 

                                                  //  Expanded(
                                                  
                                                  //    child: Container(
                                                  //      color: Colors.red,

                                                  //    ),)
                                          //            Text("     male - 1",
                                          // style: TextStyle(
                                          //     color: Color.fromRGBO(
                                          //         26, 53, 24, 0.75))))


                                    ],
                                  ),
                                  ),
                                 
                                ],
                              ),
                            
                          ],
                        );
  }
}