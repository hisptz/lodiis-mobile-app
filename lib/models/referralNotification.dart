import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';

class ReferralNotification {
  String id;
  String implementingPartner;
  String location;
  String tei;
  List<ReferralEventNotification> referrals;

  static final String implementingPartnerFormVariable = "y0bvausyTyh";
  static final String facility = "jOXN2iPhkxj";
  static final String communityCouncil = "ubB83OWNWsv";

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

  String toJson() {
    Map data = toOffline();
    data["referrals"] = referrals
        .map((ReferralEventNotification referralEventNotification) =>
            referralEventNotification.toJson())
        .toList();
    return json.encode(data);
  }

  Map toOffline() {
    Map data = Map<String, dynamic>();
    data["id"] = id;
    data["implementingPartner"] = implementingPartner;
    data["location"] = location;
    data["tei"] = tei;
    data["referrals"] = referrals
        .map((ReferralEventNotification referralEventNotification) =>
            referralEventNotification.toOffline())
        .toList();
    return data;
  }

  @override
  String toString() {
    return "<$id $implementingPartner $location $tei $referrals>";
  }
}
