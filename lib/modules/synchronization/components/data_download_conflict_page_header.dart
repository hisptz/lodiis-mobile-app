import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';

class DataDownloadConflictPageHeader extends StatelessWidget {
  const DataDownloadConflictPageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            LineSeperator(
              color: Colors.grey,
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Label"),
                Text("Offline Value"),
                Text("Online Value"),
                Text("Action")
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            LineSeperator(
              color: Colors.grey,
              height: 1,
            )
          ],
        ));
  }
}
