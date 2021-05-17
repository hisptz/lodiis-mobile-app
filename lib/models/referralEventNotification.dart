import 'package:flutter/material.dart';

class ReferralEventNotification {
  String id;
  String tei;
  String nameSpaceKey;
  bool isCompleted;

  ReferralEventNotification({
    @required this.id,
    @required this.tei,
    @required this.nameSpaceKey,
    this.isCompleted,
  }) {
    this.isCompleted = this.isCompleted ?? false;
  }

  factory ReferralEventNotification.fromJson(Map json) {
    String id = json["id"] ?? "";
    String tei = json["tei"] ?? "";
    String nameSpaceKey = json["nameSpaceKey"] ?? "";
    dynamic isCompleted = json["isCompleted"];
    return ReferralEventNotification(
      id: id,
      tei: tei,
      nameSpaceKey: nameSpaceKey,
      isCompleted: "$isCompleted" == "1" || "$isCompleted" == "true",
    );
  }

  Map toOffline({
    bool shoulTransaformCompleteStatus = false,
  }) {
    Map data = Map<String, dynamic>();
    data["id"] = id;
    data["nameSpaceKey"] = nameSpaceKey;
    data["tei"] = tei;
    data["isCompleted"] = shoulTransaformCompleteStatus
        ? isCompleted
        : "$isCompleted" == "true"
            ? 1
            : 0;
    return data;
  }

  @override
  String toString() {
    return "<id :$id, tei : $tei, nameSpaceKey : $nameSpaceKey, isCompleted: $isCompleted>";
  }
}
