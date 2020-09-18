import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class CurrentUserService extends StatefulWidget {
  @override
  CurrentUserServiceState createState() => CurrentUserServiceState();

}

class CurrentUserServiceState extends State<CurrentUserService> {
  // ignore: non_constant_identifier_names
  List current_User_organisationId = [];
  List<OrganisationUnit> organisations = [];

  @override
  void initState() {
    super.initState();
    getOrganizationId()
        .then((_) => {getCompleteCurrentUser()});
  }

  getOrganizationId() async {
    CurrentUser user = await UserService().getCurrentUser();

    current_User_organisationId = user.userOrgUnitIds;
    (context as Element).markNeedsBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

 List getCompleteCurrentUser() {
    return current_User_organisationId;
  }
}
