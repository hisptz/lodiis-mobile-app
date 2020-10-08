import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcHouseHoldChild {
  String id;
  String childId;
  String firstName;
  String middleName;
  String surname;
  String sex;
  String age;
  String orgUnit;
  String createdDate;
  TrackeEntityInstance teiData;

  OvcHouseHoldChild({
    this.id,
    this.childId,
    this.firstName,
    this.middleName,
    this.surname,
    this.sex,
    this.age,
    this.orgUnit,
    this.createdDate,
    this.teiData,
  });

  OvcHouseHoldChild fromTeiModel(
    TrackeEntityInstance tei,
    String orgUnit,
    String createdDate,
  ) {
    List keys = [
      'WTZ7GLTrE8Q',
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
        id: tei.trackedEntityInstance,
        firstName: data['WTZ7GLTrE8Q'] ?? '',
        middleName: data['s1HaiT6OllL'] ?? '',
        surname: data['rSP9c21JsfC'] ?? '',
        sex: data['vIX4GTSCX4P'] ?? '',
        age: data['ls9hlz2tyol'] ?? '',
        childId: data[BeneficiaryIdentification.beneficiaryId] ?? '',
        createdDate: createdDate,
        orgUnit: orgUnit,
        teiData: tei);
  }

  @override
  String toString() {
    return '$firstName $surname';
  }
}
