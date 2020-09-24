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

  TrackeEntityInstance fromJson(dynamic json) {
    return TrackeEntityInstance(
      trckedEntityInstance: json['trckedEntityInstance'],
      trackedEntityType: json['trackedEntityType'],
      orgUnit: json['orgUnit'],
      attributes: json['attributes'],
      syncStatus: json['syncStatus'],
    );
  }

  String toJson(TrackeEntityInstance trackeEntityInstanceObj) {
    return json.encode(toOffline(trackeEntityInstanceObj));
  }

  Map toOffline(TrackeEntityInstance trackeEntityInstanceObj) {
    Map mapData = Map<String, dynamic>();
    mapData['trckedEntityInstance'] =
        trackeEntityInstanceObj.trckedEntityInstance;
    mapData['trackedEntityType'] = trackeEntityInstanceObj.trackedEntityType;
    mapData['orgUnit'] = trackeEntityInstanceObj.orgUnit;
    mapData['syncStatus'] = trackeEntityInstanceObj.syncStatus;
    mapData['attributes'] = trackeEntityInstanceObj.attributes;
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
