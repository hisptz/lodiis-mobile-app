import 'package:kb_mobile_app/models/events.dart';

class ServiceEvents {
  String id;
  String interventionType;
  int numberaOfSessions;
  Events eventData;

  ServiceEvents(
      {this.id, this.eventData, this.interventionType, this.numberaOfSessions});

  ServiceEvents getServiceSessions(Events events) {
    List keys = [
      'Eug4BXDFLym',
      'vL6NpUA0rIU',
    ];

    Map data = Map();
    for (Map datavalues in events.dataValues) {
      String attribute = datavalues['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${datavalues['value']}'.trim() ?? '';
      }
    }

    return ServiceEvents(
        id: events.event,
        interventionType: data['Eug4BXDFLym'] ?? '',
        numberaOfSessions: int.parse(data['vL6NpUA0rIU'] ?? '0'),
        eventData: events);
  }
}
