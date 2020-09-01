import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';

class AppUtil {
  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.light));
  }

  static String getUid() {
    return Uuid().v1().replaceAll('-', '').substring(0, 10);
  }

  static showPopUpModal(BuildContext context, Widget modal) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 12, top: 5, right: 5, left: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 22,
                              width: 22,
                              child: SvgPicture.asset(
                                  'assets/icons/close_icon.svg'),
                            ),
                          )
                        ],
                      ),
                      modal
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
