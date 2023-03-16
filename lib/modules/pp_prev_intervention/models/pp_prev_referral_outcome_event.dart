import 'package:kb_mobile_app/models/events.dart';

class PpPrevReferralOutcomeEvent {
  String? id;
  String? serviceProvisionDate;
  String? followUpDate;
  bool? followUpRequired;
  String? reasonForReject;
  String? referralReference;
  bool? referralServiceProvided;
  Events? eventData;

  PpPrevReferralOutcomeEvent({
    this.eventData,
    this.id,
    this.followUpDate,
    this.followUpRequired,
    this.serviceProvisionDate,
    this.reasonForReject,
    this.referralReference,
    this.referralServiceProvided,
  });

  PpPrevReferralOutcomeEvent fromEventModel({
    required Events eventData,
    required String referralToOutcomeReference,
  }) {
    List keys = [
      'hXyqgOWZ17b',
      'lvT9gfpHIlT',
      'DPf5mUDoZMy',
      'Ep3atnNQGTY',
      'gEjigBuBTmh',
      referralToOutcomeReference,
    ];

    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }

    return PpPrevReferralOutcomeEvent(
      id: eventData.event,
      eventData: eventData,
      referralReference: data[referralToOutcomeReference] ?? '',
      referralServiceProvided: data['hXyqgOWZ17b'] == 'true',
      serviceProvisionDate:
          data['hXyqgOWZ17b'] == 'true' ? data['lvT9gfpHIlT'] ?? 'N/A' : '',
      followUpRequired: data['Ep3atnNQGTY'] == 'true',
      followUpDate:
          data['Ep3atnNQGTY'] == 'true' ? data['DPf5mUDoZMy'] ?? 'N/A' : 'N/A',
      reasonForReject: data['gEjigBuBTmh'] ?? 'N/A',
    );
  }
}
