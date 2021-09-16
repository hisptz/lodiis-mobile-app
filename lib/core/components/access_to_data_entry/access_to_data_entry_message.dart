import 'package:flutter/material.dart';

class AccessToDataEntryMessage extends StatelessWidget {
  const AccessToDataEntryMessage({
    Key? key,
    required this.message,
    required this.color,
  }) : super(key: key);

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
          fontSize: 22.0,
          color: color,
        ),
      ),
    );
  }
}
