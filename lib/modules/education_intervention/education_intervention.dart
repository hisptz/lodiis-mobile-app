import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/access_to_data_entry/access_to_data_entry_warning.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/core/constants/auto_synchronization.dart';
import 'package:kb_mobile_app/core/services/auto_synchronization_service.dart';
import 'package:kb_mobile_app/core/services/data_quality_service.dart';
import 'package:kb_mobile_app/core/services/device_connectivity_provider.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/education_bursary.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/pages/education_bursary_assessment_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/education_lbse.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/pages/education_lbse_enrollment_form.dart';
import 'package:provider/provider.dart';

class EducationIntervention extends StatefulWidget {
  EducationIntervention({Key? key}) : super(key: key);

  @override
  _EducationInterventionState createState() => _EducationInterventionState();
}

class _EducationInterventionState extends State<EducationIntervention> {
  final bool disableSelectionOfActiveIntervention = true;
  bool isViewReady = false;
  late Timer periodicTimer;
  late StreamSubscription connectionSubscription;
  int syncTimeout = AutoSynchronization.syncTimeout;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isViewReady = true;
      });
    });
    DataQualityService.runDataQualityCheckResolution();
    connectionSubscription = DeviceConnectivityProvider()
        .checkChangeOfDeviceConnectionStatus(context);
    periodicTimer =
        Timer.periodic(Duration(minutes: syncTimeout), (Timer timer) {
      Provider.of<CurrentUserState>(context, listen: false)
          .getAndSetCurrentUserDataEntryAuthorityStatus();
      AutoSynchronizationService().startAutoUpload(context);
    });
  }

  @override
  void dispose() {
    periodicTimer.cancel();
    connectionSubscription.cancel();
    super.dispose();
  }

  void onOpenMoreMenu(
    BuildContext context,
    InterventionCard activeInterventionProgram,
  ) async {
    AppBarUtil.onOpenMoreMenu(
      context,
      activeInterventionProgram,
      disableSelectionOfActiveIntervention,
    );
  }

  void onAddLbseBeneficiary(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${LbseRoutesConstant.enrollmentPageModule}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return EducationLbseEnrollmentForm();
          },
        ),
      );
    }
  }

  void onAddBursaryBeneficiary(BuildContext context) async {
    print("onAddBursaryBeneficiary");
    String beneficiaryId = "";
    String formAutoSaveId =
        "${BursaryRoutesConstant.enrollmentPageModule}_$beneficiaryId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return EducationBursaryAssessmentForm();
          },
        ),
      );
    }
  }

  void onClickHome() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<InterventionCardState>(
        builder: (context, interventionCardState, child) {
          InterventionCard activeInterventionProgram =
              interventionCardState.currentInterventionProgram;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90),
              child: InterventionAppBar(
                activeInterventionProgram: activeInterventionProgram,
                onClickHome: onClickHome,
                onAddLbseBeneficiary: () => onAddLbseBeneficiary(context),
                onAddBursaryBeneficiary: () => onAddBursaryBeneficiary(context),
                onOpenMoreMenu: () =>
                    onOpenMoreMenu(context, activeInterventionProgram),
              ),
            ),
            body: Container(
              child: Consumer<CurrentUserState>(
                  builder: (context, currentUserState, child) {
                bool hasAccessToDataEntry =
                    currentUserState.canCurrentUserDoDataEntry;
                return Container(
                  child: !isViewReady
                      ? Container(
                          margin: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: CircularProcessLoader(
                            color: Colors.blueGrey,
                          ),
                        )
                      : !hasAccessToDataEntry
                          ? AccessToDataEntryWarning()
                          : Container(
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          activeInterventionProgram.background,
                                    ),
                                  ),
                                  Consumer<InterventionBottomNavigationState>(
                                    builder: (context,
                                        interventionBottomNavigationState,
                                        child) {
                                      InterventionBottomNavigation
                                          currentInterventionBottomNavigation =
                                          interventionBottomNavigationState
                                              .getCurrentInterventionBottomNavigation(
                                                  activeInterventionProgram);
                                      return Container(
                                        child: currentInterventionBottomNavigation
                                                    .id ==
                                                'lbse'
                                            ? EducationLbse()
                                            : currentInterventionBottomNavigation
                                                        .id ==
                                                    'bursary'
                                                ? EducationBursary()
                                                : RoutePageNotFound(
                                                    pageTitle:
                                                        currentInterventionBottomNavigation
                                                            .id,
                                                  ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                );
              }),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer(),
          );
        },
      ),
    );
  }
}
