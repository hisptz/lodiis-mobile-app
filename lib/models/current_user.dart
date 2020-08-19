class CurrentUser {
  String id;
  String name;
  String username;
  String password;
  bool isLogin;
  List<String> userOrgUnitIds;
  List<String> programs;

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
}
