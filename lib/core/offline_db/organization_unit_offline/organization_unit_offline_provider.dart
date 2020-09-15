import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organization_unit_offline/Organization_program_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organization_unit_offline/organization_children_offline_provider.dart';
import 'package:kb_mobile_app/models/organization_unit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class OrganizationUnitOffline extends OfflineDbProvider {
  Database _db;
  String id = 'id';
  String name = 'name';
  String parent = 'parent';

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
        "CREATE TABLE IF NOT EXISTS  ${OrganizationUnits.organizationUnitTable} ($id TEXT PRIMARY KEY, $name TEXT, $parent TEXT)");
  }

  addOrUpdateOrganizationUnits(List<OrganizationUnits> organizationUnit) async {
    var dbClient = await db;
    organizationUnit.forEach((organization) async {
      await dbClient.insert(OrganizationUnits.organizationUnitTable,
          organization.toOffline(organization),
          conflictAlgorithm: ConflictAlgorithm.replace);
      await OrganizationUnitChildrenOfflineProvider()
          .addOrUpdateChildrenOrganizationUnits(organization);
      await OrganizationUnitProgramOfflineProvider()
          .addOrUpdateProgramOrganizationUnits(organization);
    });
  }

  deleteOrganization(String organizationId) async {
    var dbClient = await db;
    return await dbClient.delete(OrganizationUnits.organizationUnitTable,
        where: '$id = ?', whereArgs: [organizationId]);
  }

  Future<List<OrganizationUnits>> getOrganizationUnits() async {
    List<OrganizationUnits> organizationUnitList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        OrganizationUnits.organizationUnitTable,
        columns: [
          id,
          name,
          parent,
        ],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          String organizationUnitId = map['id'];
          List childrens = await OrganizationUnitChildrenOfflineProvider()
              .getChildrenOrganisationUnits(organizationUnitId);
          List programs = await OrganizationUnitProgramOfflineProvider()
              .getProgramOrganisationUnits(organizationUnitId);
          OrganizationUnits organizationUnits =
              OrganizationUnits.fromOffline(map);
          organizationUnits.program = programs;
          organizationUnits.children = childrens;
          organizationUnitList.add(organizationUnits);
        }
      }
    } catch (e) {}
    return organizationUnitList;
  }

  close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
