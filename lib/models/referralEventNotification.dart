import 'package:flutter/material.dart';

class ReferralEventNotification {
  String id;
  String tei;
  String nameSpaceKey;
  bool isCompleted;
  bool isViewed;

  ReferralEventNotification({
    @required this.id,
    @required this.tei,
    @required this.nameSpaceKey,
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
    dynamic isCompleted = json["isCompleted"];
    dynamic isViewed = json["isViewed"];
    return ReferralEventNotification(
      id: id,
      tei: tei,
      nameSpaceKey: nameSpaceKey,
      isCompleted: "$isCompleted" == "1" || "$isCompleted" == "true",
      isViewed: "$isViewed" == "1" || "$isViewed" == "true",
    );
  }

  Map toOffline({
    bool shoulTransaformBoolenValues = false,
  }) {
    Map data = Map();
    data["id"] = id;
    data["nameSpaceKey"] = nameSpaceKey;
    data["tei"] = tei;
    data["isCompleted"] = shoulTransaformBoolenValues
        ? isCompleted
        : "$isCompleted" == "true"
            ? 1
            : 0;
    data["isViewed"] = shoulTransaformBoolenValues
        ? isViewed
        : "$isViewed" == "true"
            ? 1
            : 0;
    return data;
  }

  @override
  String toString() {
    return "<id: $id, tei: $tei, nameSpaceKey: $nameSpaceKey, isCompleted: $isCompleted isViewed: $isViewed>";
  }
}
