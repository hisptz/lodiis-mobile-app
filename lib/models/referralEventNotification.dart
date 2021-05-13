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
    bool isCompleted = json["isCompleted"] ?? false;
    return ReferralEventNotification(
      id: id,
      tei: tei,
      isCompleted: isCompleted,
    );
  }

  factory ReferralEventNotification.toJSon() {
    return null;
  }

  @override
  String toString() {
    return "<id :$id, tei : $tei, isCompleted:$isCompleted>";
  }
}
