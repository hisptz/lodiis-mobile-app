import 'package:kb_mobile_app/models/events.dart';

class DreamsHTSEvent {
  String? id;
  String? date;
  String? htsIndexLinkage;
  String? htsTBLinkage;
  String? htsToHtsRegisterLinkage;
  dynamic dataValues;
  Events? eventData;

  DreamsHTSEvent({
    this.id,
    this.date,
    this.htsIndexLinkage,
    this.htsTBLinkage,
    this.htsToHtsRegisterLinkage,
    this.dataValues,
    this.eventData,
  });

  DreamsHTSEvent fromTeiModel(Events eventData) {
    List keys = ['vbnWGqIQoAN', 'A4Fl5p0ZBhX', 'icla65Bvljz'];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return DreamsHTSEvent(
      id: eventData.event,
      date: eventData.eventDate,
      dataValues: eventData.dataValues,
      htsIndexLinkage: data['vbnWGqIQoAN'] ?? '',
      htsTBLinkage: data['A4Fl5p0ZBhX'] ?? '',
      htsToHtsRegisterLinkage: data['icla65Bvljz'] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date $dataValues';
  }
}
