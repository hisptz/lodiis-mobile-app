import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganisationUnitProgramOfflineProvider extends OfflineDbProvider {
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
        "CREATE TABLE IF NOT EXISTS  ${OrganisationUnit.organisationTrogramTable} ($id TEXT , $organisationId TEXT,PRIMARY KEY ($id ,$organisationId))");
  }

  addOrUpdateProgramOrganisationUnits(
      OrganisationUnit organisationUnit) async {
    var dbClient = await db;

    for (id in organisationUnit.program) {
      var map = Map<String, dynamic>();
      map['id'] = id;
      map['organizationId'] = organisationUnit.id;

      await dbClient.insert(OrganisationUnit.organisationTrogramTable, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  deleteOrganisation(String organisationUnitId) async {
    var dbClient = await db;
    return await dbClient.delete(OrganisationUnit.organisationTrogramTable,
        where: '$organisationId = ?', whereArgs: [organisationUnitId]);
  }

  Future<List> getProgramOrganisationUnits(String organisationUnitId) async {
    List programOrganisationUnits = [];

    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(OrganisationUnit.organisationTrogramTable, columns: [
      id,
      organisationId,
    ]);
    if (maps.isNotEmpty) {
      for (Map map in maps) {
        if (map['organisationId'] == organisationUnitId) {
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
