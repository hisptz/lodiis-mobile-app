import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral_event.dart';

class OvcReferralCardBodySummary extends StatefulWidget {
  OvcReferralCardBodySummary({
    Key key,
    @required this.referralEvent,
    @required this.labelColor,
    @required this.valueColor,
  }) : super(key: key);

  final Events referralEvent;
  final Color labelColor;
  final Color valueColor;

  @override
  _OvcReferralCardBodySummaryState createState() =>
      _OvcReferralCardBodySummaryState();
}

class _OvcReferralCardBodySummaryState
    extends State<OvcReferralCardBodySummary> {
  OvcReferralEvent ovcReferralCard;

  @override
  void initState() {
    super.initState();
    ovcReferralCard = OvcReferralEvent().fromTeiModel(widget.referralEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: ovcReferralCard != null,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Date',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.labelColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      ovcReferralCard.date,
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.valueColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Service mode',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.labelColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      ovcReferralCard.serviceMode,
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.valueColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Category',
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.labelColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      ovcReferralCard.category,
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.valueColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    'Type',
                    style: TextStyle().copyWith(
                        fontSize: 14.0,
                        color: widget.labelColor,
                        fontWeight: FontWeight.w500),
                  )),
                  Expanded(
                    flex: 2,
                    child: Text(
                      ovcReferralCard.type,
                      style: TextStyle().copyWith(
                          fontSize: 14.0,
                          color: widget.valueColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    'Status',
                    style: TextStyle().copyWith(
                        fontSize: 14.0,
                        color: widget.labelColor,
                        fontWeight: FontWeight.w500),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          ovcReferralCard.status,
                          style: TextStyle().copyWith(
                              fontSize: 14.0,
                              color: widget.valueColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
