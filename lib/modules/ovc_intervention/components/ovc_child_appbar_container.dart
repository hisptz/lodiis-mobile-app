import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class OvcChildAppBarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      color: Color(0xFFFFFFFF),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 49, top: 20, bottom: 10),
                  child: Expanded(
                    child: Text("Pula Khabane",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                  ))
            ],
          ),
          LineSeperator(
            height: 1,
            color: Color(0xFFECF9EB),
          ),
          Container(
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.only(bottom: 9, top: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 0,
                    child: Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "    Sex  ",
                              style: TextStyle(color: Color(0xFF8FAF8F)),
                            ),
                            Text("female      ",
                                style: TextStyle(color: Color(0xFF35B638)))
                          ],
                        ))),
                Expanded(
                    flex: 0,
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Age  ",
                            style: TextStyle(color: Color(0xFF8FAF8F))),
                        Text("10       ",
                            style: TextStyle(color: Color(0xFF35B638)))
                      ],
                    ))),
                Expanded(
                    flex: 0,
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Caregiver  ",
                            style: TextStyle(color: Color(0xFF8FAF8F))),
                        Text("Lenka Mosela",
                            style: TextStyle(color: Color(0xFF35B638)))
                      ],
                    ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
