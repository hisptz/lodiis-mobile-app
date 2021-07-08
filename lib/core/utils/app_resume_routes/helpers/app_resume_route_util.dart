import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:provider/provider.dart';

class AppResumeRouteUtil {
  static void setEnrollmentFormState(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Map<String, dynamic> dataObject = jsonDecode(formAutoSave.data);
    for (String id in dataObject.keys) {
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState(id, dataObject[id]);
    }
  }

  static Widget getConfirmationWidget(BuildContext context, String pageModule) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "You have unsaved data on $pageModule module, Do want to continue?",
              style: TextStyle().copyWith(
                color: Color(0xFF82898D),
                fontSize: 14.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 5.0,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFF7FBA7C),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                      child: Container(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Color(0xFF7FBA7C),
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
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.redAccent,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                      child: Container(
                        child: Text(
                          "Discard changes",
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
