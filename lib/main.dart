import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:kb_mobile_app/app.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}
