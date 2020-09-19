import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/offline_db/organisation_unit_offline/organisation_unit_offline_provider.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/components/organisation_component.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class OrganisationUnitPopUpMenu extends StatefulWidget {
  @override
  _OrganisationUnitPopUpMenuState createState() =>
      _OrganisationUnitPopUpMenuState();
}

class _OrganisationUnitPopUpMenuState extends State<OrganisationUnitPopUpMenu> {
  // ignore: non_constant_identifier_names
  List current_User_organisationId = [];
  List<OrganisationUnit> organisations = [];

  @override
  void initState() {
    super.initState();
   getOrganizationId()
        .then((_) => {getCompleteOrganizationUnitOfCurrentUser()});
  
  }

   

  getOrganizationId() async {
    CurrentUser user = await UserService().getCurrentUser();

    current_User_organisationId = user.userOrgUnitIds;
    (context as Element).markNeedsBuild();
  }

  

  getCompleteOrganizationUnitOfCurrentUser() {
    for (var organisationId in current_User_organisationId) {
      OrganisationUnitOffline()
          .getOrganisationUnitById(organisationId)
          .then((value) => {
                value.forEach((organisation) {
                  organisations.add(organisation);
                })
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(right: 0, top: 2),
        child: ListView.builder(
            dragStartBehavior: DragStartBehavior.start,
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: organisations.length,
            itemBuilder: (context, index) {
              return ExpandedOrganisationWidgets(
                organisationUnit: organisations[index],
              );
            }),
      ),
    );
  }
}
