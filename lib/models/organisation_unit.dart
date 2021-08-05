class OrganisationUnit {
  String id;
  String parent;
  String name;
  String code;
  String path;
  int level;
  List program;
  List children;
  //tables for organisations Units
  static const String organisationProgramTable = 'organisation_unit_program';
  static const String organisationChildrenTable = 'organisation_unit_children';
  static const String organisationUnitTable = 'organisation_unit';

  OrganisationUnit({
    this.id,
    this.name,
    this.parent,
    this.level,
    this.code,
    this.program,
    this.children,
    this.path,
  }) {
    this.children = this.children ?? [];
    this.program = this.program ?? [];
    this.path = this.path ?? "";
  }

  factory OrganisationUnit.fromJson(Map<String, dynamic> json) {
    List programList = json["programs"] as List<dynamic>;
    List childrenList = json["children"] as List<dynamic>;
    dynamic parentObj = json["parent"];
    List<String> programs = [];
    List<String> children = [];
    for (var program in programList) {
      if (program['id'] != null) {
        programs.add(program['id']);
      }
    }
    for (var child in childrenList) {
      if (child['id'] != null) {
        children.add(child['id']);
      }
    }
    return OrganisationUnit(
        id: json["id"],
        parent:
            parentObj != null && parentObj['id'] != null ? parentObj['id'] : '',
        name: json["name"],
        level: json["level"],
        path: json["path"],
        code: json['code'] != null
            ? json['code']
            : parentObj != null && parentObj['code'] != null
                ? parentObj['code']
                : '',
        program: programs,
        children: children);
  }
  Map toOffline(OrganisationUnit organisationUnit) {
    var map = Map<String, dynamic>();
    map['id'] = organisationUnit.id;
    map['name'] = organisationUnit.name;
    map['code'] = organisationUnit.code;
    map['parent'] = organisationUnit.parent;
    map["level"] = organisationUnit.level;
    return map;
  }

  OrganisationUnit.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.parent = map['parent'];
    this.level = map["level"];
    this.code = map["code"];
    this.children = [];
    this.program = [];
    this.path = "";
  }

  @override
  String toString() {
    return 'name : $name, id : $id';
  }
}
