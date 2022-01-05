import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_enrollment_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_enrollment_edit_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_risk_assessment.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_enrollment_none_participation_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/non_agyw_dreams_hts_client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/non_agyw_dreams_hts_consent_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/non_agyw_dreams_hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/none_agyw_enrollment_edit_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/none_agyw_enrollment_prep_screening_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/sub_pages/none_agyw_prep/pages/none_agyw_prep_form.dart';

class DreamsEnrollmentRoute {
  redirectToNoneAgywHtsConsent(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NonAgywDreamsHTSConsentForm(),
      ),
    );
  }

  redirectToNoneAgywClientBio(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToNoneAgywHtsConsent(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NonAgywDreamsHTSClientInformation(),
      ),
    );
  }

  redirectToNoneAgywHtsRegister(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToNoneAgywClientBio(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NonAgywDreamsHTSRegisterForm(),
      ),
    );
  }

  redirectToNoneAgywPrepScreening(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToNoneAgywHtsRegister(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoneAgywEnrollmentPrepScreeningForm(),
      ),
    );
  }

  redirectToNoneAgywEnrollment(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoneAgywEnrollmentEditForm(),
      ),
    );
  }

  redirectToNoneAgywPrepVisit(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoneAgywPrepForm(),
      ),
    );
  }

  redirectToAgywConsentForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsConsentForm(),
      ),
    );
  }

  redirectToAgywRiskAssessment(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToAgywConsentForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsRiskAssessment(),
      ),
    );
  }

  redirectToAgywEnrollmentForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToAgywRiskAssessment(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsEnrollmentForm(),
      ),
    );
  }

  redirectToAgywNoneParticipationForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    redirectToAgywConsentForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywEnrollmentNoneParticipationForm(),
      ),
    );
  }

  redirectToAgywEnrollmentEditForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setEnrollmentFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsEnrollmentEditForm(),
      ),
    );
  }
}
