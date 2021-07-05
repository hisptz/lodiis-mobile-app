import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/dreams_routes/dreams_services_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ogac_routes/ogac_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_enrollment_route.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/ovc_routes/ovc_services_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/constants/ogac_intervention_constant.dart';

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
    if (formAutoSave.nextPageModule ==
        OgacInterventionConstant.nextPageModule) {
      redirectToOgacEnrollmemntForm(context, formAutoSave);
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
      String pageModule = formAutoSave.pageModule;
      Widget modal = getConfirmationWidget(context, pageModule);
      String title = beneficiaryName;
      dynamic hasConfirmResume = await AppUtil.showPopUpModal(
        context,
        modal,
        diablePadding,
        title: title,
      );
      shouldResumeFormState = "$hasConfirmResume" == "true";
    }
    return shouldResumeFormState;
  }

  Widget getConfirmationWidget(BuildContext context, String pageModule) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "You have unsaved data on $pageModule module, Do want to continue?",
              style: TextStyle().copyWith(
                color: Color(0xFF82898D),
                fontSize: 14.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: MaterialButton(
                      color: Colors.greenAccent,
                      onPressed: () => Navigator.pop(context, true),
                      child: Container(
                        child: Text(
                          "Continue",
                          style: TextStyle().copyWith(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: MaterialButton(
                      color: Colors.redAccent,
                      onPressed: () => Navigator.pop(context),
                      child: Container(
                        child: Text(
                          "Discard changes",
                          style: TextStyle().copyWith(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
