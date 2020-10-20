import 'package:kb_mobile_app/models/events.dart';

class DreamsHTSTBEvent {
  String id;
  String date;
  String htsTBLinkage;
  dynamic datavalues;
  Events eventData;

  DreamsHTSTBEvent({
    this.id,
    this.date,
    this.htsTBLinkage,
    this.datavalues,
    this.eventData,
  });

 DreamsHTSTBEvent fromTeiModel(
    Events eventData
  ) {
    List keys = [
      'A4Fl5p0ZBhX',
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return DreamsHTSTBEvent(
      id: eventData.event,
      date: eventData.eventDate,
      datavalues:eventData.dataValues,
      htsTBLinkage: data['A4Fl5p0ZBhX'] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date $datavalues';
  }
}
