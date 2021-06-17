class CurrentUser {
  String id;
  String name;
  String username;
  String password;
  String implementingPartner;
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
    return 'Curremt user is $username $id $name $implementingPartner $programs $userOrgUnitIds ';
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
    String implementingPartner = '';
    for (var attributeValue in attributeValues) {
      if (attributeValue['value'] != null)
        implementingPartner = attributeValue['value'] == 'vVMJBQvvm5D'
            ? 'PSI'
            : attributeValue['value'] == 'tmuVlsiEjUi'
                ? 'EGPAF'
                : attributeValue['value'] == 'A5VS8GCyb8t'
                    ? 'JHPIEGO'
                    : attributeValue['value'] == 'SdDDPA28oVh'
                        ? 'KB-Case Management'
                        : attributeValue['value'] == 'KixA3B2O8Rp'
                            ? 'KB-AGYW/DREAMS'
                            : attributeValue['value'] == 'NuxoYkqopE2'
                                ? 'CLO'
                                : attributeValue['value'] == 'H2CE3Iwdf7v'
                                    ? 'Super user'
                                    : attributeValue['value'] == 'RoLA6GyxTlS'
                                        ? 'Paralegal'
                                        : implementingPartner;
    }
    return CurrentUser(
      name: json['name'],
      id: json['id'],
      password: password,
      username: username,
      isLogin: true,
      implementingPartner: implementingPartner,
      programs: programList.map((program) => '$program').toList(),
      userOrgUnitIds: userOrgUnitIds,
    );
  }

  Map toOffline(CurrentUser user) {
    var data = Map<String, dynamic>();
    data['id'] = user.id;
    data['name'] = user.name;
    data['username'] = user.username;
    data['password'] = user.password;
    data['isLogin'] = user.isLogin ? 1 : 0;
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
    this.userOrgUnitIds = [];
    this.programs = [];
    this.userGroups = "";
    this.userRoles = "";
  }
}
