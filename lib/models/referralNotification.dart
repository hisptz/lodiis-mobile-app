import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';

class ReferralNotification {
  String id;
  String implementingPartner;
  String location;
  String tei;
  List<ReferralEventNotification> referrals;

  ReferralNotification({
    @required this.id,
    @required this.implementingPartner,
    @required this.location,
    @required this.tei,
    this.referrals,
  }) {
    this.referrals = this.referrals ?? [];
  }
}
