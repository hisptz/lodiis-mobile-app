import 'package:kb_mobile_app/models/events.dart';

class AgywDreamsIndexInfoEvent {
  String id;
  String date;
  String consent;
  String onART;
  String startDateART;
  String enrollmentFacility;
  
  Events eventData;

  AgywDreamsIndexInfoEvent({
    this.id,
    this.date,
    this.consent,
    this.onART,
    this.startDateART,
    this.enrollmentFacility,
  
    this.eventData,
  });

  AgywDreamsIndexInfoEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'eT9Dk0tPnHe',
      'ePGwxaqA5Po',
      'qdN6oXzoUCg',
      'rvZ3SgtvxB5'
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return AgywDreamsIndexInfoEvent(
      id: eventData.event,
      date: eventData.eventDate,
      consent: data['eT9Dk0tPnHe'] ?? '',
      onART: data['ePGwxaqA5Po'] ?? '',
      startDateART: data['qdN6oXzoUCg'] ?? '',
      enrollmentFacility: data['rvZ3SgtvxB5'] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date';
  }
}
