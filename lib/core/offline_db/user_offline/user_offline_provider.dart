import 'dart:async';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_ou_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/user_offline/user_program_offline_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/current_user.dart';

class UserOfflineProvider extends OfflineDbProvider {
  Database _db;

  // columns
  String id = 'id';
  String name = 'name';
  String username = 'username';
  String password = 'password';
  String isLogin = 'isLogin';

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
        "CREATE TABLE IF NOT EXISTS ${CurrentUser.userTable} ($id TEXT PRIMARY KEY, $name TEXT, $username TEXT, $password TEXT ,$isLogin INTEGER)";
    await db.execute(createTableQuery);
  }

  addOrUpdateUser(CurrentUser user) async {
    var dbClient = await db;
    await dbClient.insert(CurrentUser.userTable, user.toOffline(user),
        conflictAlgorithm: ConflictAlgorithm.replace);
    await UserOuOfflineProvider().addOrUpdateUserOrganisationUnits(user);
    await UserProgramOfflineProvider().addOrUpdateUserPrograms(user);
  }

  deleteUser(String userId) async {
    var dbClient = await db;
    return await dbClient
        .delete(CurrentUser.userTable, where: '$id = ?', whereArgs: [userId]);
  }

  Future<List<CurrentUser>> getUsers() async {
    List<CurrentUser> users = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        CurrentUser.userTable,
        columns: [
          id,
          name,
          username,
          password,
          isLogin,
        ],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          String userId = map['id'];
          List userOrgUnitIds =
              await UserOuOfflineProvider().getUserOrganisationUnits(userId);
          List programs =
              await UserProgramOfflineProvider().getUserPrograms(userId);
          CurrentUser user = CurrentUser.fromOffline(map);
          user.programs = programs;
          user.userOrgUnitIds = userOrgUnitIds;
          users.add(user);
        }
      }
    } catch (e) {
      print('eror : e');
    }
    return users;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
