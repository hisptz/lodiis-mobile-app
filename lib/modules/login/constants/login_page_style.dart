import 'package:flutter/material.dart';

class LoginPageStyles {
  static TextStyle formLabelStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xFF4B9F46),
  );

  static TextStyle formInputValueStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1A3518),
  );

  static BoxConstraints loginBoxConstraints = const BoxConstraints(
      maxHeight: 45, minHeight: 42, maxWidth: 45, minWidth: 42);
}
