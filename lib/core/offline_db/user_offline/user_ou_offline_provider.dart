import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserOuOfflineProvider extends OfflineDbProvider {
  Database _db;
  // columns
  String id = 'id';
  String userId = 'userId';
String ID = 'id';
 String name = 'name';
 String parent = 'parent';
//list stored as text
 String children = 'children';
 String program = 'program';
 static const String TABLE = 'organizations';


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
        "CREATE TABLE IF NOT EXISTS ${CurrentUser.userOrganisatonUnitTable} ($id TEXT PRIMARY KEY, $userId TEXT)";
    await db.execute(createTableQuery);

        await db.execute(
        "CREATE TABLE  $TABLE ($ID TEXT PRIMARY KEY, $name TEXT, $parent TEXT,$program TEXT,$children TEXT)");
  
  }

  addOrUpdateUserOrganisationUnits(CurrentUser user) async {
    var dbClient = await db;
    for (id in user.userOrgUnitIds) {
      var data = Map<String, dynamic>();
      data['id'] = id;
      data['userId'] = user.id;
      await dbClient.insert(CurrentUser.userOrganisatonUnitTable, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  deleteUserOrganisationUnits(String userId) async {
    var dbClient = await db;
    return await dbClient.delete(CurrentUser.userProgramTable,
        where: '$id = ?', whereArgs: [userId]);
  }

  Future<List> getUserOrganisationUnits(String currentUserId) async {
    List userOrganisationUnits = [];
    try {
      var dbClient = await db;
      List<Map> maps =
          await dbClient.query(CurrentUser.userOrganisatonUnitTable, columns: [
        id,
        userId,
      ]);
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          if (map['userId'] == currentUserId) {
            userOrganisationUnits.add(map['id']);
          }
        }
      }
    } catch (e) {
      print(e);
    }
    return userOrganisationUnits;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
