import 'dart:convert';

class TeiRelationship {
  String? id;
  String? relationshipType;
  String? fromTei;
  String? toTei;
  String? syncStatus;

  TeiRelationship(
      {this.id,
      this.fromTei,
      this.relationshipType,
      this.toTei,
      this.syncStatus});

  @override
  String toString() {
    return 'from $fromTei to $toTei';
  }

  TeiRelationship fromJson(dynamic json) {
    return TeiRelationship(
        id: json['id'],
        fromTei: json['fromTei'],
        relationshipType: json['relationshipType'],
        toTei: json['toTei'],
        syncStatus: json['syncStatus'] ?? 'synced');
  }

  TeiRelationship fromOnline(dynamic json) {
    Map from = json['from'] ?? Map();
    Map fromTrackedEntityInstance = from['trackedEntityInstance'] ?? Map();
    String fromTei = fromTrackedEntityInstance['trackedEntityInstance'] ?? '';

    Map to = json['to'] ?? Map();
    Map toTrackedEntityInstance = to['trackedEntityInstance'] ?? Map();
    String toTei = toTrackedEntityInstance['trackedEntityInstance'] ?? '';

    return TeiRelationship(
      id: json['relationship'],
      syncStatus: json['syncStatus'] ?? 'synced',
      fromTei: fromTei,
      relationshipType: json['relationshipType'],
      toTei: toTei,
    );
  }

  Map toOnline() {
    Map data = new Map<String, dynamic>();
    data['relationshipType'] = relationshipType;
    data['relationship'] = id;
    data['syncStatus'] = syncStatus;

    Map from = new Map<String, dynamic>();
    Map fromTrackedEntityInstance = {'trackedEntityInstance': fromTei};
    from['trackedEntityInstance'] = fromTrackedEntityInstance;
    Map to = new Map<String, dynamic>();
    Map toTrackedEntityInstance = {'trackedEntityInstance': toTei};
    to['trackedEntityInstance'] = toTrackedEntityInstance;

    data['from'] = from;
    data['to'] = to;

    return data;
  }

  String toJson(TeiRelationship teiRelationshipData) {
    return json.encode(toOffline(teiRelationshipData));
  }

  Map toOffline(TeiRelationship teiRelationshipData) {
    Map mapData = Map<String, dynamic>();
    mapData['id'] = teiRelationshipData.id;
    mapData['relationshipType'] = teiRelationshipData.relationshipType;
    mapData['fromTei'] = teiRelationshipData.fromTei;
    mapData['toTei'] = teiRelationshipData.toTei;
    mapData['syncStatus'] = teiRelationshipData.syncStatus;
    return mapData;
  }

  TeiRelationship.fromOffline(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.relationshipType = mapData['relationshipType'];
    this.fromTei = mapData['fromTei'];
    this.toTei = mapData['toTei'];
    this.syncStatus = mapData['syncStatus'];
  }
}
