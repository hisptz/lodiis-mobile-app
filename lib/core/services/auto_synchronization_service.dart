import 'dart:async';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/services/device_connectivity_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/device_connectivity_state/device_connectivity_state.dart';

class AutoSynchronizationService {
  StreamSubscription checkChangeOfDeviceConnectionStatus(BuildContext context) {
    return DeviceConnectivityProvider()
        .checkChangeOfDeviceConnectionStatus(context);
  }

  void startAutoDownload(BuildContext context) async {
    await Provider.of<SynchronizationState>(context, listen: false)
        .startCheckingStatusOfUnsyncedData(isAutoUpload: true);
    bool isOnline = Provider.of<DeviceConnectivityState>(context, listen: false)
        .connectivityStatus!;
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
        Provider.of<SynchronizationState>(context, listen: false)
            .updateDataUploadStatus(false);
      } else {
        return;
      }
    } else {
      return;
    }
  }
}
