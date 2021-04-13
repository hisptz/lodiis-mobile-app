import 'package:kb_mobile_app/models/events.dart';

class ServiceEvents {
  String event;
  String programStage;
  String interventionType;
  String interventionGroup;
  int numberOfSessions;
  Events eventData;

  ServiceEvents(
      {this.event,
      this.programStage,
      this.eventData,
      this.interventionType,
      this.interventionGroup,
      this.numberOfSessions});

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

    var numberOfSessions =
        data['vL6NpUA0rIU'] != '' && data['vL6NpUA0rIU'] != null
            ? data['vL6NpUA0rIU']
            : '0';
    return ServiceEvents(
        event: events.event,
        programStage: events.programStage,
        interventionType: data['Eug4BXDFLym'] ?? '',
        interventionGroup: assignInterventionGroup(data['Eug4BXDFLym'] ?? ''),
        numberOfSessions: int.parse(numberOfSessions) ?? 0,
        eventData: events);
  }

  String assignInterventionGroup(String interventionType) {
    if (interventionType == 'AFLATEEN/TOUN' ||
        interventionType == 'PTS 4 NON-GRADS' ||
        interventionType == 'PTS 4-GRADS' ||
        interventionType == 'Go Girls') {
      return '(SAB) Social Assets Building';
    } else if (interventionType == 'SILC' ||
        interventionType == 'SAVING GROUP' ||
        interventionType == 'FINANCIAL EDUCATION') {
      return '(ES) Economic Strengthening';
    } else if (interventionType == 'STEPPING STONES' ||
        interventionType == 'IPC' ||
        interventionType == 'LBSE') {
      return 'HIV & VIOLENCE PREVENTION';
    } else if (interventionType == 'PARENTING') {
      return 'PARENTING';
    } else if (interventionType == 'GBV Legal') {
      return 'GBV LEGAL';
    } else if (interventionType == 'VAC Legal') {
      return 'VAC LEGAL';
    } else if (interventionType == 'VAC Legal Messaging') {
      return 'VAC LEGAL MESSAGING';
    } else if (interventionType == 'GBV Legal Messaging') {
      return 'GBV LEGAL MESSAGING';
    } else {
      return '';
    }
  }
}
