import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';

class EnrollmentOfflineProvider extends OfflineDbProvider {
  final String table = 'enrollment';

  //columns
  final String enrollment = 'enrollment';
  final String enrollmentDate = 'enrollmentDate';
  final String incidentDate = 'incidentDate';
  final String program = 'program';
  final String orgUnit = 'orgUnit';
  final String trackedEntityInstance = 'trackedEntityInstance';
  final String status = 'status';
  final String syncStatus = 'syncStatus';
}
