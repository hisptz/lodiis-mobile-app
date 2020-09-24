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
              Padding(
                padding: EdgeInsets.only(
                  left: 0,
                  top: 12,
                ),
                child: Row(
                  children: [
                    //808080

                    Text(
                      "Caregiver",
                      style: TextStyle(color: Color(0xff8faf8f)),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 14),
                    ),
                    Text("Lenka Mosela",
                        style: TextStyle(color: Color(0xff507050)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, top: 12),
                child: Row(
                  children: [
                    Text(
                      "Caregiver",
                      style: TextStyle(color: Color(0xff8faf8f)),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 14),
                    ),
                    Text("Lenka Mosela",
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Color(0xff507050)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 12),
                child: Row(
                  children: [
                    Text(
                      "   # of OVC",
                      style: TextStyle(color: Color(0xff8faf8f)),
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 10),
                    ),
                    Text("Female - 2",
                        style: TextStyle(color: Color(0xff507050))),
                    Container(
                      child: Text("  "),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color(0xff507050), width: 1))),
                    ),
                    Text("  male - 1",
                        style: TextStyle(color: Color(0xff507050)))
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
