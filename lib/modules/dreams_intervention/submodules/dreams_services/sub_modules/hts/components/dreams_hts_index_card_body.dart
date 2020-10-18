import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_card_bottom_content.dart';

class DreamsHTSIndexCardBody extends StatelessWidget {
  DreamsHTSIndexCardBody({
    Key key,
    @required this.eventData,
    @required this.indexStageId,
    Container cardBottonActions, 
    DreamsHTSIndexCardBottonContent cardBottonContent,
  }) : super(key: key);

  final Events eventData;
  final String indexStageId;

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
                      'Index Details',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: Color(0xFF82898D),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      eventData.toString(),
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
                          color: Color(0xFF82898D),
                          fontWeight: FontWeight.w500),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      eventData.eventDate,
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
    );
  }
}
