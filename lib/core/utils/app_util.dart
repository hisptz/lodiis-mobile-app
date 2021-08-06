import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class AppUtil {
  static bool hasAllMandarotyFieldsFilled(List mandatoryFields, Map datadynamic,
      {Map hiddenFields = const {}}) {
    bool hasFilled = true;
    List fieldIds = datadynamic.keys.toList();
    List hiddenFieldsIds = hiddenFields.keys.toList();
    //Remove all hidden fields which are mandatory from the list
    List filteredMandatoryFields = mandatoryFields
        .where((field) => hiddenFieldsIds.indexOf(field) < 0)
        .toList();
    for (var mandatoryField in filteredMandatoryFields) {
      if (fieldIds.indexOf(mandatoryField) == -1) {
        hasFilled = false;
      } else {
        if ('${datadynamic[mandatoryField]}'.trim() == '' ||
            '${datadynamic[mandatoryField]}'.trim() == 'null') {
          hasFilled = false;
        }
      }
    }
    return hasFilled;
  }

  static List getUnFilledMandatoryFields(List mandatoryFields, Map datadynamic,
      {Map hiddenFields = const {}}) {
    List unFilledMandatoryFields = [];
    List fieldIds = datadynamic.keys.toList();
    List hiddenFieldsIds = hiddenFields.keys.toList();
    //Remove all hidden fields which are mandatory from the list
    List filteredMandatoryFields = mandatoryFields
        .where((field) => hiddenFieldsIds.indexOf(field) < 0)
        .toList();
    for (var mandatoryField in filteredMandatoryFields) {
      if (fieldIds.indexOf(mandatoryField) == -1) {
        unFilledMandatoryFields.add(mandatoryField);
      } else {
        if ('${datadynamic[mandatoryField]}'.trim() == '' ||
            '${datadynamic[mandatoryField]}'.trim() == 'null') {
          unFilledMandatoryFields.add(mandatoryField);
        }
      }
    }
    return unFilledMandatoryFields;
  }

  static bool getAtleastOneFormFieldsFilledStatus(
    List fields,
    Map datadynamic,
  ) {
    List unFilledFields = [];
    List fieldIds = datadynamic.keys.toList();
    for (var field in fields) {
      if (fieldIds.indexOf(field) == -1) {
        unFilledFields.add(field);
      } else {
        if ('${datadynamic[field]}'.trim() == '' ||
            '${datadynamic[field]}'.trim() == 'null') {
          unFilledFields.add(field);
        }
      }
    }
    return unFilledFields.length < fields.length;
  }

  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  static String getUid() {
    Random rnd = new Random();
    const letters = 'abcdefghijklmnopqrstuvwxyz' + 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const allowedChars = '0123456789' + letters;
    const NUMBER_OF_CODEPOINTS = allowedChars.length;
    const CODESIZE = 11;
    String uid;
    int charIndex = (rnd.nextInt(10) / 10 * letters.length).round();
    uid = letters.substring(charIndex, charIndex + 1);
    for (int i = 1; i < CODESIZE; ++i) {
      charIndex = (rnd.nextInt(10) / 10 * NUMBER_OF_CODEPOINTS).round();
      uid += allowedChars.substring(charIndex, charIndex + 1);
    }
    return uid;
  }

  static String formattedDateTimeIntoString(DateTime date) {
    return date.toIso8601String().split('T')[0].trim();
  }

  static DateTime getDateIntoDateTimeFormat(String date) {
    return DateTime.parse(date);
  }

  static Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position;
  }

  static int getAgeInYear(String dateOfBirth) {
    int age = 0;
    try {
      DateTime currentDate = DateTime.now();
      DateTime birthDate = dateOfBirth != null && dateOfBirth != ''
          ? getDateIntoDateTimeFormat(dateOfBirth)
          : getDateIntoDateTimeFormat(formattedDateTimeIntoString(currentDate));
      age = currentDate.year - birthDate.year;
      if (birthDate.month > currentDate.month) {
        age--;
      } else if (birthDate.month == currentDate.month) {
        if (birthDate.day > currentDate.day) {
          age--;
        }
      }
    } catch (e) {}
    return age;
  }

  static List<List<dynamic>> chunkItems(
      {List<dynamic> items = const [], int size = 0}) {
    List<List<dynamic>> groupedItems = [];
    size = size != 0 ? size : items.length;
    for (var count = 1; count <= (items.length / size).ceil(); count++) {
      int start = (count - 1) * size;
      int end = (count * size);
      List<dynamic> subList =
          items.sublist(start, end > items.length ? items.length : end);
      groupedItems.add(subList);
    }
    return groupedItems;
  }

//@TODO checking this function
  bool searchFromString({String searchableString, String searchedValue}) {
    List<String> searchedSubString = searchedValue.split(' ');
    for (String str in searchedSubString) {
      if (searchableString.toLowerCase().indexOf(str.toLowerCase()) == -1) {
        return false;
      }
    }
    return true;
  }

  static showToastMessage({
    String message,
    ToastGravity position = ToastGravity.BOTTOM,
  }) {
    if (message.isNotEmpty)
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: position,
        backgroundColor: Color(0xFF656565),
      );
  }

  static showPopUpModal(
    BuildContext context,
    Widget modal,
    bool diablePadding, {
    String title = '',
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Container(
            child: Padding(
              padding: diablePadding
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.only(
                      bottom: 12,
                      top: 5,
                      right: 5,
                      left: 5,
                    ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: title == ''
                                ? Container()
                                : Container(
                                    alignment: Alignment.center,
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: TextStyle().copyWith(
                                            color: Color(0xFF82898D),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
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
                                        'assets/icons/close_icon.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
      },
    );
  }
}
