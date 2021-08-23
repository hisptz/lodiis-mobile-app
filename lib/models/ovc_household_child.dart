import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcHouseholdChild {
  String? id;
  String? primaryUIC;
  String? secondaryUIC;
  String? firstName;
  String? middleName;
  String? surname;
  String? sex;
  String? age;
  String? orgUnit;
  String? createdDate;
  String? hivStatus;
  TrackedEntityInstance? teiData;

  OvcHouseholdChild({
    this.id,
    this.primaryUIC,
    this.secondaryUIC,
    this.firstName,
    this.middleName,
    this.surname,
    this.sex,
    this.age,
    this.orgUnit,
    this.createdDate,
    this.hivStatus,
    this.teiData,
  });

  OvcHouseholdChild fromTeiModel(
    TrackedEntityInstance tei,
    String? orgUnit,
    String? createdDate,
  ) {
    List keys = [
      'WTZ7GLTrE8Q',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'ls9hlz2tyol',
      'vIX4GTSCX4P',
      'wmKqYZML8GA',
      BeneficiaryIdentification.primaryUIC,
      BeneficiaryIdentification.secondaryUIC
    ];
    Map data = Map();
    for (Map attributeObject in tei.attributes) {
      String? attribute = attributeObject['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${attributeObject['value']}'.trim();
      }
    }
    return OvcHouseholdChild(
        id: tei.trackedEntityInstance,
        firstName: data['WTZ7GLTrE8Q'] ?? '',
        middleName: data['s1HaiT6OllL'] ?? '',
        surname: data['rSP9c21JsfC'] ?? '',
        sex: data['vIX4GTSCX4P'] ?? '',
        age: data['ls9hlz2tyol'] ?? '',
        primaryUIC: data[BeneficiaryIdentification.primaryUIC] ?? '',
        secondaryUIC: data[BeneficiaryIdentification.secondaryUIC] ?? '',
        createdDate: createdDate,
        hivStatus: data['wmKqYZML8GA'] != null
            ? data['wmKqYZML8GA'] == 'true'
                ? 'Positive'
                : 'Negative'
            : '',
        orgUnit: orgUnit,
        teiData: tei);
  }

  @override
  String toString() {
    return '$firstName $surname';
  }
}
