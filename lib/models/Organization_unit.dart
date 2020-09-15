import 'dart:convert';



class OrganizationUnit {
  String id;
  String parent;
  String name;
  String program;
  String  children;
  List idList = [];

  OrganizationUnit(
      {this.id, this.parent, this.name, this.program, this.children});

  factory OrganizationUnit.fromJson(Map<String, dynamic> json) {
    List programList = json['programs'] as List<dynamic>;
    List childrenList = json['children'] as List<dynamic>;

    List<String> programs = [];
    List<String> childrens = [];
    for (var program in programList) {
      programs.add(program['id']);
    }

    for (var children in childrenList) {
      childrens.add(children['id']);
    }

    return OrganizationUnit(
        id: json["id"],
        parent: json["id"],
        name: json["name"],
        program: jsonEncode(programs),
        children: jsonEncode(childrens));
  }

 

  Map toOffline(OrganizationUnit organizationUnit) {
    
    var data = Map<String, dynamic>();
    data["id"] = organizationUnit.id;
    data["name"] = organizationUnit.name;
    data["parent"] = organizationUnit.parent;
    data["program"] = organizationUnit.program;
    data["children"] = organizationUnit.children;

    return data;
  }

  Map<String, dynamic> toMap() {
    print("in map");
    var map = <String, dynamic>{
      "id": id,
      "parent": parent,
      "name": name,
      "program": program.toString(),
      "children": children.toString()
    };
    return map;
  }

  // OrganizationUnit.fromMap(Map<String, dynamic> map) {
  //   id = map["id"];
  //   level = map["level"];
  //   name = map["name"];
  //   program = map["program"];
  //   children = map["children"];
  // }
}
