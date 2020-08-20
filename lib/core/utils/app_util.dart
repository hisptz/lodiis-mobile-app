import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppUtil {
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.light));
  }
}
