import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/pages/ogac_enrollment_form.dart';

class OgacEnrollmentRoute {
  redirectToOgacEnrollmentForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OgacEnrollmentForm();
        },
      ),
    );
  }
}
