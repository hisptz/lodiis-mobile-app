import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/constants/app_logs.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/device_connectivity_state/device_connectivity_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ogac_intervention_list_state/ogac_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/services/reserved_attribute_value_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_container.dart';

class InterventionSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterventionSelectionState();
  }
}

class _InterventionSelectionState extends State<InterventionSelection> {
  List<InterventionCard> interventionPrograms =
      InterventionCard.getInterventions();

  Color primmaryColor = CustomColor.defaultPrimaryColor;
  bool hasDataLoaded = false;
  Timer periodicTimer;
  StreamSubscription connectionSubscription;
  // @TODO: syncTimeout to be set in the state and to be configurable
  int syncTimeout = 30;

  void onIntervetionSelection(InterventionCard interventionProgram) {
    setState(() {
      AppUtil.setStatusBarColor(interventionProgram.primmaryColor);
      primmaryColor = interventionProgram.primmaryColor;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), updateDataStateLoadingStatus);
    checkChangeOfDeviceConnectionStatus();
    // @TODO: set timer for recalling the sync method
    periodicTimer =
        Timer.periodic(Duration(minutes: syncTimeout), (Timer timer) {
      startAutoSynchronization();
    });
  }

  @override
  dispose() {
    periodicTimer?.cancel();
    connectionSubscription.cancel();
    super.dispose();
  }

  void checkChangeOfDeviceConnectionStatus() async {
    try {
      connectionSubscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult connectivityResult) async {
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          Provider.of<DeviceConnectivityState>(context, listen: false)
              .changeConnectivityStatus(isConnected: true);
        } else if (connectivityResult == ConnectivityResult.none) {
          Provider.of<DeviceConnectivityState>(context, listen: false)
              .changeConnectivityStatus(isConnected: false);
        } else {
          Provider.of<DeviceConnectivityState>(context, listen: false)
              .changeConnectivityStatus(isConnected: false);
          AppLogs log = AppLogs(
              type: AppLogsConstants.errorLogType,
              message: 'Failed to get connectivity.');
          await AppLogsOfflineProvider().addLogs(log);
        }
      });
    } catch (error) {
      AppLogs log = AppLogs(
          type: AppLogsConstants.errorLogType, message: error.toString());
      await AppLogsOfflineProvider().addLogs(log);
    }
  }

  void startAutoSynchronization() async {
    bool isOnline = Provider.of<DeviceConnectivityState>(context, listen: false)
        .connectivityStatus;
    if (isOnline) {
      bool isDataUploadingActive =
          Provider.of<SynchronizationState>(context, listen: false)
              .isDataUploadingActive;
      bool hasUnsyncedData =
          Provider.of<SynchronizationState>(context, listen: false)
              .hasUnsyncedData;

      if (hasUnsyncedData && !isDataUploadingActive) {
        await Provider.of<SynchronizationState>(context, listen: false)
            .startDataUploadActivity();
        Provider.of<SynchronizationState>(context, listen: false)
            .startCheckingStatusOfUnsyncedData();
      } else {
        return;
      }
    } else {
      return;
    }
  }

  updateDataStateLoadingStatus() async {
    try {
      await ReservedAttributeValueService().generateReservedAttributeValues();
      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcNumber();
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .refreshBeneficiariesNumber();
      Provider.of<OgacInterventionListState>(context, listen: false)
          .refreshOgacNumber();
      Provider.of<CurrentUserState>(context, listen: false)
          .setCurrentUserLocation();
      setState(() {
        hasDataLoaded = true;
      });
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(color: primmaryColor),
        ),
        Container(child: Consumer<OvcInterventionListState>(
          builder: (context, ovcInterventionListState, child) {
            bool isOvcListLoading = ovcInterventionListState.isLoading;
            int numberOfHouseHolds =
                ovcInterventionListState.numberOfHouseHolds;
            int numberOfOvcs = ovcInterventionListState.numberOfOvcs;
            return Container(
              child: Consumer<DreamsInterventionListState>(
                builder: (context, dreamsInterventionListState, child) {
                  bool isDreamsListLoading =
                      dreamsInterventionListState.isLoading;
                  int numberOfAgywDreamsBeneficiaries =
                      dreamsInterventionListState
                          .numberOfAgywDreamsBeneficiaries;
                  int numberOfNoneAgywDreamsBeneficiaries =
                      dreamsInterventionListState
                          .numberOfNoneAgywDreamsBeneficiaries;
                  return Consumer<OgacInterventionListState>(
                    builder: (context, ogacInterventionListState, child) {
                      int numberOfOgac = ogacInterventionListState.numberOfOgac;
                      bool isOgacListLoading =
                          ogacInterventionListState.isLoading;
                      return Container(
                        child: isDreamsListLoading ||
                                isOvcListLoading ||
                                isOgacListLoading
                            ? CircularProcessLoader()
                            : InterventionSelectionContainer(
                                interventionPrograms: interventionPrograms,
                                onIntervetionSelection: onIntervetionSelection,
                                numberOfHouseHolds: numberOfHouseHolds,
                                numberOfAgywDreamsBeneficiaries:
                                    numberOfAgywDreamsBeneficiaries,
                                numberOfNoneAgywDreamsBeneficiaries:
                                    numberOfNoneAgywDreamsBeneficiaries,
                                numberOfOvcs: numberOfOvcs,
                                numberOfOgac: numberOfOgac,
                              ),
                      );
                    },
                  );
                },
              ),
            );
          },
        )),
      ],
    )));
  }
}
