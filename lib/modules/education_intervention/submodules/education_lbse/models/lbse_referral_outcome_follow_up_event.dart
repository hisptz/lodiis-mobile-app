import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';

class LbseReferralOutcomeFollowUpEvent {
  String? id;
  String? followUpDate;
  String? followUpStatus;
  String? comments;
  bool? isRequireFollowUp;
  String? referralOutcomeToReferralOutComeFollowingUpLinkage;
  Events? eventData;

  LbseReferralOutcomeFollowUpEvent({
    this.id,
    this.comments,
    this.followUpDate,
    this.followUpStatus,
    this.isRequireFollowUp,
    this.referralOutcomeToReferralOutComeFollowingUpLinkage,
    this.eventData,
  });

  LbseReferralOutcomeFollowUpEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'BzkeBAxdEVT',
      'LcG4J82PM4Z',
      'DPf5mUDoZMy',
      'VHe4ctA0bqU',
      LbseInterventionConstant
          .referralOutcomeToReferralOutComeFollowingUpLinkage,
    ];
    Map<String, dynamic> data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return LbseReferralOutcomeFollowUpEvent(
      id: eventData.event,
      followUpDate: data['DPf5mUDoZMy'] ?? '',
      followUpStatus: data['VHe4ctA0bqU'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      isRequireFollowUp:
          data['BzkeBAxdEVT'] == 'true' && data['VHe4ctA0bqU'] != 'Complete',
      referralOutcomeToReferralOutComeFollowingUpLinkage: data[
              LbseInterventionConstant
                  .referralOutcomeToReferralOutComeFollowingUpLinkage] ??
          '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '<$id>';
  }
}
