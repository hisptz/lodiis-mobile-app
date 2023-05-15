import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_agyw_referral_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/anc/pages/agyw_dreams_anc_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/art_refill/pages/agyw_dreams_art_refill_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/condoms/pages/agyw_dreams_condoms_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/family_planning_srh/pages/agyw_dreams_family_planning_srh_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hiv_prevention_education/pages/hiv_prevention_education_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_short_form/pages/agyw_dreams_hts_short_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hiv_message/pages/agyw_dreams_hiv_message_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/pep/pages/agyw_dreams_pep_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/post_gbv/pages/agyw_dreams_post_gbv_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/agyw_dreams_prep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/pages/agyw_dreams_prep_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/pages/agyw_prep_visit_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep_short_form/pages/agyw_dreams_prep_short_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/pages/agyw_dreams_service_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/violence_prevention_education/pages/violence_prevention_education_form.dart';

class DreamsServicesRoute {
  redirectToAgywDreamsANCForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsANCForm(),
      ),
    );
  }

  redirectToAgywDreamsArtRefillForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsARTRefillForm(),
      ),
    );
  }

  redirectToAgywDreamsViolencePreventionEducation(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ViolencePreventionEducationForm(),
      ),
    );
  }

  redirectToAgywDreamsCondomsForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsCondomsForm(),
      ),
    );
  }

  redirectToAgywDreamsFamilyPlanningSrhForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsFamilyPlanningSrhForm(),
      ),
    );
  }

  redirectToAgywDreamsHTSShortForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsHTSShortForm(),
      ),
    );
  }

  redirectToAgywDreamsMSGHIVForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamHIVMessageForm(),
      ),
    );
  }

  redirectToAgywDreamsPEPForm(BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsPEPForm(),
      ),
    );
  }

  redirectToAgywDreamsPostGBVForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsPostGBVForm(),
      ),
    );
  }

  redirectToAgywDreamsServiceForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsServiceForm(),
      ),
    );
  }

  redirectToAgywDreamsPrEPShortForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsPrepShortForm(),
      ),
    );
  }

  redirectToAgywDreamsReferralForm(
      BuildContext context, FormAutoSave formAutoSave) async {
    CurrentUser? currentUser = await UserService().getCurrentUser();
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DreamsAgywAddReferralForm(
          currentUser: currentUser,
        ),
      ),
    );
  }

  redirectToAgywDreamsPrEPHTSConcentForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsPrep(),
      ),
    );
  }

  redirectToAgywDreamsPrEPHTSClientInformationForm(
      BuildContext context, FormAutoSave formAutoSave) {
    redirectToAgywDreamsPrEPHTSConcentForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsHTSClientInformation(
          isComingFromPrep: true,
        ),
      ),
    );
  }

  redirectToAgywDreamsPrEPHTSRegisterForm(
      BuildContext context, FormAutoSave formAutoSave) {
    redirectToAgywDreamsPrEPHTSClientInformationForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsHTSRegisterForm(
          isComingFromPrep: true,
        ),
      ),
    );
  }

  redirectToAgywDreamsPrEPLongForm(
      BuildContext context, FormAutoSave formAutoSave) {
    redirectToAgywDreamsPrEPHTSRegisterForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsPrepFormPage(),
      ),
    );
  }

  redirectToAgywDreamsPrEPVisitForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywPrepVisitForm(),
      ),
    );
  }

  redirectToAgywDreamsHIVPreventionEducationForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HIVPreventionEducationForm(),
      ),
    );
  }
}
