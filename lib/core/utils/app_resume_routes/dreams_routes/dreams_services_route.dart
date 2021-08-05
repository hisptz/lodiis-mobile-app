import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/anc/pages/agyw_dreams_anc_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/art_refill/pages/agyw_dreams_art_refill_form.dart';

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
}
