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
    ];
    Map data = Map();
    for (Map detailObj in trackedEntityInstance.attributes) {
      String? attribute = detailObj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    //@TODO assign to proper attributes
    String grade = "";
    String schoolName = "";
    String beneficiaryId = "";

    int age = AppUtil.getAgeInYear(data['qZP982qpSPS']);
    return EducationBeneficiary(
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
      createdDate: createdDate,
      enrollment: enrollment,
      grade: grade,
      beneficiaryId: beneficiaryId,
      schoolName: schoolName,
      isSynced: trackedEntityInstance.syncStatus == "synced",
      trackedEntityInstanceData: trackedEntityInstance,
    );
  }

  @override
  String toString() {
    return '$firstname $surname';
  }
}
