import 'package:flutter/material.dart';

class AppUpdateWarningMessage extends StatelessWidget {
  const AppUpdateWarningMessage(
      {Key? key, required this.color, required this.message})
      : super(key: key);

  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Text(
        message,
        style: TextStyle().copyWith(
          fontSize: 18.0,
          color: color,
        ),
      ),
    );
  }
}
