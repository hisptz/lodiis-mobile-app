import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_unit_path_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class OrganisationUnitService {
  List<OrganisationUnit> organisations = [];
  Future<dynamic> discoveringOrgananisationUnitsFromTheServer() async {
    List<OrganisationUnit> organisationUnitList = [];
    var url = "api/organisationUnits.json";
    var queryParameters = {
      "fields": "id,name,code,programs,parent[id,code],level,path,children[id]",
      "paging": "false"
    };
    CurrentUser user = await UserService().getCurrentUser();
    HttpService http = HttpService(
      username: user.username,
      password: user.password,
    );
    var response = await http.httpGet(
      url,
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      for (var organisation in responseData["organisationUnits"]) {
        organisationUnitList.add(OrganisationUnit.fromJson(organisation));
      }
      setOrganisationUnits(organisationUnitList);
    } else {
      return null;
    }
  }

  setOrganisationUnits(List<OrganisationUnit> organisationUnit) async {
    await OrganisationUnitOffline()
        .addOrUpdateOrganisationUnits(organisationUnit);
  }

  Future<List<OrganisationUnit>> getOrganisationUnits(
      List organisationUnitids) async {
    return await OrganisationUnitOffline()
        .getOrganisationUnitById(organisationUnitids);
  }

  Future<List<String>> getOrganisationUnitsInPathByOrganisationUnit(
    String organisationUnitId,
  ) async {
    return await OrganisationUnitPathOfflineProvider()
        .getOrganisationUnitsInPathByOrganisationUnit(organisationUnitId);
  }
}
