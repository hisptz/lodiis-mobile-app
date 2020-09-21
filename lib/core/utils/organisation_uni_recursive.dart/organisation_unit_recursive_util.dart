import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrganisationUtil {
  static showPopUpModal(BuildContext context, Widget model) {
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
                    children: [model],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
