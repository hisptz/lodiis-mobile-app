import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/referral_outcome_follow_up_event.dart';

class ReferralOutComeFollowUp extends StatelessWidget {
  const ReferralOutComeFollowUp({
    Key key,
    @required this.referralOutComeFollowUpEvents,
    @required this.themeColor,
  }) : super(key: key);

  final List<ReferralOutFollowUpComeEvent> referralOutComeFollowUpEvents;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            referralOutComeFollowUpEvents.map((referralOutComeFollowUpEvent) {
          int index = referralOutComeFollowUpEvents
                  .indexOf(referralOutComeFollowUpEvent) +
              1;
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
                  margin: EdgeInsets.only(left: 15.0, top: 5.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Follow-up date',
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
                              referralOutComeFollowUpEvent.followUpDate,
                              style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: Color(0xFF1A3518),
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Follow-up Status',
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
                              referralOutComeFollowUpEvent.followUpStatus,
                              style: TextStyle().copyWith(
                                fontSize: 14.0,
                                color: Color(0xFF1A3518),
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Comments or next steps',
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
                              referralOutComeFollowUpEvent.comments,
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
      ),
    );
  }
}
