import 'package:kb_mobile_app/models/events.dart';

class ReferralOutComeEvent {
  String id;
  String dateClientReachStation;
  String dateServiceProvided;
  bool requredFollowUp;
  String comments;
  Events eventData;

  ReferralOutComeEvent({
    this.id,
    this.dateClientReachStation,
    this.dateServiceProvided,
    this.requredFollowUp,
    this.comments,
    this.eventData,
  });

  ReferralOutComeEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = ['p7saxV2libq', 'lvT9gfpHIlT', 'LcG4J82PM4Z', 'Ep3atnNQGTY'];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return ReferralOutComeEvent(
      id: eventData.event,
      dateClientReachStation: data['p7saxV2libq'] ?? '',
      dateServiceProvided: data['lvT9gfpHIlT'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      requredFollowUp: data.containsKey('Ep3atnNQGTY')
          ? '${data['Ep3atnNQGTY']}'.trim() == 'true'
          : false,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id ';
  }
}
