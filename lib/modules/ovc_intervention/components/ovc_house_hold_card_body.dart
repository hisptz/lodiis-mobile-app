import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';

class OvcHouseHoldCardBody extends StatelessWidget {
  OvcHouseHoldCardBody({
    Key key,
    @required this.ovcHouseHold,
  }) : super(key: key);

  final OvcHouseHold ovcHouseHold;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'Caregiver',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF92A791),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      ovcHouseHold.toString(),
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF536852),
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'Created',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF92A791),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      ovcHouseHold.createdDate,
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF536852),
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'Loaction',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF92A791),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      ovcHouseHold.location,
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF536852),
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      '# of OVC',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF92A791),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Container(
                            child: Text(
                          'Female - ${ovcHouseHold.ovcFemaleCount}',
                          style: TextStyle().copyWith(
                              fontSize: 14.0,
                              color: Color(0XFF536852),
                              fontWeight: FontWeight.w500),
                        )),
                        Container(
                          height: 14.0,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                  color: Color(0xFFC9E2C7), width: 1.0),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Male - ${ovcHouseHold.ovcMaleCount}',
                            style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: Color(0XFF536852),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
