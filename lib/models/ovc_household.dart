import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcHousehold {
  String? id;
  String? firstName;
  String? middleName;
  String? surname;
  String? location;
  String? orgUnit;
  String? createdDate;
  String? primaryUIC;
  String? secondaryUIC;
  String? ovcMaleCount;
  String? ovcFemaleCount;
  String? houseHoldStatus;
  String? searchableValue;
  List<OvcHouseholdChild>? children;
  TrackedEntityInstance? teiData;

  OvcHousehold({
    this.id,
    this.firstName,
    this.middleName,
    this.surname,
    this.ovcMaleCount,
    this.children,
    this.primaryUIC,
    this.secondaryUIC,
    this.location,
    this.orgUnit,
    this.createdDate,
    this.ovcFemaleCount,
    this.houseHoldStatus,
    this.searchableValue,
    this.teiData,
  });

  OvcHousehold fromTeiModel(
    TrackedEntityInstance tei,
    String? location,
    String? orgUnit,
    String? createdDate,
    List<OvcHouseholdChild> children,
  ) {
    List keys = [
      'WTZ7GLTrE8Q',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'kQehaqmaygZ',
      'BXUNH6LXeGA',
      'PN92g65TkVI',
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
    // Children count per sex
    int maleCount = children
        .where((child) => child.sex!.toLowerCase() == 'male')
        .toList()
        .length;
    int femaleCount = children
        .where((child) => child.sex!.toLowerCase() == 'female')
        .toList()
        .length;
    return OvcHousehold(
        id: tei.trackedEntityInstance,
        firstName: data['WTZ7GLTrE8Q'] ?? '',
        middleName: data['s1HaiT6OllL'] ?? '',
        surname: data['rSP9c21JsfC'] ?? '',
        location: location,
        orgUnit: orgUnit,
        createdDate: createdDate,
        ovcMaleCount: '$maleCount',
        ovcFemaleCount: '$femaleCount',
        primaryUIC: data[BeneficiaryIdentification.primaryUIC] ?? '',
        secondaryUIC: data[BeneficiaryIdentification.secondaryUIC] ?? '',
        houseHoldStatus: data['PN92g65TkVI'] ?? '',
        searchableValue:
            "${data['WTZ7GLTrE8Q'] ?? ''} ${data['s1HaiT6OllL'] ?? ''} ${data['rSP9c21JsfC'] ?? ''} ${data[BeneficiaryIdentification.beneficiaryId] ?? ''} $location $createdDate"
                .toLowerCase(),
        children: children,
        teiData: tei);
  }

  @override
  String toString() {
    return '$firstName $surname';
  }
}
