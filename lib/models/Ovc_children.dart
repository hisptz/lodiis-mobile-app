import 'package:flutter/foundation.dart';

class OvcChildren {
  int id;
  String name;
  String sex;
  int age;

  OvcChildren(
      {@required this.id,
      @required this.name,
      @required this.sex,
      @required this.age});

  static List<OvcChildren> defaultOvcChildrens = [
   OvcChildren(id: 1, name: "Tebello Tamatla", sex: "female", age: 10),
   OvcChildren(id: 2 ,name: "Pula Tihokomelo", sex: "male", age: 9),
   OvcChildren(id: 3, name: "Bertha Nyakallo", sex: "female", age: 7)
  ];
}
