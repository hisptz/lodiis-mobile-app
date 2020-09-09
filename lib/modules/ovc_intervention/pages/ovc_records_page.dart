import 'package:flutter/material.dart';

class OvcRecordsPage extends StatelessWidget {
  const OvcRecordsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width:23,
            ),
            Text("HOUSE HOLD LIST",style: TextStyle(color: Colors.black45,fontSize:14,fontWeight: FontWeight.bold ),),
          ],
        )
        ),
        body: Container(
          child: Text("Ovc Records page"),
        ),
      );
    
    
  }
}
