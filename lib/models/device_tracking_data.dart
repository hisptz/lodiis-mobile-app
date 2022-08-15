import 'package:kb_mobile_app/core/constants/device_tracking_constant.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';

class DeviceTrackingData {
  Map deviceInfo;

  DeviceTrackingData({
    required this.deviceInfo,
  });

  Map toProfileData() {
    return {
      "trackedEntityInstance": deviceInfo['trackedEntityInstance'] ?? '',
      "trackedEntityType": DeviceTrackingConstant.trackedEntityType,
      "orgUnit": deviceInfo['orgUnit'] ?? '',
      "attributes": DeviceTrackingConstant.attributes.map((attributeId) {
        return {
          "attribute": attributeId,
          "value": deviceInfo[attributeId] ?? ''
        };
      }).toList(),
      "enrollments": [
        {
          "enrollment": AppUtil.getUid(),
          "trackedEntityInstance": deviceInfo['trackedEntityInstance'] ?? '',
          "orgUnit": deviceInfo['orgUnit'] ?? '',
          "program": DeviceTrackingConstant.program,
          "enrollmentDate": AppUtil.formattedDateTimeIntoString(DateTime.now()),
          "incidentDate": AppUtil.formattedDateTimeIntoString(DateTime.now()),
        }
      ]
    };
  }

  String toEventData() {
    return '';
  }
}
