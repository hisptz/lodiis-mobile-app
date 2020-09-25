import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcHouseHoldChild {
  String firstName;
  String middleName;
  String surname;
  String sex;
  String age;
  TrackeEntityInstance teiData;

  OvcHouseHoldChild({
    this.firstName,
    this.middleName,
    this.surname,
    this.sex,
    this.age,
    this.teiData,
  });

  OvcHouseHoldChild fromTeiModel(TrackeEntityInstance tei) {
    List keys = [
      's1eRvsL2Ly4',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'ls9hlz2tyol',
      'vIX4GTSCX4P'
    ];
    Map data = Map();
    for (Map attributOj in tei.attributes) {
      String attribute = attributOj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${attributOj['value']}'.trim() ?? '';
      }
    }
    return OvcHouseHoldChild(
        firstName: data['s1eRvsL2Ly4'] ?? '',
        middleName: data['s1HaiT6OllL'] ?? '',
        surname: data['rSP9c21JsfC'] ?? '',
        sex: data['vIX4GTSCX4P'] ?? '',
        age: data['ls9hlz2tyol'] ?? '',
        teiData: tei);
  }

  @override
  String toString() {
    return '$firstName $surname';
  }
}
