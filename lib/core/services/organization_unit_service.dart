import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/organization_unit_offline/organization_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/Organization_unit.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/organization_unit.dart';

class OrganizationUnitService {
  List<OrganizationUnits> organizationUnitList = [];
  Future<dynamic> organizationUnit() async {
    var url =
        "api/organisationUnits.json?fields=id,name,programs,parent[id],children[id]&paging=false";
    CurrentUser user = await UserService().getCurrentUser();
    HttpService http =
        HttpService(username: user.username, password: user.password);

    var response = await http.httpGet(url);

    //
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      for (var organization in responseData["organisationUnits"]) {
      

        organizationUnitList
            .add(OrganizationUnits.fromJson(organization));
      }
      
      // setOrganizationUnit(organizationUnitList);
    } else {
      return null;
    }
  }

  setOrganizationUnit(List<OrganizationUnit> organizationUnit) async {
    await OrganizationUnitOffline()
        .addOrUpdateOrganizationUnits(organizationUnit);
  }

  List<OrganizationUnit> get orgList {
    //test data on comming
    print(organizationUnitList);
    return null;
    //organizationUnitList;
  }
}
