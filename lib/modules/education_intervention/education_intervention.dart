import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_button_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/access_to_data_entry/access_to_data_entry_warning.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/constants/auto_synchronization.dart';
import 'package:kb_mobile_app/core/services/auto_synchronization_service.dart';
import 'package:kb_mobile_app/core/services/data_quality_service.dart';
import 'package:kb_mobile_app/core/services/device_connectivity_provider.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
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
      AutoSynchronizationService().startAutoDownload(context);
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

  //@TODO controll on adding LBSE and Bursary pages

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
                                      //@TODO handling tabs selections
                                      return Container(
                                        child: Text(
                                          currentInterventionBottomNavigation
                                              .name!,
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
