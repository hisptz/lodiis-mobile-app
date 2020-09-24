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

  factory Enrollment.fromJson(dynamic json) {
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

  Map toOffline(Enrollment enrollment) {
    var mapData = Map<String, dynamic>();
    mapData['enrollment'] = this.enrollment;
    mapData['enrollmentDate'] = this.enrollmentDate;
    mapData['incidentDate'] = this.incidentDate;
    mapData['program'] = this.program;
    mapData['orgUnit'] = this.orgUnit;
    mapData['trckedEntityInstance'] = this.trckedEntityInstance;
    mapData['status'] = this.status;
    mapData['syncStatus'] = this.syncStatus;
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
