import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact.dart';

class DreamsHTSIndexContactCardBody extends StatelessWidget {
  DreamsHTSIndexContactCardBody({
    Key? key,
    this.event,
  }) : super(key: key);

  final IndexContact? event;

  @override
  Widget build(BuildContext context) {
    Map eventData = event!.toDataMap();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Column(
        children: [
          event == null
              ? Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text('Index is not yet registered'))
              : Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                'Name',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                eventData['name'],
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
                                'Date of Birth',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                eventData['dateOfBirth'],
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
                                'Age',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                eventData['age'],
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
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                eventData['status'],
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
                                'Sex',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                eventData['sex'],
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
                                'Phone Number',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                eventData['phoneNumber'],
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: Color(0XFF536852),
                                    fontWeight: FontWeight.w500),
                              ))
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
