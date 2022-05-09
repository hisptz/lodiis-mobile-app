import 'package:kb_mobile_app/models/events.dart';

class BursaryAttendanceEvent {
  String? id;
  bool attended;
  String? date;
  bool? enrollmentOuAccessible;
  Events? eventData;

  BursaryAttendanceEvent({
    this.id,
    this.attended = false,
    this.date,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  BursaryAttendanceEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'WvYI4dliZyk',
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
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$date ${attended ? "Attended" : "Not Attended"}';
  }
}
