import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AppUtil {
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.light));
  }

  static String getUid() {
    return Uuid().v1().replaceAll('-', '').substring(0, 10);
  }

  static Future showPopUpModal(BuildContext context, Widget modal) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: modal,
              ),
            ),
          );
        });
  }
}
