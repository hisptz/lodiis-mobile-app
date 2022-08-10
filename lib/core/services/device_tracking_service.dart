import 'dart:convert';

import 'package:kb_mobile_app/core/constants/app_info_reference.dart';
import 'package:kb_mobile_app/core/constants/device_tracking_constant.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/device_info_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class DeviceTrackingService {
  final String lastLoginKey = 'lastLogin';
  final String lastMetadataDownloadDateKey = "lastMetataSyncPreferenceKey";
  final String lastDataDownloadDateKey = "lastSyncDatePreferenceKey";
  final String lastDataUploadDateKey = "lastDataUploadDatePreferenceKey";

  Future syncDeviceTrackingInfo() async {
    try {
      // try if you have sync metdata on given day
      Map dataObject = await getDeviveTrackingDataObject();
      //TODO generating model data for tracking
      print(json.encode(dataObject));
    } catch (e) {
      //
    }
  }

  Future<Map> getDeviveTrackingDataObject() async {
    CurrentUser? user = await UserService().getCurrentUser();
    Map dataObject = {};
    Map deviceInfo = await DeviceInfoUtil.getDeviceInfo();
    dataObject[DeviceTrackingConstant.deviceId] = deviceInfo['androidId'] ?? '';
    dataObject[DeviceTrackingConstant.deviceModel] = deviceInfo['model'] ?? '';
    dataObject[DeviceTrackingConstant.deviceManufacturerName] =
        deviceInfo['manufacturer'] ?? '';
    dataObject[DeviceTrackingConstant.productName] =
        deviceInfo['product'] ?? '';
    dataObject[DeviceTrackingConstant.securityPatchDate] =
        deviceInfo['version.securityPatch'] ?? '';
    dataObject[DeviceTrackingConstant.appVersion] =
        AppInfoReference.currentAppVersion;
    dataObject[DeviceTrackingConstant.syncedEnrollemnts] =
        await TrackedEntityInstanceOfflineProvider()
            .getTeiCountBySyncStatus('synced');
    dataObject[DeviceTrackingConstant.unSyncedEnrollemnts] =
        await TrackedEntityInstanceOfflineProvider()
            .getTeiCountBySyncStatus('not-synced');
    dataObject[DeviceTrackingConstant.syncedServices] =
        await EventOfflineProvider().getEventsCountBySyncStatus('synced');
    dataObject[DeviceTrackingConstant.unSyncedServices] =
        await EventOfflineProvider().getEventsCountBySyncStatus('not-synced');
    dataObject[DeviceTrackingConstant.dataStoreRef] = deviceInfo[''] ?? '';
    dataObject[DeviceTrackingConstant.lastDataDownloadDate] =
        await getLastDataDownloadDate();
    dataObject[DeviceTrackingConstant.lastDataUploadDate] =
        await getLastDataUploadDate();
    dataObject[DeviceTrackingConstant.lastMetadataDownloadDate] =
        await getLastMetaDataSyncDate();
    dataObject[DeviceTrackingConstant.lastLoginDate] =
        await getLastLoginDate(username: user!.username!);
    dataObject[DeviceTrackingConstant.username] = user.username!;
    return dataObject;
  }

  Future<String> getLastMetaDataSyncDate() async {
    String lastMetadataDownloadDate = '';
    try {
      var date = await PreferenceProvider.getPreferenceValue(
          lastMetadataDownloadDateKey);
      lastMetadataDownloadDate = date ?? lastMetadataDownloadDate;
    } catch (e) {
      //
    }
    return lastMetadataDownloadDate;
  }

  Future setLastMetaDataSyncDate({String date = ''}) async {
    date = date.isEmpty
        ? AppUtil.formattedDateTimeIntoString(DateTime.now())
        : date;
    await PreferenceProvider.setPreferenceValue(
        lastMetadataDownloadDateKey, date);
  }

  Future<String> getLastDataDownloadDate() async {
    String lastDataDownloadDate = '';
    try {
      var date =
          await PreferenceProvider.getPreferenceValue(lastDataDownloadDateKey);
      lastDataDownloadDate = date ?? lastDataDownloadDate;
    } catch (e) {
      //
    }
    return lastDataDownloadDate;
  }

  Future<String> getLastDataUploadDate() async {
    String lastDataUploadDate = '';
    try {
      var date =
          await PreferenceProvider.getPreferenceValue(lastDataUploadDateKey);
      lastDataUploadDate = date ?? lastDataUploadDate;
    } catch (e) {
      //
    }
    return lastDataUploadDate;
  }

  Future<String> getLastLoginDate({
    required String username,
  }) async {
    String lastLoginDate = '';
    try {
      String preferenceKey = "${username}_$lastLoginKey";
      var date = await PreferenceProvider.getPreferenceValue(preferenceKey);
      lastLoginDate = date ?? lastLoginDate;
    } catch (e) {
      //
    }
    return lastLoginDate;
  }

  Future setLastLoginDate({
    required String username,
    String date = '',
  }) async {
    date = date.isEmpty
        ? AppUtil.formattedDateTimeIntoString(DateTime.now())
        : date;
    String preferenceKey = "${username}_$lastLoginKey";
    await PreferenceProvider.setPreferenceValue(preferenceKey, date);
  }
}
