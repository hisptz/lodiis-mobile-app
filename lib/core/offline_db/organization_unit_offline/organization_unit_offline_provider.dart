import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/services/organization_unit_service.dart';
import 'package:kb_mobile_app/models/Organization_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganizationUnitOffline extends OfflineDbProvider {
 Database _db;
 String id = 'id';
 String name = 'name';
 String parent = 'parent';
//list stored as text
 String children = 'children';
 String program = 'program';

  //table name
  static const String TABLE = 'organizations';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, "$databaseName.db");
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE  $TABLE ($id TEXT PRIMARY KEY, $name TEXT, $parent TEXT,$program TEXT,$children TEXT)");
  }

  addOrUpdateOrganizationUnits(List<OrganizationUnit> organizationUnit) async {
    final dbClient = await db;
    String sql = "INSERT INTO $TABLE " +
        "(id,name,parent,children,program) VALUES (?,?,?,?,?)";
    if (organizationUnit.length < 0) {
      return null;
    } else {
      for (int index = 0; index < organizationUnit.length; index++) {
        dbClient.execute(sql, [
          organizationUnit[index].id,
          organizationUnit[index].name,
          organizationUnit[index].parent,
          organizationUnit[index].children,
          organizationUnit[index].program
        ]);
      }

      return true;
    }
  }

  Future<dynamic> getOrganizationUnit() async {
    // ignore: await_only_futures
    final _db = await db;

    var res = await _db.query("$TABLE");
    if (res.length < 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : null;
    }
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
