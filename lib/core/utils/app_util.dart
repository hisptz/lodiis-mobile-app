import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class AppUtil {
  static bool hasAllMandarotyFieldsFilled(
      List mandatoryFields, Map dataObject) {
    bool hasFilled = true;
    List fieldIds = dataObject.keys.toList();
    for (var mandatoryField in mandatoryFields) {
      if (fieldIds.indexOf(mandatoryField) == -1 &&
          '${dataObject[mandatoryField]}'.trim() != '') {
        hasFilled = false;
      }
    }
    return hasFilled;
  }

  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.light));
  }

  static String getUid() {
    return Uuid().v1().replaceAll('-', '').substring(0, 10);
  }

  static String formattedDateTimeIntoString(DateTime date) {
    return date.toIso8601String().split('T')[0];
  }

  static DateTime getDateIntoDateTimeFormat(String date) {
    return DateTime.parse(date);
  }

  static Future<Position> getCurrentLocation() async {
    return await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  static int getAgeInYear(String dateOfBirth) {
    DateTime currentDate = DateTime.now();
    DateTime birthDate = getDateIntoDateTimeFormat(dateOfBirth);
    int age = currentDate.year - birthDate.year;
    if (birthDate.month > currentDate.month) {
      age--;
    } else if (birthDate.month == currentDate.month) {
      if (birthDate.day > currentDate.day){
        age--;
      }
    }
    return age;
  }

  static showToastMessage(
      {String message, ToastGravity position = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: position,
        backgroundColor: Color(0xFF656565));
  }

  static showPopUpModal(
      BuildContext context, Widget modal, bool diablePadding) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            child: Container(
              child: Padding(
                padding: diablePadding
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(
                        bottom: 12, top: 5, right: 5, left: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
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
