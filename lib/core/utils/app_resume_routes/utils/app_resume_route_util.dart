import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:provider/provider.dart';

class AppResumeRouteUtil {
  static void setEnrollmentFormState(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Map<String, dynamic> dataObject = jsonDecode(formAutoSave.data!);
    for (String id in dataObject.keys) {
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState(id, dataObject[id]);
    }
  }

  static void setServiceFormState(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    Map<String, dynamic> dataObject = jsonDecode(formAutoSave.data!);
    for (String id in dataObject.keys) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState(id, dataObject[id]);
    }
  }

  static Widget getConfirmationWidget(
      BuildContext context, String? pageModule) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "You have unsaved data on $pageModule module, Do want to continue?",
              style: const TextStyle().copyWith(
                color: const Color(0xFF82898D),
                fontSize: 14.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 5.0,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xFF7FBA7C),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          color: Color(0xFF7FBA7C),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.redAccent,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        "Discard changes",
                        style: TextStyle(
                          color: Colors.redAccent,
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
