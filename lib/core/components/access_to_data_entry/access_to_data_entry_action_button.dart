import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';

class AccessToDataEntryActionButton extends StatelessWidget {
  const AccessToDataEntryActionButton({
    Key? key,
    required this.activeInterventionProgram,
    required this.onLogout,
    required this.onCloseApp,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;
  final VoidCallback onLogout;
  final VoidCallback onCloseApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 40.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                right: 5.0,
              ),
              child: TextButton(
                onPressed: onLogout,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: activeInterventionProgram.primaryColor ??
                          Color(0xFFFAFAFA),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                child: Container(
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      color: activeInterventionProgram.primaryColor ??
                          Color(0xFFFAFAFA),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 5.0,
              ),
              child: TextButton(
                onPressed: onCloseApp,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: activeInterventionProgram.primaryColor ??
                          Color(0xFFFAFAFA),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                child: Container(
                  child: Text(
                    "Close App",
                    style: TextStyle(
                      color: activeInterventionProgram.primaryColor ??
                          Color(0xFFFAFAFA),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}