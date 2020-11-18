import 'package:flutter/material.dart';

class OvcReferralTopBarSelection extends StatelessWidget {
  final VoidCallback onSelectCLOReferral;
  final VoidCallback onSelectReferral;
  final bool isClicked;


  OvcReferralTopBarSelection(
      {@required this.onSelectCLOReferral, @required this.onSelectReferral,this.isClicked = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(1.0),
        bottomRight: Radius.circular(1.0),
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
            child: Row(
          children: [
            Expanded(
              child: FlatButton(
                  color:!isClicked ? Color(0xFF4B9F46) :Colors.transparent ,
                  onPressed: onSelectReferral,
                  child: Text(
                    'Referral',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color:!isClicked ?Colors.white: Color(0xFF1A3518) ,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Container(
              height: 20.0,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.green[100], width: 2.0),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
               color: isClicked ?Color(0xFF4B9F46) :Colors.transparent,
                  onPressed: onSelectCLOReferral,
                  child: Text(
                    'CLO Referral',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: isClicked ?Colors.white: Color(0xFF1A3518),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
