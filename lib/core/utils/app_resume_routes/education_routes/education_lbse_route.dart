import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/pages/education_lbse_enrollment_form_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/pages/education_lbse_learning_outcome_form_page.dart';

class EducationLbseRoute {
  redirectToLbseEnrollmentForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EducationLbseEnrollmentFormPage();
        },
      ),
    );
  }

  redirectToLbseLearningOutcomeForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    Map<String, dynamic> dataObject = jsonDecode(formAutoSave.data!);
    String eventId = dataObject['eventId'] ?? '';
    bool isNewLearningOutcomeForm = eventId == '';
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EducationLbseLearningOutcomeFormPage(
            isNewLearningOutcomeForm: isNewLearningOutcomeForm,
          );
        },
      ),
    );
  }
}
