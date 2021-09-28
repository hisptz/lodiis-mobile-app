import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/access_to_data_entry/access_to_data_entry_warning.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
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
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/dreams_enrollment_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/dreams_referral_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/dreams_incoming_referral_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/dreams_services_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/none_agyw.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/non_agyw_dreams_hts_consent_form.dart';
import 'package:provider/provider.dart';

class DreamsIntervention extends StatefulWidget {
  const DreamsIntervention({Key? key}) : super(key: key);

  @override
  _DreamsInterventionState createState() => _DreamsInterventionState();
}

class _DreamsInterventionState extends State<DreamsIntervention> {
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

  void onClickHome() {}

  void onAddNoneAgywBeneficiary(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${DreamsRoutesConstant.noneAgywHtsConsentPage}_$beneficiaryId";
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
            return NonAgywDreamsHTSConsentForm();
          },
        ),
      );
    }
  }

  void onAddAgywBeneficiary(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywConsentPage}_$beneficiaryId";
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
            return AgywDreamsConsentForm();
          },
        ),
      );
    }
  }

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
                onAddAgywBeneficiary: () => onAddAgywBeneficiary(context),
                onAddNoneAgywBeneficiary: () =>
                    onAddNoneAgywBeneficiary(context),
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
                                                'services'
                                            ? DreamsServicesPage()
                                            : currentInterventionBottomNavigation
                                                        .id ==
                                                    'outGoingreferral'
                                                ? DreamsReferralPage()
                                                : currentInterventionBottomNavigation
                                                            .id ==
                                                        'enrollment'
                                                    ? DreamsEnrollmentPage()
                                                    : currentInterventionBottomNavigation
                                                                .id ==
                                                            'noneAgyw'
                                                        ? NoneAgyw()
                                                        : currentInterventionBottomNavigation
                                                                    .id ==
                                                                'incomingReferral'
                                                            ? DreamsIncomingReferralPage()
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
