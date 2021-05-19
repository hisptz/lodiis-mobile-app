import 'dart:convert';

class TrackeEntityInstance {
  String trackedEntityInstance;
  String trackedEntityType;
  String orgUnit;
  String syncStatus;
  dynamic attributes;

  TrackeEntityInstance({
    this.trackedEntityInstance,
    this.trackedEntityType,
    this.orgUnit,
    this.syncStatus,
    this.attributes,
  }) {
    this.attributes = this.attributes ?? [];
  }

  @override
  String toString() {
    return 'trackedEntityInstance $trackedEntityInstance';
  }

  TrackeEntityInstance fromJson(dynamic json) {
    return TrackeEntityInstance(
        trackedEntityInstance: json['trackedEntityInstance'],
        trackedEntityType: json['trackedEntityType'],
        orgUnit: json['orgUnit'],
        attributes: json['attributes'],
        syncStatus: json['syncStatus'] ?? 'synced');
  }

  String toJson(TrackeEntityInstance trackeEntityInstanceObj) {
    return json.encode(toOffline(trackeEntityInstanceObj));
  }

  Map toOffline(TrackeEntityInstance trackeEntityInstanceObj) {
    Map mapData = Map<String, dynamic>();
    mapData['trackedEntityInstance'] =
        trackeEntityInstanceObj.trackedEntityInstance;
    mapData['trackedEntityType'] = trackeEntityInstanceObj.trackedEntityType;
    mapData['orgUnit'] = trackeEntityInstanceObj.orgUnit;
    mapData['syncStatus'] = trackeEntityInstanceObj.syncStatus;
    mapData['attributes'] = trackeEntityInstanceObj.attributes;
    return mapData;
  }

  TrackeEntityInstance.fromOffline(Map<String, dynamic> mapData) {
    this.trackedEntityInstance = mapData['trackedEntityInstance'];
    this.trackedEntityType = mapData['trackedEntityType'];
    this.orgUnit = mapData['orgUnit'];
    this.syncStatus = mapData['syncStatus'];
    this.attributes = mapData['attributes'] ?? [];
  }
}
