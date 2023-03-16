import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_gender_norms/pp_prev_intervention_gender_norms_form.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_intervention_enrollment_form.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_referral/pp_prev_intervention_referral_form.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_referral/pp_prev_intervention_referral_outcome_form.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/pages/pp_prev_services/pp_prev_intervention_service_provision_form.dart';

class PpPrevRoute {
  redirectToPpPrevEnrollmentForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PpPrevInterventionEnrollmentForm();
        },
      ),
    );
  }

  redirectToPpPrevServiceForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PpPrevInterventionServiceProvisionForm();
        },
      ),
    );
  }

  redirectToPpPrevGenderNormsForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PpPrevInterventionGenderNormsForm();
        },
      ),
    );
  }

  redirectToPpPrevReferralForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PpPrevInterventionReferralForm();
        },
      ),
    );
  }
}
