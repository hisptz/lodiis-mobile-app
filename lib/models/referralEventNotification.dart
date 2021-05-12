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
}
