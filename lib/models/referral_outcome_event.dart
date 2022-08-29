import 'package:kb_mobile_app/models/events.dart';

class ReferralOutcomeEvent {
  String? id;
  String? dateClientReachStation;
  String? dateServiceProvided;
  String? referralReference;
  String? referralFollowUpReference;
  bool? referralServiceProvided;
  bool? requiredFollowUp;
  String? comments;
  String? reasonForDecline;
  bool? enrollmentOuAccessible;
  Events? eventData;

  ReferralOutcomeEvent({
    this.id,
    this.dateClientReachStation,
    this.dateServiceProvided,
    this.requiredFollowUp,
    this.referralReference,
    this.referralFollowUpReference,
    this.reasonForDecline,
    this.referralServiceProvided,
    this.comments,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  ReferralOutcomeEvent fromTeiModel({
    required Events eventData,
    required String referralToFollowUpLinkage,
    required String referralToComeReference,
  }) {
    List keys = [
      'p7saxV2libq',
      'lvT9gfpHIlT',
      'LcG4J82PM4Z',
      'Ep3atnNQGTY',
      'hXyqgOWZ17b',
      'gEjigBuBTmh',
      referralToFollowUpLinkage,
      referralToComeReference
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
      referralReference: data[referralToComeReference] ?? '',
      referralFollowUpReference: data[referralToFollowUpLinkage] ?? '',
      dateClientReachStation: data['p7saxV2libq'] ?? '',
      dateServiceProvided: data['lvT9gfpHIlT'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      requiredFollowUp: data.containsKey('Ep3atnNQGTY')
          ? '${data['Ep3atnNQGTY']}'.trim() == 'true'
          : false,
      referralServiceProvided: data.containsKey('hXyqgOWZ17b')
          ? '${data['hXyqgOWZ17b']}'.trim() == 'true'
          : false,
      reasonForDecline: data['gEjigBuBTmh'] ?? '',
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $dateClientReachStation ';
  }
}
