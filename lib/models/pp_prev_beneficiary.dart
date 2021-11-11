import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class PpPrevBeneficiary {
  String? id;
  String? firstname;
  String? surname;
  String? age;
  String? sex;
  String? location;
  String? phoneNumber;
  String? village;
  String? orgUnit;
  String? createdDate;
  String? searchableValue;
  String? enrollment;
  String? implementingPartner;
  TrackedEntityInstance? trackedEntityInstanceData;

  PpPrevBeneficiary({
    this.id,
    this.firstname,
    this.surname,
    this.age,
    this.sex,
    this.location,
    this.phoneNumber,
    this.village,
    this.orgUnit,
    this.createdDate,
    this.enrollment,
    this.implementingPartner,
    this.searchableValue,
    this.trackedEntityInstanceData,
  });
  PpPrevBeneficiary fromTeiModel(
    TrackedEntityInstance trackedEntityInstance,
    String? orgUnit,
    String? location,
    String? createdDate,
    String? enrollment,
  ) {
    List keys = [
      'RB8Wx75hGa4',
      'tNdoR0jYr7R',
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'vIX4GTSCX4P',
      'qZP982qpSPS',
      'klLkGxy328c'
    ];
    Map data = Map();
    for (Map detailObj in trackedEntityInstance.attributes) {
      String? attribute = detailObj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    int age = AppUtil.getAgeInYear(data['qZP982qpSPS']);
    String phoneNumber = data["tNdoR0jYr7R"] ?? '';
    String village = data["RB8Wx75hGa4"] ?? '';
    return PpPrevBeneficiary(
      id: trackedEntityInstance.trackedEntityInstance,
      firstname: data['WTZ7GLTrE8Q'] ?? '',
      surname: data['rSP9c21JsfC'] ?? '',
      age: age.toString(),
      sex: data['vIX4GTSCX4P'] ?? '',
      searchableValue:
          "${data['WTZ7GLTrE8Q'] ?? ''} ${data['rSP9c21JsfC'] ?? ''} $age  ${data['vIX4GTSCX4P'] ?? ''} ${data['RB8Wx75hGa4']} $location $createdDate"
              .toLowerCase(),
      orgUnit: orgUnit,
      location: location,
      phoneNumber: phoneNumber != "" ? phoneNumber : 'N/A',
      village: village != "" ? village : 'N/A',
      createdDate: createdDate,
      enrollment: enrollment,
      implementingPartner: data['klLkGxy328c'] ?? '',
      trackedEntityInstanceData: trackedEntityInstance,
    );
  }

  @override
  String toString() {
    return '$firstname $surname';
  }
}
