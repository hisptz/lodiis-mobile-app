import 'package:flutter/material.dart';

class OvcReferralTopBarSelection extends StatelessWidget {
  final VoidCallback onSelectCLOReferral;
  final VoidCallback onSelectReferral;
  final bool isClicked;

  OvcReferralTopBarSelection(
      {@required this.onSelectCLOReferral,
      @required this.onSelectReferral,
      this.isClicked = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.only(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.black12),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        !isClicked ? Color(0xFF4B9F46) : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: onSelectReferral,
                  child: Text(
                    'Referral',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: !isClicked ? Colors.white : Color(0xFF1A3518),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isClicked ? Color(0xFF4B9F46) : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: onSelectCLOReferral,
                  child: Text(
                    'CLO Referral',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      color: isClicked ? Colors.white : Color(0xFF1A3518),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
