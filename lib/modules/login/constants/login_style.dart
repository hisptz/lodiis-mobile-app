import 'package:flutter/material.dart';

class LoginPageStyles {
  static TextStyle formLableStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: const Color(0xFF4B9F46),
  );

  static TextStyle formInputValueStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF1A3518),
  );

  static BoxConstraints loginBoxConstraints =
      BoxConstraints(maxHeight: 45, minHeight: 42, maxWidth: 45, minWidth: 42);
}
