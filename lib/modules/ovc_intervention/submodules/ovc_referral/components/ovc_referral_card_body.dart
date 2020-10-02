import 'dart:ui';
import 'package:flutter/material.dart';

class OvcReferralCardBody extends StatelessWidget {
  final Map<String, dynamic> referralDetails;
  OvcReferralCardBody({Key key, this.referralDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> dataValuesDetails = [];

    for (var datavalue in referralDetails["dataValues"]) {
      dataValuesDetails.add(datavalue["value"]);
    }
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
                      'Date',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF92A791),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "${referralDetails["eventDate"]}",
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
                      'Category',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF92A791),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Clinical Services Bookings ",
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
                      'Type',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0XFF92A791),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "HTS",
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
                      'Status',
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
                          '${referralDetails["status"]}',
                          style: TextStyle().copyWith(
                              fontSize: 14.0,
                              color: Color(0XFF536852),
                              fontWeight: FontWeight.w500),
                        )),
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
