import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganisationUnitChildrenOfflineProvider extends OfflineDbProvider {
  Database _db;
  String id = 'id';
  String organisationId = 'organisationId';

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
        "CREATE TABLE IF NOT EXISTS  ${OrganisationUnits.organisationChildrenTable} ($id TEXT , $organisationId TEXT,PRIMARY KEY ($id ,$organisationId))");
  }

  addOrUpdateChildrenOrganisationUnits(
      OrganisationUnits organisationUnit) async {
    var dbClient = await db;
    for (id in organisationUnit.children) {
      var map = Map<String, dynamic>();
      map['id'] = id;
      map['organisationId'] = organisationUnit.id;
      await dbClient.insert(OrganisationUnits.organisationChildrenTable, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  deleteOrganisationChildren(String organisationUnitId) async {
    var dbClient = await db;
    return await dbClient.delete(OrganisationUnits.organisationChildrenTable,
        where: '$organisationId = ?', whereArgs: [organisationUnitId]);
  }

  Future<List> getChildrenOrganisationUnits(String organisationUnitId) async {
    List childrenOrganisationUnits = [];

    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(OrganisationUnits.organisationTrogramTable, columns: [
      id,
      organisationId,
    ]);
    if (maps.isNotEmpty) {
      for (Map map in maps) {
        if (map['organisationId'] == organisationUnitId) {
          childrenOrganisationUnits.add(map['id']);
        }
      }
    }

    return childrenOrganisationUnits;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

