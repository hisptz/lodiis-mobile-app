import 'dart:convert';

import 'package:kb_mobile_app/core/constants/app_info_reference.dart';
import 'package:kb_mobile_app/core/constants/device_tracking_constant.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/preference_provider.dart';
import 'package:kb_mobile_app/core/services/tracked_entity_instance_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/device_info_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/device_tracking_data.dart';

class DeviceTrackingService {
  final String deviceTrackingReference = 'deviceTrackingReference';

  Future checkAndRegistertDeviceTrackingInfo({
    required CurrentUser user,
  }) async {
    String trackedEntityInstance = AppUtil.getUid();
    Map deviceInfo = await DeviceInfoUtil.getDeviceInfo();
    String uniqueId =
        deviceInfo['identifierForVendor'] ?? deviceInfo['androidId'] ?? '';
    String filters = "${DeviceTrackingConstant.deviceId}:eq:$uniqueId";
    List<dynamic> teis = await TrackedEntityInstanceService()
        .discoveringBeneficiaryByFilters(
            [DeviceTrackingConstant.program], filters);
    if (teis.isEmpty) {
      await registerDeviceForTracking(
        user,
        trackedEntityInstance,
        uniqueId,
        deviceInfo,
      );
    } else {
      Map teiObj = teis.first ?? {};
      trackedEntityInstance =
          teiObj['trackedEntityInstance'] ?? trackedEntityInstance;
    }
    setDeviceTrackingReference(teiId: trackedEntityInstance);
  }

  Future<String> getDeviceTrackingReference() async {
    String teiId = '';
    try {
      var response =
          await PreferenceProvider.getPreferenceValue(deviceTrackingReference);
      teiId = response ?? teiId;
    } catch (e) {
      //
    }
    return teiId;
  }

  Future setDeviceTrackingReference({required String teiId}) async {
    await PreferenceProvider.setPreferenceValue(deviceTrackingReference, teiId);
  }

  Future registerDeviceForTracking(
    CurrentUser user,
    String trackedEntityInstance,
    String uniqueId,
    Map<dynamic, dynamic> deviceInfo,
  ) async {
    var httpClient = HttpService(
      username: user.username,
      password: user.password,
    );
    var queryParameters = {
      "strategy": "CREATE_AND_UPDATE",
    };
    List userOrgUnitIds = user.userOrgUnitIds ?? [];
    Map dataObject = {
      "trackedEntityInstance": trackedEntityInstance,
      "orgUnit": userOrgUnitIds.first ?? '',
    };
    dataObject[DeviceTrackingConstant.deviceId] = uniqueId;
    dataObject[DeviceTrackingConstant.deviceManufacturer] =
        deviceInfo['manufacturer'] ?? '';
    dataObject[DeviceTrackingConstant.deviceModel] = deviceInfo['model'] ?? '';
    dataObject[DeviceTrackingConstant.usernameAttribute] = user.username;
    dataObject[DeviceTrackingConstant.appVersionIdAttribute] =
        AppInfoReference.currentAppVersion;
    DeviceTrackingData deviceTrackingData =
        DeviceTrackingData(deviceInfo: dataObject);
    await httpClient.httpPost(
      'api/trackedEntityInstances',
      json.encode({
        "trackedEntityInstances": [deviceTrackingData.toProfileData()]
      }),
      queryParameters: queryParameters,
    );
  }
}
