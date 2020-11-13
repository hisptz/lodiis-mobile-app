import 'package:flutter/material.dart';

class CircularProcessLoader extends StatelessWidget {
  CircularProcessLoader({Key key, this.color, this.size}) : super(key: key);
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: size ?? 4,
                valueColor: new AlwaysStoppedAnimation(color ?? Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
