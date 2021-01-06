import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:sqflite/sqflite.dart';

class EnrollmentOfflineProvider extends OfflineDbProvider {
  final String table = 'enrollment';

  //columns
  final String id = 'id';
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
    Map data = Enrollment().toOffline(enrollment);
    data['id'] = data['enrollment'];
    await dbClient.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Enrollment>> getEnrollements(String programId, {page}) async {
    List<Enrollment> enrollments = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(table,
          columns: [
            enrollment,
            enrollmentDate,
            incidentDate,
            program,
            orgUnit,
            status,
            syncStatus,
            trackedEntityInstance
          ],
          where: '$program = ?',
          orderBy: '$enrollmentDate DESC',
          whereArgs: [programId],
          limit: page != null ? PaginationConstants.paginationLimit : null,
          offset:
              page != null ? page * PaginationConstants.paginationLimit : null);
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          enrollments.add(Enrollment.fromOffline(map));
        }
      }
    } catch (e) {}
    return enrollments
      ..sort((b, a) => a.enrollmentDate.compareTo(b.enrollmentDate));
  }

  Future<int> getEnrollmentsCount(String programId) async {
    var dbClient = await db;
    List<Map> enrollmentList = await dbClient.query(
          table,
          columns: [enrollment],
          where: '$program = ?',
          whereArgs: [programId],
        ) ??
        [];

    return enrollmentList.length;
  }

  Future<List<Enrollment>> getEnrollmentByStatus(
      String enrollmentSyncStatus) async {
    List<Enrollment> enrollments = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [
          enrollment,
          enrollmentDate,
          incidentDate,
          program,
          orgUnit,
          status,
          syncStatus,
          trackedEntityInstance
        ],
        where: '$syncStatus = ?',
        whereArgs: [enrollmentSyncStatus],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          enrollments.add(Enrollment.fromOffline(map));
        }
      }
    } catch (e) {}
    return enrollments;
  }
}
