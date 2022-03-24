import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollement_basic_info_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollement_none_participation_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_child_edit_view_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_child_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_consent_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_household_edit_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_household_form.dart';

class OvcEnrollmentRoute {
  redirectToOvcEnrollmentConsentForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OvcEnrollmentConsentForm();
        },
      ),
    );
  }

  redirectToOvcEnrollmentNoneParticipationForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToOvcEnrollmentConsentForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OvcEnrollmentNoneParticipationForm();
        },
      ),
    );
  }

  redirectToOvcEnrollmentBasicInfoForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToOvcEnrollmentConsentForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OvcEnrollmentBasicInfoForm();
        },
      ),
    );
  }

  redirectToOvcEnrollmentChildForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToOvcEnrollmentBasicInfoForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OvcEnrollmentChildForm();
        },
      ),
    );
  }

  redirectToOvcEnrollmentHouseholdForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToOvcEnrollmentChildForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OvcEnrollmentHouseholdForm();
        },
      ),
    );
  }

  redirectToOvcEnrollmentHouseholdEditForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OvcEnrollmentHouseholdEditForm();
        },
      ),
    );
  }

  redirectToOvcEnrollmentChildEditViewForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const OvcEnrollmentChildEditViewForm();
        },
      ),
    );
  }
}
