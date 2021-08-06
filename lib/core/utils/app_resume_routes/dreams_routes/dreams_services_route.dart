import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/anc/pages/agyw_dreams_anc_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/art_refill/pages/agyw_dreams_art_refill_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/condoms/pages/agyw_dreams_condoms_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/contraceptives/pages/agyw_dreams_contraceptives_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_short_form/pages/agyw_dreams_hts_short_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/msg_hiv/pages/agyw_dreams_msg_hiv_form.dart';

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
}
