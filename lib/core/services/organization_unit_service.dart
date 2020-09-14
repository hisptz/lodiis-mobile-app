import 'dart:convert';
import 'package:kb_mobile_app/core/offline_db/organization_unit_offline/organization_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/services/http_service.dart';
import 'package:kb_mobile_app/models/Organization_unit.dart';

class OrganizationUnitService {
  List<OrganizationUnit> organizationUnitList = [];
  Future<dynamic> organizationUnit() async {
    var url =
        "api/organisationUnits.json?fields=id,name,programs,parent[id],children[id]&paging=false";
    HttpService http = HttpService(username: "admin", password: "district");

    var response = await http.httpGet(url);

    //
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      for (int i = 0; i < responseData["organisationUnits"].length; i++) {
        print((responseData["organisationUnits"][i]));
        organizationUnitList.add(
            OrganizationUnit.fromJson(responseData["organisationUnits"][i]));
      }

      setOrganizationUnit(organizationUnitList);
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
    return organizationUnitList;
  }
}
