import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OgacBeneficiary {
  String? id;
  String? firstname;
  String? middlename;
  String? surname;
  String? age;
  String? sex;
  String? beneficiaryId;
  String? location;
  String? phoneNumber;
  String? village;
  String? orgUnit;
  String? createdDate;
  String? searchableValue;
  String? enrollment;
  String? implementingPartner;
  bool? enrollmentOuAccessible;
  TrackedEntityInstance? trackedEntityInstanceData;
  Events? eventData;

  OgacBeneficiary({
    this.id,
    this.firstname,
    this.middlename,
    this.surname,
    this.age,
    this.beneficiaryId,
    this.sex,
    this.location,
    this.phoneNumber,
    this.village,
    this.orgUnit,
    this.createdDate,
    this.enrollment,
    this.searchableValue,
    this.implementingPartner,
    this.enrollmentOuAccessible,
    this.trackedEntityInstanceData,
    this.eventData,
  });
  OgacBeneficiary fromTeiModel(
    TrackedEntityInstance trackedEntityInstance,
    String? orgUnit,
    String? location,
    String? createdDate,
    String? enrollment,
    Events? eventData,
    bool? enrollmentOuAccessible,
  ) {
    List keys = [
      'RB8Wx75hGa4',
      'tNdoR0jYr7R',
      'WTZ7GLTrE8Q',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'ls9hlz2tyol',
      'vIX4GTSCX4P',
      'klLkGxy328c',
      'qZP982qpSPS',
      BeneficiaryIdentification.beneficiaryId
    ];
    Map data = {};
    for (Map detailObj in trackedEntityInstance.attributes) {
      String? attribute = detailObj['attribute'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    int age = AppUtil.getAgeInYear(data['qZP982qpSPS']);
    String phoneNumber = data["tNdoR0jYr7R"] ?? '';
    String village = data["RB8Wx75hGa4"] ?? '';
    return OgacBeneficiary(
      id: trackedEntityInstance.trackedEntityInstance,
      firstname: data['WTZ7GLTrE8Q'] ?? '',
      middlename: data['s1HaiT6OllL'] ?? '',
      surname: data['rSP9c21JsfC'] ?? '',
      age: age.toString(),
      beneficiaryId: data[BeneficiaryIdentification.beneficiaryId] ?? '',
      sex: data['vIX4GTSCX4P'] ?? '',
      searchableValue:
          "${data['WTZ7GLTrE8Q'] ?? ''} ${data['s1HaiT6OllL'] ?? ''} ${data['rSP9c21JsfC'] ?? ''} $age ${data[BeneficiaryIdentification.beneficiaryId] ?? ''} ${data['vIX4GTSCX4P'] ?? ''} ${data['RB8Wx75hGa4']} $location $createdDate"
              .toLowerCase(),
      orgUnit: orgUnit,
      location: location,
      phoneNumber: phoneNumber != "" ? phoneNumber : 'N/A',
      village: village != "" ? village : 'N/A',
      createdDate: createdDate,
      enrollment: enrollment,
      enrollmentOuAccessible: enrollmentOuAccessible,
      implementingPartner: data['klLkGxy328c'] ?? '',
      trackedEntityInstanceData: trackedEntityInstance,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$firstname $surname';
  }
}
