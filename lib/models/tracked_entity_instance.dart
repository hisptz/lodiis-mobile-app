import 'dart:convert';

class TrackeEntityInstance {
  String trckedEntityInstance;
  String trackedEntityType;
  String orgUnit;
  String syncStatus;
  dynamic attributes;

  TrackeEntityInstance({
    this.trckedEntityInstance,
    this.trackedEntityType,
    this.orgUnit,
    this.syncStatus,
    this.attributes,
  }) {
    this.syncStatus = this.syncStatus ?? 'synced';
  }
  @override
  String toString() {
    return 'trckedEntityInstance $trckedEntityInstance';
  }

  factory TrackeEntityInstance.fromJson(dynamic json) {
    return TrackeEntityInstance();
  }

  String toJson(TrackeEntityInstance trackeEntityInstanceObj) {
    return json.encode(toOffline(trackeEntityInstanceObj));
  }

  Map toOffline(TrackeEntityInstance trackeEntityInstanceObj) {
    Map mapData = Map<String, dynamic>();
    mapData['trckedEntityInstance'] = this.trckedEntityInstance;
    mapData['trackedEntityType'] = this.trackedEntityType;
    mapData['orgUnit'] = this.orgUnit;
    mapData['syncStatus'] = this.syncStatus;
    mapData['attributes'] = this.attributes;
    return mapData;
  }

  TrackeEntityInstance.fromOffline(Map<String, dynamic> mapData) {
    this.trckedEntityInstance = mapData['trckedEntityInstance'];
    this.trackedEntityType = mapData['trackedEntityType'];
    this.orgUnit = mapData['orgUnit'];
    this.syncStatus = mapData['syncStatus'];
    this.attributes = mapData['attributes'];
  }
}
