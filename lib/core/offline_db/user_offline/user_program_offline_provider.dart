import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserProgramOfflineProvider extends OfflineDbProvider {
  Database _db;
  // columns
  String id = 'id';
  String userId = 'userId';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    this._onCreate(_db, version);
    return _db;
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$databaseName.db');
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String createTableQuery =
        "CREATE TABLE IF NOT EXISTS ${CurrentUser.userProgramTable} ($id TEXT PRIMARY KEY, $userId TEXT)";
    await db.execute(createTableQuery);
  }

  addOrUpdateUserPrograms(CurrentUser user) async {
    var dbClient = await db;
    for (id in user.programs) {
      var data = Map<String, dynamic>();
      data['id'] = id;
      data['userId'] = user.id;
      await dbClient.insert(CurrentUser.userProgramTable, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  deleteUserPrograms(String userId) async {
    var dbClient = await db;
    return await dbClient.delete(CurrentUser.userProgramTable,
        where: '$id = ?', whereArgs: [userId]);
  }

  Future<List> getUserPrograms(String currentUserId) async {
    List userProgramIds = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient
          .query(CurrentUser.userProgramTable, columns: [id, userId]);
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          if (map['userId'] == currentUserId) {
            userProgramIds.add(map['id']);
          }
        }
      }
    } catch (e) {}
    return userProgramIds;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
