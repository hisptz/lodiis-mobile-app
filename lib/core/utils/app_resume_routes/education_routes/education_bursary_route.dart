import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_assessment_form_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_attendance_form_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_enrollment_form_edit_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_enrollment_form_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_school_performance_form_page.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_without_enrollment_criteria_form_page.dart';

class EducationBursaryRoute {
  //TODO add routes to referral forms
  redirectToBursaryAssessment(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationBursaryAssessmentFormPage(),
      ),
    );
  }

  redirectToBursaryEnrollment(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToBursaryAssessment(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationBursaryEnrollmentFormPage(),
      ),
    );
  }

  redirectToBursaryWithoutVulnerabilityCriteria(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToBursaryAssessment(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const EducationBursaryWithoutVulnerabilityCriteriaFormPage(),
      ),
    );
  }

  redirectToBursaryEnrollmentEdit(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationBursaryEnrollmentEditFormPage(),
      ),
    );
  }

  redirectToBursaryClubsAttendance(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Map<String, dynamic> dataObject = jsonDecode(formAutoSave.data!);
    String eventId = dataObject['eventId'] ?? '';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EducationBursaryAttendanceFormPage(
          isNewClubAttendance: eventId.isEmpty,
        ),
      ),
    );
  }

  redirectToBursaryClubsAttendanceReferral(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationBursaryAttendanceFormPage(),
      ),
    );
  }

  redirectToBursarySchoolAttendance(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationBursaryAttendanceFormPage(
          isSchoolAttendance: true,
        ),
      ),
    );
  }

  redirectToBursarySchoolPerformance(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EducationBursarySchoolPerformanceFormPage(),
      ),
    );
  }
}
