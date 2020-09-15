import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/organization_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganizationUnitProgramOfflineProvider extends OfflineDbProvider {
  Database _db;
  String id = 'id';
  String organizationId = 'organiationId';

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
        "CREATE TABLE IF NOT EXISTS  ${OrganizationUnits.organizationTrogramTable} ($id TEXT , $organizationId TEXT,PRIMARY KEY ($id ,$organizationId))");
  }

  addOrUpdateProgramOrganizationUnits(
      OrganizationUnits organizationUnit) async {
    var dbClient = await db;

    for (id in organizationUnit.program) {
      var map = Map<String, dynamic>();
      map['id'] = id;
      map['organiationId'] = organizationUnit.id;

      await dbClient.insert(OrganizationUnits.organizationTrogramTable, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  deleteOrganization(String organizationUnitId) async {
    var dbClient = await db;
    return await dbClient.delete(OrganizationUnits.organizationTrogramTable,
        where: '$organizationId = ?', whereArgs: [organizationUnitId]);
  }

  Future<List> getProgramOrganisationUnits(String organizationUnitId) async {
    List programOrganisationUnits = [];

    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(OrganizationUnits.organizationTrogramTable, columns: [
      id,
      organizationId,
    ]);
    if (maps.isNotEmpty) {
      for (Map map in maps) {
        if (map['organiationId'] == organizationUnitId) {
          programOrganisationUnits.add(map['id']);
        }
      }
    }

    return programOrganisationUnits;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
