import 'package:flutter/material.dart';

class LoginFormFieldSeperator extends StatelessWidget {
  const LoginFormFieldSeperator({Key key, this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 2, color: color),
      )),
    );
  }
}
