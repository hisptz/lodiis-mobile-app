import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:sqflite/sqflite.dart';

class OrganisationUnitPathOfflineProvider extends OfflineDbProvider {
  // table name
  final String table = "organisation_unit_path";
  // column\
  final String id = "id";
  final String path = "path";

  addOrUpdateOrganisationUnitPath(
    OrganisationUnit organisationUnit,
  ) async {
    try {
      var dbClient = await db;
      var map = Map<String, dynamic>();
      map['id'] = organisationUnit.id;
      map['path'] = organisationUnit.path;
      await dbClient.insert(table, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error) {
      print("addOrUpdateOrganisationUnitPath : ${error.toString()}");
    }
  }

  Future<List<String>> getOrganisationUnitsInPathByOrganisationUnit(
    String organisationUnitId,
  ) async {
    List<String> organisationUnitIds = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [id, path],
      );
      if (maps.isNotEmpty) {
        List<String> paths = maps
            .map((map) => "${map[path]}")
            .toList()
            .where((path) => path.contains(organisationUnitId))
            .toList();
        for (String path in paths) {
          List<String> splittedPath = path.split("/");
          organisationUnitIds.addAll(
            splittedPath.where(
              (String path) =>
                  splittedPath.indexOf(path) >=
                  splittedPath.indexOf(organisationUnitId),
            ),
          );
        }
      }
    } catch (error) {
      print(
          "getOrganisationUnitsInPathByOrganisationUnit : ${error.toString()}");
    }
    return organisationUnitIds.toList().toSet().toList();
  }

  Future<String> getOrganiationUnitPath(String organisationUnitId) async {
    String organisationunitPath = "";
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [id, path],
        where: '$id = ?',
        whereArgs: [organisationUnitId],
      );
      if (maps.isNotEmpty) {
        organisationunitPath = maps.first["path"];
      }
    } catch (error) {
      print("getOrganiationUnitPath : ${error.toString()}");
    }
    return organisationunitPath;
  }
}
