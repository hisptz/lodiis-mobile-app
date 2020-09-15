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

  bool isCurrentUserSet() {
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

  Map toOffline(CurrentUser user) {
    var data = Map<String, dynamic>();
    data['id'] = user.id;
    data['name'] = user.name;
    data['username'] = user.username;
    data['password'] = user.password;
    data['isLogin'] = user.isLogin ? 1 : 0;
    return data;
  }


  CurrentUser.fromOffline(Map<String, dynamic> mapData) {
    this.id = mapData['id'];
    this.name = mapData['name'];
    this.username = mapData['username'];
    this.password = mapData['password'];
    this.isLogin = '${mapData['isLogin']}' == '1';
    this.userOrgUnitIds = [];
    this.programs = [];
  }

  




}
