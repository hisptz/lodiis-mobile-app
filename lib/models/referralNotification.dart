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

  factory ReferralNotification.fromJson(Map data) {
    String id = data["id"] ?? "";
    String implementingPartner = data["implementingPartner"] ?? "";
    String location = data["location"] ?? "";
    String tei = data["tei"] ?? "";
    List referrals = (data["referrals"] as List ?? [])
        .map((dynamic json) => ReferralEventNotification.fromJson(json))
        .toList();
    return ReferralNotification(
      id: id,
      implementingPartner: implementingPartner,
      location: location,
      tei: tei,
      referrals: referrals,
    );
  }

  factory ReferralNotification.toJSon() {
    return null;
  }

  @override
  String toString() {
    return "<$id $implementingPartner $location $tei>";
  }
}
