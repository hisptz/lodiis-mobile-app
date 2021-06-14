import 'dart:async';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/device_connectivity_state/device_connectivity_state.dart';
import 'package:kb_mobile_app/core/constants/app_logs.dart';
import 'package:kb_mobile_app/core/offline_db/app_logs_offline/app_logs_offline_provider.dart';
import 'package:kb_mobile_app/models/app_logs.dart';

class AutoSynchronizationService {
  StreamSubscription checkChangeOfDeviceConnectionStatus(BuildContext context) {
    return Connectivity()
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
  }

  void startAutoDownload(BuildContext context) async {
    await Provider.of<SynchronizationState>(context, listen: false)
        .startCheckingStatusOfUnsyncedData(isAutoUpload: true);
    bool isOnline = Provider.of<DeviceConnectivityState>(context, listen: false)
        .connectivityStatus;
    if (isOnline) {
      bool isDataSyncActive =
          Provider.of<SynchronizationState>(context, listen: false)
                  .isDataUploadingActive ||
              Provider.of<SynchronizationState>(context, listen: false)
                  .isDataDownloadingActive;
      bool hasUnsyncedData =
          Provider.of<SynchronizationState>(context, listen: false)
              .hasUnsyncedData;
      if (hasUnsyncedData && !isDataSyncActive) {
        await Provider.of<SynchronizationState>(context, listen: false)
            .startDataUploadActivity(isAutoUpload: true);
      } else {
        return;
      }
    } else {
      return;
    }
  }
}
