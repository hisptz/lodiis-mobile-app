import 'package:kb_mobile_app/models/events.dart';

class ReferralOutcomeFollowUpEvent {
  String? id;
  String? followUpDate;
  String? followUpStatus;
  String? comments;
  String? referralReference;
  bool? additionalFollowUpRequired;
  bool? enrollmentOuAccessible;
  Events? eventData;

  ReferralOutcomeFollowUpEvent({
    this.id,
    this.followUpDate,
    this.followUpStatus,
    this.comments,
    this.referralReference,
    this.additionalFollowUpRequired,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  //TODO refactor this to follow new model
  ReferralOutcomeFollowUpEvent fromTeiModel({
    required Events eventData,
    required String referralToFollowUpLinkage,
  }) {
    List keys = [
      'DPf5mUDoZMy',
      'VHe4ctA0bqU',
      'LcG4J82PM4Z',
      'BzkeBAxdEVT',
      referralToFollowUpLinkage
    ];
    Map data = {};
    for (Map detailObj in eventData.dataValues) {
      String? dataElement = detailObj['dataElement'];
      if (dataElement != null && keys.contains(dataElement)) {
        data[dataElement] = '${detailObj['value']}'.trim();
      }
    }
    return ReferralOutcomeFollowUpEvent(
      id: eventData.event,
      followUpDate: data['DPf5mUDoZMy'] ?? '',
      followUpStatus: data['VHe4ctA0bqU'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      additionalFollowUpRequired: data['BzkeBAxdEVT'] != null
          ? data['BzkeBAxdEVT'] == 'true'
              ? true
              : false
          : true,
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      referralReference: data[referralToFollowUpLinkage] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id  ';
  }
}
