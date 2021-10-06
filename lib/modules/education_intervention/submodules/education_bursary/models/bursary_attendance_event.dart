import 'package:kb_mobile_app/models/events.dart';

class BursaryAttendanceEvent {
  String? id;
  bool attended;
  String? date;
  Events? eventData;

  BursaryAttendanceEvent({
    this.id,
    this.attended = false,
    this.date,
    this.eventData,
  });

  BursaryAttendanceEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'WvYI4dliZyk',
    ];
    Map<String, dynamic> data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return BursaryAttendanceEvent(
      id: eventData.event,
      attended: data['WvYI4dliZyk'] == 'true',
      date: eventData.eventDate,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '${this.date} ${this.attended ? "Attended" : "Not Attended"}';
  }
}
