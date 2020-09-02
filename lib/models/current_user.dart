class CurrentUser {
  String id;
  String name;
  String username;
  String password;
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
    this.userOrgUnitIds,
    this.programs,
  });

  bool isCUrrentUserSet() {
    return username != null &&
        username.isNotEmpty &&
        password != null &&
        password.isNotEmpty;
  }

  @override
  String toString() {
    return 'Curremt user is $username $id $name';
  }

  factory CurrentUser.fromJson(dynamic json, String username, String password) {
    List programList = json['programs'] as List<dynamic>;
    List organisationUnitList = json['organisationUnits'] as List<dynamic>;
    List userOrgUnitIds = [];
    for (var organisationUnit in organisationUnitList) {
      userOrgUnitIds.add(organisationUnit['id']);
    }
    return CurrentUser(
        name: json['name'],
        id: json['id'],
        password: password,
        username: username,
        isLogin: true,
        programs: programList.map((program) => '$program').toList(),
        userOrgUnitIds: userOrgUnitIds);
  }
}
