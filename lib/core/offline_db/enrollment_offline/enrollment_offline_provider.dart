import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:sqflite/sqflite.dart';

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

  addOrUpdateEnrollement(Enrollment enrollment) async {
    var dbClient = await db;
    var data = Enrollment().toOffline(enrollment);
    await dbClient.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
