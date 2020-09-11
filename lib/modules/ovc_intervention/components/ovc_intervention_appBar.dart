import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OvcInterventionAppBar extends StatelessWidget {
  OvcInterventionAppBar({@required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            SizedBox(
              width: 23,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        );
  }
}
