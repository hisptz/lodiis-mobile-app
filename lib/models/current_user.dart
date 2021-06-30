import 'package:kb_mobile_app/core/constants/current_user_contants.dart';

class CurrentUser {
  String id;
  String name;
  String username;
  String password;
  String implementingPartner;
  String subImplementingPartner;
  String userRoles;
  String userGroups;
  bool isLogin;
  List userOrgUnitIds;
  List programs;

  static final String userTable = 'current_user';
  static final String userProgramTable = 'current_user_program';
  static final String userOrganisatonUnitTable = 'current_user_ou';

  CurrentUser({
    this.id,
    this.name,
    this.username,
    this.password,
    this.isLogin,
    this.implementingPartner,
    this.subImplementingPartner,
    this.userOrgUnitIds,
    this.programs,
    this.userRoles,
    this.userGroups,
  }) {
    this.userOrgUnitIds = this.userOrgUnitIds ?? [];
    this.programs = this.programs ?? [];
    this.userRoles = this.userRoles ?? "";
    this.userGroups = this.userGroups ?? "";
  }

  bool isCurrentUserSet() {
    return username != null &&
        username.isNotEmpty &&
        password != null &&
        password.isNotEmpty;
  }

  @override
  String toString() {
    return 'Curremt user is $username $id $name $implementingPartner->$subImplementingPartner $programs $userOrgUnitIds ';
  }

  factory CurrentUser.fromJson(
    dynamic json,
    String username,
    String password,
  ) {
    //@TODO getting user groups and user roles
    // userGroups[name],userCredentials[userRoles[name]]
    List programList = json['programs'] as List<dynamic>;
    List organisationUnitList = json['organisationUnits'] as List<dynamic>;
    List userOrgUnitIds = [];
    for (var organisationUnit in organisationUnitList) {
      userOrgUnitIds.add(organisationUnit['id']);
    }
    List attributeValues = json['attributeValues'] as List<dynamic>;
    String subImplementingPartner =
        getCurrentUserSuImplementingPartner(attributeValues);
    String implementingPartner =
        getCurrentUserImplementingPartner(attributeValues);
    return CurrentUser(
      name: json['name'],
      id: json['id'],
      password: password,
      username: username,
      isLogin: true,
      subImplementingPartner: subImplementingPartner,
      implementingPartner: implementingPartner,
      programs: programList.map((program) => '$program').toList(),
      userOrgUnitIds: userOrgUnitIds,
    );
  }

  static String getCurrentUserRoles() {
    return "";
  }

  static String getCurrentUserGroups() {
    return "";
  }

  static String getCurrentUserSuImplementingPartner(
    List<dynamic> attributeValues,
  ) {
    String subImplementingPartner = '';
    for (var attributeValue in attributeValues) {
      if (attributeValue['value'] != null &&
          attributeValue['attribute'] != null) {
        Map attribute = attributeValue['attribute'];
        String attributeId = attribute["id"] ?? "";
        if (attributeId ==
            CurrentUserImplementingPartner.subImplementingPartnerAttribute) {
          subImplementingPartner = CurrentUserImplementingPartner
              .getCurrentUserSubImplementingPartner(attributeValue['value']);
        }
      }
    }
    return subImplementingPartner;
  }

  static String getCurrentUserImplementingPartner(
    List<dynamic> attributeValues,
  ) {
    String implementingPartner = '';
    for (var attributeValue in attributeValues) {
      if (attributeValue['value'] != null &&
          attributeValue['attribute'] != null) {
        Map attribute = attributeValue['attribute'];
        String attributeId = attribute["id"] ?? "";
        if (attributeId ==
            CurrentUserImplementingPartner.implementPartnerAttribute) {
          implementingPartner =
              CurrentUserImplementingPartner.getCurrentUserImplementingPartner(
                  attributeValue['value']);
        }
      }
    }
    return implementingPartner;
  }

  Map toOffline(CurrentUser user) {
    var data = Map<String, dynamic>();
    data['id'] = user.id;
    data['name'] = user.name;
    data['username'] = user.username;
    data['password'] = user.password;
    data['isLogin'] = user.isLogin ? 1 : 0;
    data['subImplementingPartner'] = user.subImplementingPartner;
    data['implementingPartner'] = user.implementingPartner;
    return data;
  }

  CurrentUser.fromOffline(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.name = mapData['name'];
    this.username = mapData['username'];
    this.password = mapData['password'];
    this.isLogin = '${mapData['isLogin']}' == '1';
    this.implementingPartner = mapData['implementingPartner'];
    this.subImplementingPartner = mapData['subImplementingPartner'];
    this.userOrgUnitIds = [];
    this.programs = [];
    this.userGroups = "";
    this.userRoles = "";
  }
}
