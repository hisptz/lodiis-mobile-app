import 'package:kb_mobile_app/core/offline_db/offline_db_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_children_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_program_offline_provider.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:sqflite/sqflite.dart';

class OrganisationUnitOffline extends OfflineDbProvider {
  //columns
  String id = 'id';
  String name = 'name';
  String parent = 'parent';
  String level = 'level';

  addOrUpdateOrganisationUnits(List<OrganisationUnit> organisationUnits) async {
    var dbClient = await db;
    for (OrganisationUnit organisationUnit in organisationUnits) {
      await dbClient.insert(OrganisationUnit.organisationUnitTable,
          organisationUnit.toOffline(organisationUnit),
          conflictAlgorithm: ConflictAlgorithm.replace);
      await OrganisationUnitChildrenOfflineProvider()
          .addOrUpdateChildrenOrganisationUnits(organisationUnit);
      await OrganisationUnitProgramOfflineProvider()
          .addOrUpdateProgramOrganisationUnits(organisationUnit);
    }
  }

  deleteOrganisation(String organisationId) async {
    var dbClient = await db;
    return await dbClient.delete(OrganisationUnit.organisationUnitTable,
        where: '$id = ?', whereArgs: [organisationId]);
  }

  Future<List<OrganisationUnit>> getOrganisationUnits() async {
    List<OrganisationUnit> organisationUnitList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        OrganisationUnit.organisationUnitTable,
        columns: [id, name, parent, level],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          String organizationUnitId = map['id'];
          List childrens = await OrganisationUnitChildrenOfflineProvider()
              .getChildrenOrganisationUnits(organizationUnitId);
          List programs = await OrganisationUnitProgramOfflineProvider()
              .getProgramOrganisationUnits(organizationUnitId);
          OrganisationUnit organisationUnits =
              OrganisationUnit.fromOffline(map);
          organisationUnits.program = programs;
          organisationUnits.children = childrens;
          organisationUnitList.add(organisationUnits);
        }
      }
    } catch (e) {}
    return organisationUnitList;
  }

  Future<List<OrganisationUnit>> getOrganisationUnitById(
      List organisationIds) async {
    List<OrganisationUnit> organisationUnitList = [];
    try {
      var dbClient = await db;
      String questionMark = organisationIds.map((e) => '?').toList().join(',');
      List<Map> maps = await dbClient.query(
          OrganisationUnit.organisationUnitTable,
          columns: [id, name, parent, level],
          orderBy: name,
          where: '$id IN ($questionMark)',
          whereArgs: organisationIds);
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          String organizationUnitId = map['id'];
          List childrens = await OrganisationUnitChildrenOfflineProvider()
              .getChildrenOrganisationUnits(organizationUnitId);
          List programs = await OrganisationUnitProgramOfflineProvider()
              .getProgramOrganisationUnits(organizationUnitId);
          OrganisationUnit organisationUnits =
              OrganisationUnit.fromOffline(map);
          organisationUnits.program = programs;
          organisationUnits.children = childrens;
          organisationUnitList.add(organisationUnits);
        }
      }
    } catch (e) {}
    organisationUnitList.sort((a, b) => a.name.compareTo(b.name));
    return organisationUnitList;
  }
}
