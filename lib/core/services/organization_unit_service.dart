import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/organization_unit_offline/organization_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/organization_unit.dart';

class OrganizationUnitService {
  List<OrganizationUnits> organizationUnitList = [];
  Future<dynamic> organizationUnitGetRequest() async {
    var url =
        "api/organisationUnits.json?fields=id,name,programs,parent[id],children[id]&paging=false";
    CurrentUser user = await UserService().getCurrentUser();
    HttpService http =
        HttpService(username: user.username, password: user.password);

    var response = await http.httpGet(url);

    //check status code
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      for (var organization in responseData["organisationUnits"]) {
        organizationUnitList.add(OrganizationUnits.fromJson(organization));
      }
      setOrganizationUnits(organizationUnitList);
    } else {
      return null;
    }
  }

  setOrganizationUnits(List<OrganizationUnits> organizationUnit) async {
    await OrganizationUnitOffline()
        .addOrUpdateOrganizationUnits(organizationUnit);
  }

  List<OrganizationUnits> get organizationList {
      return organizationUnitList;
  }
}
