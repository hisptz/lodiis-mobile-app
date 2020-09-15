import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/services/organization_unit_service.dart';
import 'package:kb_mobile_app/models/Organization_unit.dart';
import 'package:kb_mobile_app/models/organization_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganizationUnitChildrenOfflineProvider extends OfflineDbProvider {


  Database _db;
  String id = 'id';
  String organizationId = 'organiationId';
  

  //table name
  static const String TABLE = 'organization_unit_children';


  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      this._onCreate(_db, version);
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
        "CREATE TABLE IF NOT EXISTS  $TABLE ($id TEXT , $organizationId TEXT,PRIMARY KEY ($id ,$organizationId))");
        //

  }

  addOrUpdateChildrenOrganizationUnits(OrganizationUnits organizationUnit) async {


    var dbClient = await db;
  
     for (id in organizationUnit.children) {

      var map = Map<String, dynamic>();
      map['id'] = id;
      map['organiationId'] = organizationUnit.id;

      await dbClient.insert(TABLE, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

          
  
  }

   deleteOrganizationChildren(String childrenId) async {
    var dbClient = await db;
    return await dbClient
        .delete(TABLE, where: '$id = ?', whereArgs: [childrenId]);
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
