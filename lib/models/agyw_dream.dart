import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class AgywDream {
  String firstname;
  String middlename;
  String surname;
  String age;
  String ageBand;
  String sex;
  String programStatus;
  String benefecaryId;
  String enrolledOrganisation;
  TrackeEntityInstance trackeEntityInstanceData;

  AgywDream(
      {this.firstname,
      this.middlename,
      this.surname,
      this.age,
      this.ageBand,
      this.benefecaryId,
      this.sex,
      this.programStatus,
      this.enrolledOrganisation,
      this.trackeEntityInstanceData});
  AgywDream fromTrackeEntityInstanceDataModel(
      TrackeEntityInstance trackeEntityInstance,
      String orgUnit,
      String status) {
    List keys = [
      "WTZ7GLTrE8Q",
      "s1HaiT6OllL",
      "rSP9c21JsfC",
      "qZP982qpSPS",
      "PN92g65TkVI",
      "vIX4GTSCX4P"
    ];
    Map data = Map();
    for (Map detailObj in trackeEntityInstance.attributes) {
      String attribute = detailObj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }

    int age = AppUtil.getAgeInYear(data["qZP982qpSPS"]);
    print(agywAgeBand(age));
    return AgywDream(
      firstname: data["WTZ7GLTrE8Q"],
      middlename: data["s1HaiT6OllL"],
      surname: data["rSP9c21JsfC"],
      age: age.toString(),
      ageBand: agywAgeBand(age) ?? "",
      benefecaryId: trackeEntityInstance.trackedEntityInstance,
      sex: data["vIX4GTSCX4P"]??'',
      programStatus: status ?? "",
      enrolledOrganisation: orgUnit,
      trackeEntityInstanceData: trackeEntityInstance,
    );
  }

//method to return age band
  String agywAgeBand(int age) {
    String ageBand = '';
    if (age < 15 && age > 8) return ageBand = "09-14";
    if (age < 20 && age > 14) return ageBand = "15-19";
    if (age < 25 && age > 19) return ageBand = "20-24";
    return ageBand;
  }

  @override
  String toString() {
    return "$firstname $surname";
  }
}
