class OrganizationUnits {
  String id;
  String parent;
  String name;
  List program;
  List children;
  //tables for organzations Units
  static const String organizationTrogramTable = 'organization_unit_program';
  static const String organizationChildrenTable = 'organization_unit_children';
  static const String organizationUnitTable = 'organizations';

  OrganizationUnits(
      {this.id, this.name, this.parent, this.program, this.children});

  factory OrganizationUnits.fromJson(Map<String, dynamic> json) {
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

    return OrganizationUnits(
        id: json["id"],
        parent: json["id"],
        name: json["name"],
        program: programs,
        children: childrens);
  }

  Map toOffline(OrganizationUnits organizationUnit) {
    var map = Map<String, dynamic>();
    map['id'] = organizationUnit.id;
    map['name'] = organizationUnit.name;
    map['parent'] = organizationUnit.parent;

    return map;
  }

  OrganizationUnits.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.parent = map['parent'];
    this.children = [];
    this.program = [];
  }
}
