import 'dart:convert';

class Enrollment {
  String enrollment;
  String enrollmentDate;
  String incidentDate;
  String program;
  String orgUnit;
  String trckedEntityInstance;
  String status;
  String syncStatus;

  Enrollment(
      {this.enrollment,
      this.enrollmentDate,
      this.incidentDate,
      this.program,
      this.orgUnit,
      this.trckedEntityInstance,
      this.status,
      this.syncStatus});

  @override
  String toString() {
    return 'trckedEntityInstance : $trckedEntityInstance on enrollment :$enrollment';
  }

  Enrollment fromJson(dynamic json) {
    return Enrollment(
        enrollment: json['enrollment'],
        enrollmentDate: "${json['eventDate']}".split('T')[0],
        incidentDate: "${json['incidentDate']}".split('T')[0],
        program: json['program'],
        orgUnit: json['orgUnit'],
        trckedEntityInstance: json['trckedEntityInstance'],
        status: json['status'],
        syncStatus: json['syncStatus']);
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
    mapData['trckedEntityInstance'] = enrollmentData.trckedEntityInstance;
    mapData['status'] = enrollmentData.status;
    mapData['syncStatus'] = enrollmentData.syncStatus;
    return mapData;
  }

  Enrollment.fromOffline(Map<String, dynamic> mapData) {
    this.enrollment = mapData['enrollment'];
    this.enrollmentDate = mapData['enrollmentDate'];
    this.incidentDate = mapData['incidentDate'];
    this.program = mapData['program'];
    this.orgUnit = mapData['orgUnit'];
    this.trckedEntityInstance = mapData['trckedEntityInstance'];
    this.status = mapData['status'];
    this.syncStatus = mapData['syncStatus'];
  }
}
