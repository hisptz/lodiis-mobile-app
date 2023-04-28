import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';

class BursaryReferralOutcomeFollowUpEvent {
  String? id;
  String? followUpDate;
  String? followUpStatus;
  String? comments;
  bool? isRequireFollowUp;
  String? referralOutcomeToReferralOutComeFollowingUpLinkage;
  bool? enrollmentOuAccessible;
  Events? eventData;

  BursaryReferralOutcomeFollowUpEvent({
    this.id,
    this.comments,
    this.followUpDate,
    this.followUpStatus,
    this.isRequireFollowUp,
    this.referralOutcomeToReferralOutComeFollowingUpLinkage,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  BursaryReferralOutcomeFollowUpEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'DPf5mUDoZMy',
      'BzkeBAxdEVT',
      'VHe4ctA0bqU',
      'LcG4J82PM4Z',
      BursaryInterventionConstant
          .clubAttendanceReferralOutcomeToReferralOutComeFollowingUpLinkage
    ];
    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return BursaryReferralOutcomeFollowUpEvent(
      id: eventData.event,
      followUpDate: data['DPf5mUDoZMy'] ?? '',
      followUpStatus: data['VHe4ctA0bqU'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      isRequireFollowUp:
          data['BzkeBAxdEVT'] == 'true' && data['VHe4ctA0bqU'] != 'Complete',
      referralOutcomeToReferralOutComeFollowingUpLinkage: data[
              BursaryInterventionConstant
                  .clubAttendanceReferralOutcomeToReferralOutComeFollowingUpLinkage] ??
          '',
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '<$id>';
  }
}
