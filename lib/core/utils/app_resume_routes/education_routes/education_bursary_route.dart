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
  redirectToBursaryAssessment(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EducationBursaryAssessmentFormPage(),
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
        builder: (context) => EducationBursaryEnrollmentFormPage(),
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
            EducationBursaryWithoutVulnerabilityCriteriaFormPage(),
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
        builder: (context) => EducationBursaryEnrollmentEditFormPage(),
      ),
    );
  }

  redirectToBursaryClubsAttendance(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EducationBursaryAttendanceFormPage(),
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
        builder: (context) => EducationBursaryAttendanceFormPage(
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
        builder: (context) => EducationBursarySchoolPerformanceFormPage(),
      ),
    );
  }
}
