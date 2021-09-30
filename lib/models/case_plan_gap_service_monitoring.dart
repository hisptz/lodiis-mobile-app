import 'package:kb_mobile_app/models/events.dart';

class CasePlanGapServiceMonitoring {
  String? id;
  String? date;
  String? casePlanGapToServiceMonitoringLinkage;
  Events? eventData;

  CasePlanGapServiceMonitoring(
      {this.id,
      this.date,
      this.eventData,
      this.casePlanGapToServiceMonitoringLinkage});

  CasePlanGapServiceMonitoring fromTeiModel(
      Events eventData, String casePlanGapToServiceMonitoringLinkage) {
    Map data = Map();

    for (Map dataValues in eventData.dataValues) {
      String? dataElement = dataValues['dataElement'];
      if (dataElement != null &&
          dataElement == casePlanGapToServiceMonitoringLinkage) {
        data[dataElement] = '${dataValues['value']}'.trim();
      }
    }

    return CasePlanGapServiceMonitoring(
      id: eventData.event,
      casePlanGapToServiceMonitoringLinkage:
          data[casePlanGapToServiceMonitoringLinkage] ?? '',
      date: eventData.eventDate,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date';
  }
}
