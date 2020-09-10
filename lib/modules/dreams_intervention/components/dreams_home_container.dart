import 'package:flutter/material.dart';

class DreamsHomeContainer extends StatelessWidget {
  final String header;
  final Widget bodyContents;

  const DreamsHomeContainer({Key key, this.header, @required this.bodyContents})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header != null && header != ''
            ? AppBar(
                title: Text(
                  header,
                  style: TextStyle().copyWith(
                      color: Color(0xFF82898D),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Color(0xFFFFFFFF),
                elevation: 1,
              )
            : null,
        body: SingleChildScrollView(child: bodyContents));
  }
}
