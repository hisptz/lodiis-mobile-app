import 'package:kb_mobile_app/models/events.dart';

class IndexContactModel {
  String id;
  String date;
  String name;
  dynamic datavalues;
  Events eventData;
  String indexInfoToIndexContactLinkage;

  IndexContactModel({
    this.id,
    this.date,
    this.name,
    this.datavalues,
    this.eventData,
    this.indexInfoToIndexContactLinkage,
  });

  IndexContactModel fromTeiModel(Events eventData) {
    List keys = [
      'p9AA21uFn2n',
      'Vw2UuN7qN8P'
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return IndexContactModel(
      id: eventData.event,
      date: eventData.eventDate,
      datavalues: eventData.dataValues,
      indexInfoToIndexContactLinkage: data['Vw2UuN7qN8P']?? '',
      name:data['p9AA21uFn2n']?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date $datavalues';
  }
}
