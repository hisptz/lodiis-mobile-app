import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/pages/dream_agyw_referral_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/anc/pages/agyw_dreams_anc_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/art_refill/pages/agyw_dreams_art_refill_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/condoms/pages/agyw_dreams_condoms_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/contraceptives/pages/agyw_dreams_contraceptives_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_consent_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_short_form/pages/agyw_dreams_hts_short_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/msg_hiv/pages/agyw_dreams_msg_hiv_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/pep/pages/agyw_dreams_pep_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/post_gbv/pages/agyw_dreams_post_gbv_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/agyw_dreams_prep.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/pages/agyw_dreams_prep_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/pages/agyw_prep_visit_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep_short_form/pages/agyw_dreams_prep_short_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/pages/agyw_dreams_service_form.dart';

class DreamsServicesRoute {
  //@TODO redirect for None agyw beneficiaries

  //@TODO redirect for agyw/dreams beneficiaries
  redirectToAgywDreamsANCForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsANCForm(),
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
        builder: (context) => AgywDreamsARTRefillForm(),
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
        builder: (context) => AgywDreamsCondomsForm(),
      ),
    );
  }

  redirectToAgywDreamsContraceptivesForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsContraceptivesForm(),
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
        builder: (context) => AgywDreamsHTSShortForm(),
      ),
    );
  }

  redirectToAgywDreamsMSGHIVForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsMSGHIVForm(),
      ),
    );
  }

  redirectToAgywDreamsPEPForm(BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsPEPForm(),
      ),
    );
  }

  redirectToAgywDreamsPostGBVForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsPostGBVForm(),
      ),
    );
  }

  redirectToAgywDreamsServiceForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsServiceForm(),
      ),
    );
  }

  redirectToAgywDreamsPrEPShortForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsPrepShortForm(),
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
        builder: (context) => AgywDreamsPrep(),
      ),
    );
  }

  redirectToAgywDreamsPrEPHTSClientInformationForm(
      BuildContext context, FormAutoSave formAutoSave) {
    redirectToAgywDreamsPrEPHTSConcentForm(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsHTSClientInformation(
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
        builder: (context) => AgywDreamsHTSRegisterForm(
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
        builder: (context) => AgywDreamsPrepFormPage(),
      ),
    );
  }

  redirectToAgywDreamsPrEPVisitForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywPrepVisitForm(),
      ),
    );
  }
}
