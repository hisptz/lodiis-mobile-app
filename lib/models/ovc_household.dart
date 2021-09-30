import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcHousehold {
  String? id;
  String? firstName;
  String? middleName;
  String? surname;
  String? location;
  String? phoneNumber;
  String? village;
  String? orgUnit;
  String? createdDate;
  String? primaryUIC;
  String? secondaryUIC;
  String? ovcMaleCount;
  String? ovcFemaleCount;
  String? houseHoldStatus;
  String? searchableValue;
  bool? isSynced;
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
    this.phoneNumber,
    this.village,
    this.orgUnit,
    this.createdDate,
    this.ovcFemaleCount,
    this.houseHoldStatus,
    this.searchableValue,
    this.isSynced,
    this.teiData,
  });

  OvcHousehold fromTeiModel(
    TrackedEntityInstance tei,
    String? location,
    String? orgUnit,
    String? createdDate,
    List<OvcHouseholdChild> children,
  ) {
    List<String> phoneNumberIds = ['tNdoR0jYr7R', 'cvrdI9t4rtN'];
    List<String> keys = [
      'tNdoR0jYr7R',
      'cvrdI9t4rtN',
      'tNdoR0jYr7R',
      'WTZ7GLTrE8Q',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'kQehaqmaygZ',
      'BXUNH6LXeGA',
      'PN92g65TkVI',
      'RB8Wx75hGa4',
      BeneficiaryIdentification.primaryUIC,
      BeneficiaryIdentification.secondaryUIC
    ];
    Map<String, dynamic> data = Map();
    for (Map attributeObject in tei.attributes) {
      String? attribute = attributeObject['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${attributeObject['value']}'.trim();
      }
    }
    String village = data['RB8Wx75hGa4'] ?? '';
    String phoneNumber = getPhoneNumbers(data, phoneNumberIds);
    int maleCount = getChildCountBySex(children, 'male');
    int femaleCount = getChildCountBySex(children, 'female');
    return OvcHousehold(
      id: tei.trackedEntityInstance,
      firstName: data['WTZ7GLTrE8Q'] ?? '',
      middleName: data['s1HaiT6OllL'] ?? '',
      surname: data['rSP9c21JsfC'] ?? '',
      location: location,
      phoneNumber: phoneNumber != "" ? phoneNumber : 'N/A',
      village: village != "" ? village : 'N/A',
      orgUnit: orgUnit,
      createdDate: createdDate,
      ovcMaleCount: '$maleCount',
      ovcFemaleCount: '$femaleCount',
      primaryUIC: data[BeneficiaryIdentification.primaryUIC] ?? '',
      secondaryUIC: data[BeneficiaryIdentification.secondaryUIC] ?? '',
      houseHoldStatus: data['PN92g65TkVI'] ?? '',
      isSynced: tei.syncStatus == "synced",
      searchableValue:
          "${data['WTZ7GLTrE8Q'] ?? ''} ${data['s1HaiT6OllL'] ?? ''} ${data['rSP9c21JsfC'] ?? ''} ${data[BeneficiaryIdentification.beneficiaryId] ?? ''} $location $createdDate"
              .toLowerCase(),
      children: children,
      teiData: tei,
    );
  }

  String getPhoneNumbers(
    Map<String, dynamic> data,
    List<String> phoneNumberIds,
  ) {
    return phoneNumberIds
        .map((String phoneNumberId) => data[phoneNumberId] ?? "")
        .toList()
        .where((phoneNumber) => phoneNumber.isNotEmpty)
        .toList()
        .join("/");
  }

  int getChildCountBySex(List<OvcHouseholdChild> children, String sex) {
    return children
        .where((child) => child.sex!.toLowerCase() == sex)
        .toList()
        .length;
  }

  @override
  String toString() {
    return '$firstName $surname';
  }
}
