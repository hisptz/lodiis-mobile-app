import 'package:kb_mobile_app/models/events.dart';

class ReferralOutcomeEvent {
  String? id;
  String? dateClientReachStation;
  String? dateServiceProvided;
  String? referralReference;
  bool? requiredFollowUp;
  String? comments;
  bool? enrollmentOuAccessible;
  Events? eventData;

  ReferralOutcomeEvent({
    this.id,
    this.dateClientReachStation,
    this.dateServiceProvided,
    this.requiredFollowUp,
    this.referralReference,
    this.comments,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  ReferralOutcomeEvent fromTeiModel(
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
    Map data = {};
    for (Map detailObj in eventData.dataValues) {
      String? dataElement = detailObj['dataElement'];
      if (dataElement != null && keys.contains(dataElement)) {
        data[dataElement] = '${detailObj['value']}'.trim();
      }
    }
    return ReferralOutcomeEvent(
      id: eventData.event,
      referralReference: data[referralToFollowUpLinkage] ?? '',
      dateClientReachStation: data['p7saxV2libq'] ?? '',
      dateServiceProvided: data['lvT9gfpHIlT'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      requiredFollowUp: data.containsKey('Ep3atnNQGTY')
          ? '${data['Ep3atnNQGTY']}'.trim() == 'true'
          : false,
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $dateClientReachStation ';
  }
}
