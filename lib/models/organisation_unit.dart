class OrganisationUnit {
  String id;
  String parent;
  String name;
  int level;
  List program;
  List children;
  //tables for organisations Units
  static const String organisationProgramTable = 'organisation_unit_program';
  static const String organisationChildrenTable = 'organisation_unit_children';
  static const String organisationUnitTable = 'organisation_unit';

  OrganisationUnit(
      {this.id,
      this.name,
      this.parent,
      this.level,
      this.program,
      this.children});

  factory OrganisationUnit.fromJson(Map<String, dynamic> json) {
    List programList = json["programs"] as List<dynamic>;
    List childrenList = json["children"] as List<dynamic>;

    List<String> programs = [];
    List<String> childrens = [];
    for (var program in programList) {
      programs.add(program['id']);
    }

    for (var children in childrenList) {
      childrens.add(children['id']);
    }

    return OrganisationUnit(
        id: json["id"],
        parent: json["id"],
        name: json["name"],
        level: json["level"],
        program: programs,
        children: childrens);
  }

  Map toOffline(OrganisationUnit organisationUnit) {
    var map = Map<String, dynamic>();
    map['id'] = organisationUnit.id;
    map['name'] = organisationUnit.name;
    map['parent'] = organisationUnit.parent;
    map["level"] = organisationUnit.level;

    return map;
  }

  OrganisationUnit.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.parent = map['parent'];
    this.level = map["level"];
    this.children = [];
    this.program = [];
  }

  @override
  String toString() {
    return 'name : $name, id : $id';
  }
}
