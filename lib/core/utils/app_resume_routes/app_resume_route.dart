import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_services_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ogac_routes/ogac_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_services_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/constants/ogac_routes_constant.dart';

class AppResumeRoute
    with
        DreamsEnrollmentRoute,
        DreamsServicesRoute,
        OgacEnrollmentRoute,
        OvcEnrollmentRoute,
        OvcServicesRoute {
  void redirectToPages(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    //@TODO add routes for agyw/dreams beneficiciaries
    if (formAutoSave.nextPageModule == OgacRoutesConstant.nextPageModule) {
      redirectToOgacEnrollmemntForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.noneAgywHtsConsentPage) {
      redirectToNoneAgywHtsConsent(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.noneAgywHtsConsentNextPage) {
      redirectToNoneAgywClientBio(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.noneAgywHtsClientInfoNextPage) {
      redirectToNoneAgywHtsRegister(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.noneAgywHtsRegisterNextPage) {
      redirectToNoneAgywPrepScreening(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.noneAgywPrepFormNextPage) {
      redirectToNoneAgywPrepVisit(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.noneAgywEnrollmentNextPage) {
      redirectToOgacEnrollmemntForm(context, formAutoSave);
    } else {
      print("$formAutoSave \n");
      print("Not page to redirect ${formAutoSave.nextPageModule}\n\n");
    }
  }

  Future<bool> shouldResumeWithUnSavedChanges(
    BuildContext context,
    FormAutoSave formAutoSave, {
    String beneficiaryName = "",
  }) async {
    bool diablePadding = false;
    bool shouldResumeFormState = false;
    if (formAutoSave.hasFormAutoSaveData()) {
      String pageModule = formAutoSave.nextPageModule;
      Widget modal =
          AppResumeRouteUtil.getConfirmationWidget(context, pageModule);
      String title = beneficiaryName;
      dynamic hasConfirmResume = await AppUtil.showPopUpModal(
        context,
        modal,
        diablePadding,
        title: title,
      );
      shouldResumeFormState = "$hasConfirmResume" == "true";
      if ("$hasConfirmResume" == "true" || "$hasConfirmResume" == "false") {
        if (!shouldResumeFormState) {
          FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSave.id);
        }
      }
    }

    return shouldResumeFormState;
  }
}
