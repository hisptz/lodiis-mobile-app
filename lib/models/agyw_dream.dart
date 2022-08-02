import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class AgywDream {
  String? id;
  String? firstname;
  String? middlename;
  String? surname;
  String? age;
  String? ageBand;
  String? sex;
  String? programStatus;
  String? primaryUIC;
  String? enrolledOrganisation;
  String? location;
  String? orgUnit;
  String? createdDate;
  String? searchableValue;
  String? enrollment;
  String? beneficiaryType;
  String? phoneNumber;
  String? village;
  String? landMark;
  bool? isAgeBeyondAverage;
  bool? enrollmentOuAccessible;
  TrackedEntityInstance? trackedEntityInstanceData;

  AgywDream({
    this.id,
    this.firstname,
    this.middlename,
    this.surname,
    this.age,
    this.ageBand,
    this.primaryUIC,
    this.sex,
    this.programStatus,
    this.enrolledOrganisation,
    this.location,
    this.isAgeBeyondAverage,
    this.orgUnit,
    this.createdDate,
    this.enrollment,
    this.searchableValue,
    this.beneficiaryType,
    this.phoneNumber,
    this.village,
    this.landMark,
    this.enrollmentOuAccessible,
    this.trackedEntityInstanceData,
  });
  AgywDream fromTeiModel(
    TrackedEntityInstance trackedEntityInstance,
    String? orgUnit,
    String? location,
    String? createdDate,
    String? enrollment,
    bool? enrollmentOuAccessible,
  ) {
    List keys = [
      'WTZ7GLTrE8Q',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'qZP982qpSPS',
      'PN92g65TkVI',
      'VJiWumvINR6',
      'tNdoR0jYr7R',
      'RB8Wx75hGa4',
      'dQPw7EzqJP6',
      UserAccountReference.implementingPartnerAttribute,
      'vIX4GTSCX4P',
      'vkd6o91n1IC',
      BeneficiaryIdentification.primaryUIC
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
    String landMark = data['dQPw7EzqJP6'] ?? '';
    return AgywDream(
      id: trackedEntityInstance.trackedEntityInstance,
      firstname: data['WTZ7GLTrE8Q'] ?? '',
      middlename: data['s1HaiT6OllL'] ?? '',
      surname: data['rSP9c21JsfC'] ?? '',
      age: age.toString(),
      ageBand: agywAgeBand(age),
      primaryUIC: data[BeneficiaryIdentification.primaryUIC] ?? '',
      sex: data['VJiWumvINR6'] ?? data['vIX4GTSCX4P'] ?? '',
      beneficiaryType: data['vkd6o91n1IC'] ?? '',
      programStatus: data['PN92g65TkVI'] ?? '',
      phoneNumber: phoneNumber.isNotEmpty ? phoneNumber : 'N/A',
      village: village.isNotEmpty ? village : 'N/A',
      landMark: landMark.isNotEmpty ? landMark : 'N/A',
      orgUnit: orgUnit,
      location: location,
      isAgeBeyondAverage: age > 24 ? true : false,
      createdDate: createdDate,
      enrollment: enrollment,
      enrolledOrganisation:
          data[UserAccountReference.implementingPartnerAttribute] ?? '',
      enrollmentOuAccessible: enrollmentOuAccessible,
      searchableValue:
          "${data['WTZ7GLTrE8Q'] ?? ''} ${data['s1HaiT6OllL'] ?? ''} ${data['rSP9c21JsfC'] ?? ''} $age ${agywAgeBand(age)} ${data[BeneficiaryIdentification.beneficiaryId] ?? ''} ${data['VJiWumvINR6'] ?? ''} ${data[UserAccountReference.implementingPartnerAttribute] ?? ''} $location $createdDate"
              .toLowerCase(),
      trackedEntityInstanceData: trackedEntityInstance,
    );
  }

  String agywAgeBand(int age) {
    return (age > 8 && age < 15)
        ? '09-14'
        : (age > 14 && age < 20)
            ? '15-19'
            : (age > 19 && age < 25)
                ? '20-24'
                : '';
  }

  @override
  String toString() {
    return '$firstname $surname';
  }
}
