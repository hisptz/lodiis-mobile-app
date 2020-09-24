import 'dart:convert';

class TeiRelationship {
  String id;
  String relationshipType;
  String fromTei;
  String toTei;

  TeiRelationship({
    this.id,
    this.fromTei,
    this.relationshipType,
    this.toTei,
  });

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
    );
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
    return mapData;
  }

  TeiRelationship.fromOffline(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.relationshipType = mapData['relationshipType'];
    this.fromTei = mapData['fromTei'];
    this.toTei = mapData['toTei'];
  }
}
