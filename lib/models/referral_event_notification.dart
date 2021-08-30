import 'package:flutter/material.dart';

class ReferralEventNotification {
  String id;
  String tei;
  String nameSpaceKey;
  String fromImplementingPartner;
  bool? isCompleted;
  bool? isViewed;

  ReferralEventNotification({
    required this.id,
    required this.tei,
    required this.nameSpaceKey,
    required this.fromImplementingPartner,
    this.isCompleted,
    this.isViewed,
  }) {
    this.isCompleted = this.isCompleted ?? false;
    this.isViewed = this.isViewed ?? false;
  }

  factory ReferralEventNotification.fromJson(Map json) {
    String id = json["id"] ?? "";
    String tei = json["tei"] ?? "";
    String nameSpaceKey = json["nameSpaceKey"] ?? "";
    String fromImplementingPartner = json["fromImplementingPartner"] ?? "";
    dynamic isCompleted = json["isCompleted"];
    dynamic isViewed = json["isViewed"];
    return ReferralEventNotification(
      id: id,
      tei: tei,
      fromImplementingPartner: fromImplementingPartner,
      nameSpaceKey: nameSpaceKey,
      isCompleted: "$isCompleted" == "1" || "$isCompleted" == "true",
      isViewed: "$isViewed" == "1" || "$isViewed" == "true",
    );
  }

  Map toOffline({
    bool shouldTransformBooleanValues = false,
  }) {
    var data = Map<String, dynamic>();
    data["id"] = id;
    data["nameSpaceKey"] = nameSpaceKey;
    data["fromImplementingPartner"] = fromImplementingPartner;
    data["tei"] = tei;
    data["isCompleted"] = shouldTransformBooleanValues
        ? isCompleted
        : "$isCompleted" == "true"
            ? 1
            : 0;
    data["isViewed"] = shouldTransformBooleanValues
        ? isViewed
        : "$isViewed" == "true"
            ? 1
            : 0;
    return data;
  }

  @override
  String toString() {
    return "<id: $id tei: $tei nameSpaceKey: $nameSpaceKey fromImplementingPartner: $fromImplementingPartner isCompleted: $isCompleted isViewed: $isViewed>";
  }
}
