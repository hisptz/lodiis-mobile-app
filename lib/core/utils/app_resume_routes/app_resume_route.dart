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
    //@TODO add routes for agyw/dreams beneficiaries
    if (formAutoSave.nextPageModule == OgacRoutesConstant.nextPageModule) {
      redirectToOgacEnrollmentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.noneAgywHtsConsentNextPage) {
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
      redirectToNoneAgywEnrollment(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywConsentPage) {
      redirectToAgywConsentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywConsentNextPage) {
      redirectToAgywRiskAssessment(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywRiskAssessmentNextPage) {
      redirectToAgywEnrollmentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywNoneParticipationNextPage) {
      redirectToAgywNoneParticipationForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywEnrollmentFormEditNextPage) {
      redirectToAgywEnrollmentEditForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsANCFormNextPage) {
      redirectToAgywDreamsANCForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsArtRefillNextPage) {
      redirectToAgywDreamsArtRefillForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsCondomsFormNextPage) {
      redirectToAgywDreamsCondomsForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsContraceptivesNextPage) {
      redirectToAgywDreamsContraceptivesForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsHTSShortFormNextPage) {
      redirectToAgywDreamsHTSShortForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsMSGHIVFormNextPage) {
      redirectToAgywDreamsMSGHIVForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPEPFormNextPage) {
      redirectToAgywDreamsPEPForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPrEPShortFormNextPage) {
      redirectToAgywDreamsPrEPShortForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsServiceFormNextPage) {
      redirectToAgywDreamsServiceForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPostGBVFormNextPage) {
      redirectToAgywDreamsPostGBVForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsReferralNextPage) {
      redirectToAgywDreamsReferralForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPrEPHTSConsentPage) {
      redirectToAgywDreamsPrEPHTSConcentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPrEPHTSConsentNextPage) {
      redirectToAgywDreamsPrEPHTSClientInformationForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPrEPHTSClientInformationNextPage) {
      redirectToAgywDreamsPrEPHTSRegisterForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPrEPHTSRegisterNextPage) {
      print('Hello');
      redirectToAgywDreamsPrEPLongForm(context, formAutoSave);
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
    bool disablePadding = false;
    bool shouldResumeFormState = false;
    if (formAutoSave.hasFormAutoSaveData()) {
      String pageModule = formAutoSave.nextPageModule;
      Widget modal =
          AppResumeRouteUtil.getConfirmationWidget(context, pageModule);
      String title = beneficiaryName;
      dynamic hasConfirmResume = await AppUtil.showPopUpModal(
        context,
        modal,
        disablePadding,
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
