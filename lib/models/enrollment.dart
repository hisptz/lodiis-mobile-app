import 'dart:convert';

class Enrollment {
  String? enrollment;
  String? enrollmentDate;
  String? incidentDate;
  String? program;
  String? orgUnit;
  String? trackedEntityInstance;
  String? status;
  String? syncStatus;
  String? searchableValue;

  Enrollment(
      {this.enrollment,
      this.enrollmentDate,
      this.incidentDate,
      this.program,
      this.orgUnit,
      this.trackedEntityInstance,
      this.status,
      this.searchableValue,
      this.syncStatus});

  @override
  String toString() {
    return 'trackedEntityInstance : $trackedEntityInstance on enrollment :$enrollment';
  }

  Enrollment fromJson(dynamic json) {
    return Enrollment(
        enrollment: json['enrollment'],
        enrollmentDate: "${json['enrollmentDate']}".split('T')[0],
        incidentDate: "${json['incidentDate']}".split('T')[0],
        program: json['program'],
        orgUnit: json['orgUnit'],
        trackedEntityInstance: json['trackedEntityInstance'],
        status: json['status'],
        searchableValue: json['searchableValue'] ?? '',
        syncStatus: json['syncStatus'] ?? 'synced');
  }

  String toJson(Enrollment enrollment) {
    return json.encode(toOffline(enrollment));
  }

  Map toOffline(Enrollment enrollmentData) {
    var mapData = Map<String, dynamic>();
    mapData['enrollment'] = enrollmentData.enrollment;
    mapData['enrollmentDate'] = enrollmentData.enrollmentDate;
    mapData['incidentDate'] = enrollmentData.incidentDate;
    mapData['program'] = enrollmentData.program;
    mapData['orgUnit'] = enrollmentData.orgUnit;
    mapData['trackedEntityInstance'] = enrollmentData.trackedEntityInstance;
    mapData['status'] = enrollmentData.status;
    mapData['syncStatus'] = enrollmentData.syncStatus;
    mapData['searchableValue'] = enrollmentData.searchableValue;
    return mapData;
  }

  Enrollment.fromOffline(Map<String, dynamic> mapData) {
    this.enrollment = mapData['enrollment'];
    this.enrollmentDate = mapData['enrollmentDate'];
    this.incidentDate = mapData['incidentDate'];
    this.program = mapData['program'];
    this.orgUnit = mapData['orgUnit'];
    this.trackedEntityInstance = mapData['trackedEntityInstance'];
    this.status = mapData['status'];
    this.syncStatus = mapData['syncStatus'];
    this.searchableValue = mapData['searchableValue'];
  }
}
