import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class ReferralOutComeView extends StatelessWidget {
  const ReferralOutComeView({
    Key key,
    @required this.themeColor,
    @required this.referralOutComeEvent,
    @required this.beneficiary,
    @required this.referralFollowUpStage,
    @required this.referralToFollowUpLinkage,
    @required this.referralProgram,
    @required this.isEditableMode,
  }) : super(key: key);

  final ReferralOutComeEvent referralOutComeEvent;
  final Color themeColor;
  final TrackeEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;
  final bool isEditableMode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Date client reached the referral station',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: themeColor.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 2.0),
                                child: Text(
                                  referralOutComeEvent.dateClientReachStation,
                                  style: TextStyle().copyWith(
                                      fontSize: 14.0,
                                      color: Color(0xFF1A3518),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Date service was provided',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: themeColor.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 2.0),
                                child: Text(
                                  referralOutComeEvent.dateServiceProvided,
                                  style: TextStyle().copyWith(
                                      fontSize: 14.0,
                                      color: Color(0xFF1A3518),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Comments or next steps',
                                style: TextStyle().copyWith(
                                    fontSize: 14.0,
                                    color: themeColor.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 2.0),
                                child: Text(
                                  referralOutComeEvent.comments,
                                  style: TextStyle().copyWith(
                                      fontSize: 14.0,
                                      color: Color(0xFF1A3518),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          Container(
            child: Visibility(
              visible: isEditableMode && referralOutComeEvent.requredFollowUp,
              child: Container(
                decoration: BoxDecoration(
                  color: themeColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () => {},
                        child: Text(
                          'ADD FOLLOW-UP',
                          style: TextStyle().copyWith(
                            color: Color(0XFFFAFAFA),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
