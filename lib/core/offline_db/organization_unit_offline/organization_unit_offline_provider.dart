import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organization_unit_offline/Organization_program_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organization_unit_offline/organization_children_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organization_unit_service.dart';
import 'package:kb_mobile_app/models/Organization_unit.dart';
import 'package:kb_mobile_app/models/organization_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganizationUnitOffline extends OfflineDbProvider {
  Database _db;
  String id = 'id';
  String name = 'name';
  String parent = 'parent';

  //table name
  static const String TABLE = 'organizations';

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
        "CREATE TABLE IF NOT EXISTS  $TABLE ($id TEXT PRIMARY KEY, $name TEXT, $parent TEXT)");
  }

  addOrUpdateOrganizationUnits(List<OrganizationUnits> organizationUnit) async {
    var dbClient = await db;
    organizationUnit.forEach((organization) async {
      await dbClient.insert(TABLE, organization.toOffline(organization),
          conflictAlgorithm: ConflictAlgorithm.replace);
      await OrganizationUnitChildrenOfflineProvider()
          .addOrUpdateChildrenOrganizationUnits(organization);
      await OrganizationUnitProgramOfflineProvider()
          .addOrUpdateProgramOrganizationUnits(organization);
    });
  }
   deleteOrganization(String organizationId) async {
    var dbClient = await db;
    return await dbClient
        .delete(TABLE, where: '$id = ?', whereArgs: [organizationId]);
  }

  Future<List<OrganizationUnits>> getOrganizationUnit() async {
    // ignore: await_only_futures
    var dbClient = await db;

    dbClient.query(TABLE, columns: [id,name,parent]);

   
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
