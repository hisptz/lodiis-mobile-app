import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_home_card.dart';

class OvcEnrollmentPage extends StatelessWidget {
  const OvcEnrollmentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        body: SingleChildScrollView(
          
                  child: Column(
            children: [
              InterventionSelectionHomeCard(
                 widgetIndex: 2,
              ),
            ],
          
      ),
        ),
      );
    
    
  }
}
