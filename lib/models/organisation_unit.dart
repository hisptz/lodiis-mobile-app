class OrganisationUnits {
  String id;
  String parent;
  String name;
  List program;
  List children;
  //tables for organisations Units
  static const String organisationTrogramTable = 'organisation_unit_program';
  static const String organisationChildrenTable = 'organisation_unit_children';
  static const String organisationUnitTable = 'organisations';

  OrganisationUnits(
      {this.id, this.name, this.parent, this.program, this.children});

  factory OrganisationUnits.fromJson(Map<String, dynamic> json) {
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

    return OrganisationUnits(
        id: json["id"],
        parent: json["id"],
        name: json["name"],
        program: programs,
        children: childrens);
  }

  Map toOffline(OrganisationUnits organisationUnit) {
    var map = Map<String, dynamic>();
    map['id'] = organisationUnit.id;
    map['name'] = organisationUnit.name;
    map['parent'] = organisationUnit.parent;

    return map;
  }

  OrganisationUnits.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.parent = map['parent'];
    this.children = [];
    this.program = [];
  }
}
