import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/referral_outcome_follow_up_event.dart';

class ReferralOutComeFollowUp extends StatelessWidget {
  const ReferralOutComeFollowUp({
    Key key,
    @required this.referralOutComeEvents,
    @required this.themeColor,
  }) : super(key: key);

  final List<ReferralOutFollowUpComeEvent> referralOutComeEvents;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: referralOutComeEvents.map((referralOutComeEvent) {
        int index = referralOutComeEvents.indexOf(referralOutComeEvent) + 1;
        return Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Container(
                child: LineSeperator(color: themeColor.withOpacity(0.2)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'FOLLOW UP $index',
                  style: TextStyle().copyWith(
                    color: themeColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Container(
                child: LineSeperator(color: themeColor.withOpacity(0.2)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 5.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Label',
                            style: TextStyle().copyWith(
                              fontSize: 14.0,
                              color: themeColor.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Value',
                            style: TextStyle().copyWith(
                              fontSize: 14.0,
                              color: Color(0xFF1A3518),
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
