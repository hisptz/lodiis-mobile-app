import 'package:kb_mobile_app/modules/app_logs/constants/programs_constants.dart';

class OnlineBeneficiarySearchResult {
  String? id;
  String? firstname;
  String? middleName;
  String? surname;
  String? location;
  String? primaryUIC;
  String? dateOfBirth;
  String? sex;
  String? program;

  OnlineBeneficiarySearchResult(
      {this.id,
      this.firstname,
      this.middleName,
      this.surname,
      this.dateOfBirth,
      this.sex,
      this.location,
      this.primaryUIC,
      this.program});

  OnlineBeneficiarySearchResult fromJson(dynamic json) {
    List<String> attributeKeys = [
      'WTZ7GLTrE8Q',
      'rSP9c21JsfC',
      's1HaiT6OllL',
      'qZP982qpSPS',
      'vIX4GTSCX4P',
      'fTSAY18LgCF'
    ];
    List attributes = json['attributes'];
    Map<String, dynamic> enrollmentDetails = json['enrollments'][0] ?? {};

    Map data = Map();
    for (Map detailObj in attributes) {
      String? attribute = detailObj['attribute'];
      if (attribute != null && attributeKeys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return OnlineBeneficiarySearchResult(
        id: json['trackedEntityInstance'],
        firstname: data['WTZ7GLTrE8Q'] ?? '',
        middleName: data['s1HaiT6OllL'] ?? '',
        surname: data['rSP9c21JsfC'] ?? '',
        dateOfBirth: data['qZP982qpSPS'] ?? '',
        sex: data['vIX4GTSCX4P'] ?? '',
        primaryUIC: data['fTSAY18LgCF'] ?? '',
        program: getEnrolledProgramName(enrollmentDetails['program']),
        location: enrollmentDetails['orgUnitName'] ?? '');
  }

  String getEnrolledProgramName(String? programId) {
    Map mappedPrograms = ProgramsConstants.programs;
    return programId != null ? mappedPrograms[programId] ?? '' : '';
  }

  @override
  String toString() {
    return '$firstname $surname';
  }
}
