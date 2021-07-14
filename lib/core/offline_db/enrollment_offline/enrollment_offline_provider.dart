import 'package:kb_mobile_app/core/constants/pagination.dart';
import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
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

  addOrUpdateMultipleEnrollments(List<dynamic> enrollments) async {
    try {
      var dbClient = await db;
      List<List<dynamic>> chunkedEnrollments =
          AppUtil().chunkItems(items: enrollments, size: 100);
      for (List<dynamic> enrollmentsGroup in chunkedEnrollments) {
        var enrollmentBatch = dbClient.batch();
        for (dynamic enrollment in enrollmentsGroup) {
          Map data = Enrollment().toOffline(enrollment);
          data['id'] = data['enrollment'];
          enrollmentBatch.insert(table, data,
              conflictAlgorithm: ConflictAlgorithm.replace);
        }
        return await enrollmentBatch.commit(
            noResult: true, continueOnError: true);
      }
    } catch (e) {
      throw e;
    }
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

  Future<List<Enrollment>> getEnrollmentsFromTeiList(
      List<String> teiIds) async {
    List<Enrollment> enrollments = [];
    try {
      String questionMarks =
          (teiIds.isEmpty ? [''] : teiIds).map((e) => '?').toList().join(',');
      var dbClient = await db;
      List<Map> maps = await dbClient.query(table,
          columns: [
            enrollment,
            enrollmentDate,
            incidentDate,
            program,
            orgUnit,
            trackedEntityInstance
          ],
          where: "$trackedEntityInstance IN ($questionMarks)",
          whereArgs: [...teiIds]);

      if (maps.isNotEmpty) {
        for (Map map in maps) {
          enrollments.add(Enrollment.fromOffline(map));
        }
      }
    } catch (e) {}
    return enrollments;
  }

  Future<int> getFilteredEnrollmentsCount(
      String programId, List<String> filteredTei) async {
    String questionMarks = (filteredTei.isEmpty ? [''] : filteredTei)
        .map((e) => '?')
        .toList()
        .join(',');

    var dbClient = await db;
    List<Map> enrollmentList = await dbClient.query(
          table,
          columns: [enrollment],
          where: '$trackedEntityInstance IN ($questionMarks) AND $program = ?',
          whereArgs: [...filteredTei, programId],
        ) ??
        [];
    return enrollmentList.length;
  }

  Future<List<Enrollment>> getFilteredEnrollments(String programId,
      {int page, List<String> requiredTeiList}) async {
    List<Enrollment> enrollments = [];
    try {
      String questionMarks = (requiredTeiList.isEmpty ? [''] : requiredTeiList)
          .map((e) => '?')
          .toList()
          .join(',');
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
          where: "$trackedEntityInstance IN ($questionMarks) AND $program = ?",
          orderBy: '$enrollmentDate DESC',
          whereArgs: [...requiredTeiList, programId],
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

  Future<int> getOfflineEnrollmentsCount(
      String programId, String orgUnitId) async {
    int offlineEnrollmentsCount;
    try {
      var dbClient = await db;
      offlineEnrollmentsCount = Sqflite.firstIntValue(await dbClient.rawQuery(
          'SELECT COUNT(*) FROM $table WHERE $program = ? AND $orgUnit = ?',
          ['$programId', '$orgUnitId']));
    } catch (e) {}
    return offlineEnrollmentsCount ?? 0;
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
