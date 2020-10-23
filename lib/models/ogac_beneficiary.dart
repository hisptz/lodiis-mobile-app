import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OgacBeneficiary {
  String id;
  String firstname;
  String middlename;
  String surname;
  String age;
  String sex;
  String benefecaryId;
  String location;
  String orgUnit;
  String createdDate;
  String enrollment;
  TrackeEntityInstance trackeEntityInstanceData;

  OgacBeneficiary(
      {this.id,
      this.firstname,
      this.middlename,
      this.surname,
      this.age,
      this.benefecaryId,
      this.sex,
      this.location,
      this.orgUnit,
      this.createdDate,
      this.enrollment,
      this.trackeEntityInstanceData});
  OgacBeneficiary fromTeiModel(
    TrackeEntityInstance trackeEntityInstance,
    String orgUnit,
    String location,
    String createdDate,
    String enrollment,
  ) {
    List keys = [];
    Map data = Map();
    for (Map detailObj in trackeEntityInstance.attributes) {
      String attribute = detailObj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    int age = AppUtil.getAgeInYear(data['qZP982qpSPS']);
    return OgacBeneficiary(
      id: trackeEntityInstance.trackedEntityInstance,
      firstname: '',
      middlename: '',
      surname: data['rSP9c21JsfC'],
      age: age.toString(),
      benefecaryId: '',
      sex: '',
      orgUnit: orgUnit,
      location: location,
      createdDate: createdDate,
      enrollment: enrollment,
      trackeEntityInstanceData: trackeEntityInstance,
    );
  }

  @override
  String toString() {
    return '$firstname $surname';
  }
}
