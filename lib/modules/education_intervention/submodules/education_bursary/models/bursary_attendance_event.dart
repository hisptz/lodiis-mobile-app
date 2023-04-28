import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';

class BursaryAttendanceEvent {
  String? id;
  bool attended;
  String? date;
  bool? enrollmentOuAccessible;
  String? attendanceTorefrralLinkage;
  Events? eventData;

  BursaryAttendanceEvent({
    this.id,
    this.attended = false,
    this.date,
    this.enrollmentOuAccessible,
    this.attendanceTorefrralLinkage,
    this.eventData,
  });

  BursaryAttendanceEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'WvYI4dliZyk',
      BursaryInterventionConstant.clubAttendanceToReferralLinkage,
    ];
    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return BursaryAttendanceEvent(
      id: eventData.event,
      attended: data['WvYI4dliZyk'] == 'true',
      date: eventData.eventDate,
      attendanceTorefrralLinkage:
          data[BursaryInterventionConstant.clubAttendanceToReferralLinkage] ??
              '',
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$date ${attended ? 'Attended' : 'Not Attended'}';
  }
}
