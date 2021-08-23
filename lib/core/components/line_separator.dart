import 'package:flutter/material.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({Key? key, required this.color, this.height = 2.0})
      : super(key: key);
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: height, color: color),
      )),
    );
  }
}
