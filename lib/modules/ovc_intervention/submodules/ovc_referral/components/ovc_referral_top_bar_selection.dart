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
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.only(
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 17),
        child: Container(
          decoration: BoxDecoration(color: Colors.black12),
           child: Row(
          children: [
            Expanded(
              child: FlatButton( 
                  height: 45.8,               
                  color:!isClicked ? Color(0xFF4B9F46) :Colors.transparent ,
                  onPressed: onSelectReferral,
                  child: Text(
                    'Referral',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: !isClicked ? Colors.white: Color(0xFF1A3518) ,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),            
            Expanded(
              child: FlatButton(
                height: 45.8,
               color: isClicked ?Color(0xFF4B9F46) :Colors.transparent,
                  onPressed: onSelectCLOReferral,
                  child: Text(
                    'CLO Referral',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: isClicked ? Colors.white: Color(0xFF1A3518),
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
