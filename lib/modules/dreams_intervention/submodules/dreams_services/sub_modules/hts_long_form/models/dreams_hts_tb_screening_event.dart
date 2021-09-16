import 'package:kb_mobile_app/models/events.dart';

class DreamsHTSTBScreeningEvent {
  String? id;
  String? date;
  String? htsTBLinkage;
  dynamic dataValues;
  Events? eventData;

  DreamsHTSTBScreeningEvent({
    this.id,
    this.date,
    this.htsTBLinkage,
    this.dataValues,
    this.eventData,
  });

  DreamsHTSTBScreeningEvent fromTeiModel(Events eventData) {
    List keys = [
      'A4Fl5p0ZBhX',
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return DreamsHTSTBScreeningEvent(
      id: eventData.event,
      date: eventData.eventDate,
      dataValues: eventData.dataValues,
      htsTBLinkage: data['A4Fl5p0ZBhX'] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date $dataValues';
  }
}
