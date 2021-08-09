import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_card_bottom_content.dart';

class DreamsHTSIndexCardBody extends StatelessWidget {
  DreamsHTSIndexCardBody({
    Key key,
    this.event,
    Container cardButtonActions,
    DreamsHTSIndexCardButtonContent cardButtonContent,
  }) : super(key: key);

  final AgywDreamsIndexInfoEvent event;

  @override
  Widget build(BuildContext context) {
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
                                'Index Details',
                                style: TextStyle().copyWith(
                                    fontSize: 16.0,
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                '',
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
                                event.date,
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
                                'On ART',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: Color(0xFF82898D),
                                    fontWeight: FontWeight.w500),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                event.onART == 'true' ? 'Yes' : 'No',
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
