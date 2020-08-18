import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 34, right: 34),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(32))),
      width: size.width * 0.8,
      height: size.height * 0.6,
      child: Text('Login form'),
    );
  }
}
