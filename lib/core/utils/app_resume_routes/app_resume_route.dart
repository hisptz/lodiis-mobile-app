import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_services_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/education_routes/education_bursary_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/education_routes/education_lbse_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/pp_prev_routes/pp_prev_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ogac_routes/ogac_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_services_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_routes_constant.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/constants/ogac_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_routes_constant.dart';

class AppResumeRoute
    with
        DreamsEnrollmentRoute,
        DreamsServicesRoute,
        OgacEnrollmentRoute,
        OvcEnrollmentRoute,
        OvcServicesRoute,
        EducationBursaryRoute,
        EducationLbseRoute,
        PpPrevRoute {
  void redirectToPages(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    if (formAutoSave.nextPageModule == OgacRoutesConstant.nextPageModule) {
      redirectToOgacEnrollmentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        PpPrevRoutesConstant.enrollmentPageModule) {
      redirectToPpPrevEnrollmentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        LbseRoutesConstant.enrollmentPageModule) {
      redirectToLbseEnrollmentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        LbseRoutesConstant.learningOutcomePageModule) {
      redirectToLbseLearningOutcomeForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        PpPrevRoutesConstant.serviceFormPageModule) {
      redirectToPpPrevServiceForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        BursaryRoutesConstant.assessmentPageModule) {
      redirectToBursaryAssessment(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        BursaryRoutesConstant.enrollmentPageModule) {
      redirectToBursaryEnrollment(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        BursaryRoutesConstant.bursaryWithoutVulnerabilityCriteriaPageModule) {
      redirectToBursaryWithoutVulnerabilityCriteria(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        BursaryRoutesConstant.enrollmentEditPageModule) {
      redirectToBursaryEnrollmentEdit(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        BursaryRoutesConstant.clubsAttendancePageModule) {
      redirectToBursaryClubsAttendance(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        BursaryRoutesConstant.schoolsAttendancePageModule) {
      redirectToBursarySchoolAttendance(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        BursaryRoutesConstant.schoolsPerformancePageModule) {
      redirectToBursarySchoolPerformance(context, formAutoSave);
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
        DreamsRoutesConstant.agywDreamsFamilyPlanningSrhNextPage) {
      redirectToAgywDreamsFamilyPlanningSrhForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsHTSShortFormNextPage) {
      redirectToAgywDreamsHTSShortForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamHIVMessageFormNextPage) {
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
      redirectToAgywDreamsPrEPLongForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        DreamsRoutesConstant.agywDreamsPrepVisitFormNextPage) {
      redirectToAgywDreamsPrEPVisitForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcConcentFormPage) {
      redirectToOvcEnrollmentConsentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcNoneParticipationFormPage) {
      redirectToOvcEnrollmentNoneParticipationForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcCaregiverFormPage) {
      redirectToOvcEnrollmentHouseholdForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcChildRegisterFormPage) {
      redirectToOvcEnrollmentChildForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcCaregiverEditFormPage) {
      redirectToOvcEnrollmentHouseholdEditForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcChildEditFormPage) {
      redirectToOvcEnrollmentChildEditViewForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.houseHoldAssessmentFormPage) {
      redirectToOvcHouseholdAssessmentForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.houseHoldReferralFormPage) {
      redirectToOvcHouseholdReferral(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcReferralFormPage) {
      redirectToOvcReferralForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcCloReferralFormPage) {
      redirectToOvcCloReferralForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcExitFormPage) {
      redirectToOvcExitForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcClosureFormPage) {
      redirectToOvcClosureForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcGraduationFormPage) {
      redirectToOvcGraduationForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.ovcTransferFormPage) {
      redirectToOvcTransferForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.householdExitFormPage) {
      redirectToOvcHouseholdExitForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.householdGraduationFormPage) {
      redirectToOvcHouseholdGraduationForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.householdClosureFormPage) {
      redirectToOvcHouseholdClosureForm(context, formAutoSave);
    } else if (formAutoSave.nextPageModule ==
        OvcRoutesConstant.householdTransferFormPage) {
      redirectToOvcHouseholdTransferForm(context, formAutoSave);
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
      String? pageModule = formAutoSave.nextPageModule;
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
