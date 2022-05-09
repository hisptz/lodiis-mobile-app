import 'package:flutter/material.dart';

class AppUpdateActionButtons extends StatelessWidget {
  const AppUpdateActionButtons(
      {Key? key, required this.onUpdateApp, required this.onCloseApp})
      : super(key: key);
  final VoidCallback onCloseApp;
  final VoidCallback onUpdateApp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.only(
              right: 5.0,
            ),
            child: TextButton(
              onPressed: onUpdateApp,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFFFAFAFA),
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: const Text(
                  "Update App",
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 5.0,
            ),
            child: TextButton(
              onPressed: onCloseApp,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFFFAFAFA),
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                child: const Text(
                  "Close App",
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
