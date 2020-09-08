import 'package:flutter/material.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_home_card.dart';

class OvcReferralPage extends StatelessWidget {
  const OvcReferralPage({Key key}) : super(key: key);

  Widget referral() {
    return GestureDetector(
      onTap: () {

      },
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20.25,
          ),
          SizedBox(
            width: 13.65,
          ),
          Text("REFERRAL",
              style: TextStyle(
                color: Color(0xFF4B9F46)
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(75, 159, 70, 0.05),
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(
                width: 23,
              ),
              Text(
                "HOUSE HOLD LIST",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
      body:  SingleChildScrollView(
              child: Column(
            children: [
              InterventionSelectionHomeCard(
                 widgetIndex: 0,
              ),
            ],
          
        ),
      ),
    );
  }
}
