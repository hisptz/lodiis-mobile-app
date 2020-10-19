import 'package:kb_mobile_app/models/events.dart';

class DreamsHTSEvent {
  String id;
  String date;
  String htsIndexLinkage;
  dynamic datavalues;
  Events eventData;

  DreamsHTSEvent({
    this.id,
    this.date,
    this.htsIndexLinkage,
    this.datavalues,
    this.eventData,
  });

 DreamsHTSEvent fromTeiModel(
    Events eventData
  ) {
    List keys = [
      'vbnWGqIQoAN',
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return DreamsHTSEvent(
      id: eventData.event,
      date: eventData.eventDate,
      datavalues:eventData.dataValues,
      htsIndexLinkage: data['vbnWGqIQoAN'] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date $datavalues';
  }
}
