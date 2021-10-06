import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class EducationBeneficiary {
  String? id;
  String? beneficiaryId;
  String? firstname;
  String? surname;
  String? age;
  String? sex;
  String? location;
  String? orgUnit;
  String? createdDate;
  String? searchableValue;
  String? enrollment;
  String? schoolName;
  String? grade;
  bool? isMaleBeneficiary;
  bool? isSynced;
  TrackedEntityInstance? trackedEntityInstanceData;

  EducationBeneficiary({
    this.id,
    this.beneficiaryId,
    this.firstname,
    this.surname,
    this.age,
    this.sex,
    this.location,
    this.orgUnit,
    this.createdDate,
    this.enrollment,
    this.schoolName,
    this.grade,
    this.isMaleBeneficiary,
    this.searchableValue,
    this.isSynced,
    this.trackedEntityInstanceData,
  });
  EducationBeneficiary fromTeiModel(
    TrackedEntityInstance trackedEntityInstance,
    String? orgUnit,
    String? location,
    String? createdDate,
    String? enrollment,
  ) {
    List keys = [
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      'vIX4GTSCX4P',
      'qZP982qpSPS',
      'EwZil0AnlYo',
      'BUPSEpJySPR',
      'tbzi0t27D8l',
      BeneficiaryIdentification.beneficiaryId
    ];
    Map data = Map();
    for (Map detailObj in trackedEntityInstance.attributes) {
      String? attribute = detailObj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    String sex = data['vIX4GTSCX4P'] ?? '';
    int age = AppUtil.getAgeInYear(data['qZP982qpSPS']);
    bool isMaleBeneficiary = '$sex'.trim().toLowerCase() == "male";
    return EducationBeneficiary(
      id: trackedEntityInstance.trackedEntityInstance,
      firstname: data['WTZ7GLTrE8Q'] ?? '',
      surname: data['rSP9c21JsfC'] ?? '',
      age: age.toString(),
      sex: sex,
      isMaleBeneficiary: isMaleBeneficiary,
      searchableValue:
          "${data['WTZ7GLTrE8Q'] ?? ''} ${data['rSP9c21JsfC'] ?? ''} $age  ${data['vIX4GTSCX4P'] ?? ''} ${data['RB8Wx75hGa4']} $location $createdDate"
              .toLowerCase(),
      orgUnit: orgUnit,
      location: location,
      createdDate: createdDate,
      enrollment: enrollment,
      grade: data['BUPSEpJySPR'] ?? data['tbzi0t27D8l'] != null
          ? '${data['tbzi0t27D8l']}'.split(' ')[1]
          : 'BUPSEpJySPR',
      beneficiaryId: data[BeneficiaryIdentification.beneficiaryId] ?? '',
      schoolName: data['EwZil0AnlYo'] ?? '',
      isSynced: trackedEntityInstance.syncStatus == "synced",
      trackedEntityInstanceData: trackedEntityInstance,
    );
  }

  @override
  String toString() {
    return '$firstname $surname';
  }
}
