import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/pages/ogac_enrollment_form.dart';
import 'package:provider/provider.dart';

class OgacEnrollmentRoute {
  redirectToOgacEnrollmemntForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OgacEnrollemntForm();
        },
      ),
    );
  }

  void setEnrollmentFormState(BuildContext context, FormAutoSave formAutoSave) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Map<String, dynamic> dataObject = jsonDecode(formAutoSave.data);
    for (String id in dataObject.keys) {
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState(id, dataObject[id]);
    }
  }
}
