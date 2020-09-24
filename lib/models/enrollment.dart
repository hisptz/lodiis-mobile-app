class Enrollment {
  final String enrollment;
  final String enrollmentDate;
  final String incidentDate;
  final String program;
  final String orgUnit;
  final String trckedEntityInstances;
  final String status;
  final String syncStatus;

  Enrollment(
      this.enrollment,
      this.enrollmentDate,
      this.incidentDate,
      this.program,
      this.orgUnit,
      this.trckedEntityInstances,
      this.status,
      this.syncStatus);

  @override
  String toString() {
    return 'trckedEntityInstances : $trckedEntityInstances on enrollment :$enrollment';
  }
}
