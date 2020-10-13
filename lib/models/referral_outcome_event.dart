import 'package:kb_mobile_app/models/events.dart';

class ReferralOutComeEvent {
  String id;
  String dateClientReachStation;
  String dateServiceProvided;
  String referralReference;
  bool requredFollowUp;
  String comments;
  Events eventData;

  ReferralOutComeEvent({
    this.id,
    this.dateClientReachStation,
    this.dateServiceProvided,
    this.requredFollowUp,
    this.referralReference,
    this.comments,
    this.eventData,
  });

  ReferralOutComeEvent fromTeiModel(
    Events eventData,
    String referralToFollowUpLinkage,
  ) {
    List keys = [
      'p7saxV2libq',
      'lvT9gfpHIlT',
      'LcG4J82PM4Z',
      'Ep3atnNQGTY',
      referralToFollowUpLinkage
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String dataElement = detailObj['dataElement'];
      if (dataElement != null && keys.indexOf(dataElement) > -1) {
        data[dataElement] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return ReferralOutComeEvent(
      id: eventData.event,
      referralReference: data[referralToFollowUpLinkage] ?? '',
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
    return '$id $dateClientReachStation ';
  }
}
