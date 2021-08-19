import 'dart:convert';

class TrackedEntityInstance {
  String? trackedEntityInstance;
  String? trackedEntityType;
  String? orgUnit;
  String? syncStatus;
  dynamic attributes;

  TrackedEntityInstance({
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

  TrackedEntityInstance fromJson(dynamic json) {
    return TrackedEntityInstance(
        trackedEntityInstance: json['trackedEntityInstance'],
        trackedEntityType: json['trackedEntityType'],
        orgUnit: json['orgUnit'],
        attributes: json['attributes'],
        syncStatus: json['syncStatus'] ?? 'synced');
  }

  String toJson(TrackedEntityInstance trackedEntityInstanceObj) {
    return json.encode(toOffline(trackedEntityInstanceObj));
  }

  Map toOffline(TrackedEntityInstance trackedEntityInstanceObj) {
    Map mapData = Map<String, dynamic>();
    mapData['trackedEntityInstance'] =
        trackedEntityInstanceObj.trackedEntityInstance;
    mapData['trackedEntityType'] = trackedEntityInstanceObj.trackedEntityType;
    mapData['orgUnit'] = trackedEntityInstanceObj.orgUnit;
    mapData['syncStatus'] = trackedEntityInstanceObj.syncStatus;
    mapData['attributes'] = trackedEntityInstanceObj.attributes;
    return mapData;
  }

  TrackedEntityInstance.fromOffline(Map<String, dynamic> mapData) {
    this.trackedEntityInstance = mapData['trackedEntityInstance'];
    this.trackedEntityType = mapData['trackedEntityType'];
    this.orgUnit = mapData['orgUnit'];
    this.syncStatus = mapData['syncStatus'];
    this.attributes = mapData['attributes'] ?? [];
  }
}
