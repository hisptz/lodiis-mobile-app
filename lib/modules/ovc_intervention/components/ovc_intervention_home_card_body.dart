

import 'package:flutter/material.dart';

class OvcInterventionBodyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
                            children: [
                             
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   
                                    Padding(padding: EdgeInsets.only(left:0 ,top: 12,),
                                    child: Row(
                                   
                                      children: [
                                       
                                        Text(
                                          "Caregiver",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  37, 80, 35, 0.5)),
                                        ),
                                        SizedBox(
                                          width:( MediaQuery.of(context).size.width/14)  ,
                                        ),
                                        Text("Lenka Mosela",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    26, 53, 24, 0.75)))
                                      ],
                                    ),
                                    ),
                                     Padding(padding: EdgeInsets.only(left:0 ,top: 12),
                                    child: Row(
                                     
                                      children: [
                                       
                                        Text(
                                          "Caregiver",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  37, 80, 35, 0.5)),
                                        ),
                                         SizedBox(
                                          width:( MediaQuery.of(context).size.width/14)  ,
                                        ),
                                        Text("Lenka Mosela",
                                        overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    26, 53, 24, 0.75)))
                                      ],
                                    ),
                                    ),
                                     Padding(padding: EdgeInsets.only(left:20 ,top: 12),
                                    child: Row(
                                     
                                     
                                      children: [
                                       
                                       
                                           Text(
                                            "   # of OVC",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    37, 80, 35, 0.5)),
                                          ),
                                        
                                          SizedBox(
                                          width:( MediaQuery.of(context).size.width/10)  ,
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
                                                       Text("  male - 1",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    26, 53, 24, 0.75)))


                                      ],
                                    ),
                                    ),
                                   
                                  ],
                                ),
                              
                            ],
                          ),
    );
  }
}