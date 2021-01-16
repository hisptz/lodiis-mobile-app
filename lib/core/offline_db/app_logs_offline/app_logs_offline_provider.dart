import 'package:kb_mobile_app/core/constants/app_logs.dart';
import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/app_logs.dart';
import 'package:sqflite/sqflite.dart';

class AppLogsOfflineProvider extends OfflineDbProvider {
  final String table = 'app_logs';
  // columns
  final String id = 'id';
  final String type = 'type';
  final String message = 'message';
  final String date = 'date';

  Future<void> addLogs(AppLogs logData) async {
    var dbClient = await db;
    Map data = AppLogs().toOffline(logData);
    try {
      await dbClient.insert(table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<AppLogs>> getLogs({int page}) async {
    List<AppLogs> logs = [];

    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [
          id,
          type,
          date,
          message,
        ],
        limit: page != null ? AppLogsConstants.logsPagnationLimit : null,
        offset:
            page != null ? page * AppLogsConstants.logsPagnationLimit : null,
        orderBy: '$date DESC',
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          AppLogs log = AppLogs.fromOffline(map);
          logs.add(log);
        }
      }
    } catch (e) {}

    return logs..sort((b, a) => a.date.compareTo(b.date));
  }

  Future<int> getAppLogsCount() async {
    List<Map> appLogs = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(table, columns: [id]);
      appLogs.addAll(maps);
    } catch (e) {}

    return appLogs.length;
  }
}
