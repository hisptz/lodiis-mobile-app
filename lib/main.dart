import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app.dart';
import 'package:kb_mobile_app/core/services/local_notification_service.dart';

void main() {
  LocalNotificationService.init();
  runApp(
    const MyApp(),
  );
}
