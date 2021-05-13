import 'package:flutter/material.dart';

class ReferralEventNotification {
  String id;
  String tei;
  bool isCompleted;

  ReferralEventNotification({
    @required this.id,
    @required this.tei,
    this.isCompleted,
  }) {
    this.isCompleted = this.isCompleted ?? false;
  }

  factory ReferralEventNotification.fromJson(Map json) {
    String id = json["id"] ?? "";
    String tei = json["tei"] ?? "";
    dynamic isCompleted = json["isCompleted"];
    return ReferralEventNotification(
      id: id,
      tei: tei,
      isCompleted: "$isCompleted" == "1" || "$isCompleted" == "true",
    );
  }

  Map toJson() {
    Map data = toOffline();
    var isCompleted = data["isCompleted"];
    data["isCompleted"] = "$isCompleted" == "1";
    return data;
  }

  Map toOffline() {
    Map data = Map<String, dynamic>();
    data["id"] = id;
    data["tei"] = tei;
    data["isCompleted"] = "$isCompleted" == "true" ? 1 : 0;
    return data;
  }

  @override
  String toString() {
    return "<id :$id, tei : $tei, isCompleted:$isCompleted>";
  }
}
