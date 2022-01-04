import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/utils/app_resume_route_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_case_closure_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_case_transfer_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_caseplan_graduation_readiness_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_information_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/household_case_closure/ovc_household_case_closure.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/household_exit/ovc_household_exit.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/household_graduation/pages/ovc_household_graduation_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/household_transfer/ovc_household_case_transfer.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_clo_referral_add_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/pages/ovc_child_referral_add_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/pages/ovc_household_add_referral_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_assessment/pages/ovc_household_assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/pages/ovc_household_case_plan_form.dart';

class OvcServicesRoute {
  redirectToOvcHouseholdAssessmentForm(
    BuildContext context,
    FormAutoSave formAutoSave,
  ) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcHouseholdAssessmentForm();
        },
      ),
    );
  }

  redirectToOvcHouseholdCasePlanForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcHouseholdCasePlanForm();
        },
      ),
    );
  }

  redirectToOvcHouseholdReferral(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcHouseholdAddReferralForm();
        },
      ),
    );
  }

  redirectToOvcReferralForm(BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcChildReferralAddForm()));
  }

  redirectToOvcCloReferralForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcChildCLOReferralAddForm()));
  }

  redirectToOvcHouseholdClosureForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcHouseholdCaseClosure();
        },
      ),
    );
  }

  redirectToOvcHouseholdGraduationForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcHouseholdGraduationForm();
        },
      ),
    );
  }

  redirectToOvcHouseholdTransferForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcHouseholdCaseTransfer();
        },
      ),
    );
  }

  redirectToOvcHouseholdExitForm(
      BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcHouseholdExit();
        },
      ),
    );
  }

  redirectToOvcClosureForm(BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcExitCaseClosureForm();
        },
      ),
    );
  }

  redirectToOvcGraduationForm(BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcExitCasePlanGraduationReadinessForm();
        },
      ),
    );
  }

  redirectToOvcTransferForm(BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcExitCaseTransferForm();
        },
      ),
    );
  }

  redirectToOvcExitForm(BuildContext context, FormAutoSave formAutoSave) {
    AppResumeRouteUtil.setServiceFormState(context, formAutoSave);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OvcExitInformationForm();
        },
      ),
    );
  }
}
