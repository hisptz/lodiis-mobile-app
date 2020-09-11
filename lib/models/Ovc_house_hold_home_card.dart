import 'package:kb_mobile_app/models/Ovc_children.dart';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class OvcHouseHold {
  String id;
  String name;
  String date;
  String location;
  String numberOvc;

  List<OvcChildren> ovcChildren;

  OvcHouseHold(
      {this.id,
      this.name,
      this.date,
      this.location,
      this.numberOvc,
      this.ovcChildren});

  static List<OvcHouseHold> defaultOvcHouseHold = [
    OvcHouseHold(
        id: generateId(),
        name: "Lenka Mosela",
        date: generateDate(),
        location: "Berena",
        numberOvc: "Female-2" + ":" 'Male-1', ovcChildren: OvcChildren.defaultOvcChildrens),
    OvcHouseHold(
        id: generateId(),
        name: "Atile Nthabiseng",
        date: generateDate(),
        location: "Berena",
        numberOvc: "Female-2" + ":" 'Male-1', ovcChildren: OvcChildren.defaultOvcChildrens),
    OvcHouseHold(
        id: generateId(),
        name: "Mosa Thabiso",
        date: generateDate(),
        location: "Berena",
        numberOvc: "Female-2" + ":" 'Male-1', ovcChildren: OvcChildren.defaultOvcChildrens),
  ];

  static generateId() {
    return (Uuid().v4()).substring(27);
  }

  static generateDate() {
    String formattedDate = DateFormat("EEE d MMM").format(DateTime.now());

    return formattedDate;
  }
}
