import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';

class BursaryReferralEvent {
  String? id;
  String? date;
  String? referral;
  String? referralTo;
  String? referralToReferralOutcomeLinkage;
  String? attendanceTorefrralLinkage;
  bool? enrollmentOuAccessible;
  Events? eventData;

  BursaryReferralEvent({
    this.id,
    this.date,
    this.referral,
    this.referralTo,
    this.referralToReferralOutcomeLinkage,
    this.attendanceTorefrralLinkage,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  BursaryReferralEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'KzIw7RMGZ9c',
      'hpuu3TCZkKx',
      'OIUDljKyNgy',
      BursaryInterventionConstant.clubAttendanceToReferralLinkage,
      BursaryInterventionConstant.clubAttendanceReferralToReferralOutcomeLinkage
    ];
    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return BursaryReferralEvent(
      id: eventData.event,
      date: data['OIUDljKyNgy'] ?? eventData.eventDate,
      referral: data['KzIw7RMGZ9c'] ?? '',
      referralTo: data['hpuu3TCZkKx'] ?? '',
      attendanceTorefrralLinkage:
          data[BursaryInterventionConstant.clubAttendanceToReferralLinkage] ??
              '',
      referralToReferralOutcomeLinkage: data[BursaryInterventionConstant
              .clubAttendanceReferralToReferralOutcomeLinkage] ??
          '',
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return 'referral => $referral referralTop => $referralTo';
  }
}
