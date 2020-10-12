import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_view.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class ReferralOutComeViewContainer extends StatefulWidget {
  const ReferralOutComeViewContainer({
    Key key,
    @required this.themeColor,
    @required this.eventData,
    @required this.beneficiary,
    @required this.referralFollowUpStage,
    @required this.referralToFollowUpLinkage,
    @required this.referralProgram,
    @required this.isEditableMode,
  }) : super(key: key);

  final Color themeColor;
  final Events eventData;
  final TrackeEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;
  final bool isEditableMode;

  @override
  _ReferralOutComeViewContainerState createState() =>
      _ReferralOutComeViewContainerState();
}

class _ReferralOutComeViewContainerState
    extends State<ReferralOutComeViewContainer> {
  ReferralOutComeEvent referralOutComeEvent;
  bool isViewReady = false;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 1,
      ),
      () {
        setState(
          () {
            isViewReady = true;
            referralOutComeEvent =
                ReferralOutComeEvent().fromTeiModel(widget.eventData);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return !isViewReady
        ? Container(
            child: CircularProcessLoader(
              color: Colors.blueGrey,
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFB2B7B9),
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Text(
                      'OUTCOME',
                      style: TextStyle().copyWith(
                        color: Color(0xFF1A3518),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  LineSeperator(
                    color: Color(0xFFB2B7B9),
                    height: 1.0,
                  ),
                  Container(
                    child: ReferralOutComeView(
                      isEditableMode: widget.isEditableMode,
                      referralOutComeEvent: referralOutComeEvent,
                      beneficiary: widget.beneficiary,
                      themeColor: widget.themeColor,
                      referralFollowUpStage: widget.referralFollowUpStage,
                      referralProgram: widget.referralProgram,
                      referralToFollowUpLinkage:
                          widget.referralToFollowUpLinkage,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
