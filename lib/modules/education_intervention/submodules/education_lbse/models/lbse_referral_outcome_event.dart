import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';

class LbseReferralOutcomeEvent {
  String? id;
  String? dateOfServiceProvided;
  String? comments;
  bool? isRequireFollowUp;
  String? referralToReferralOutcomeLinkage;
  String? referralOutcomeToReferralOutComeFollowingUpLinkage;
  bool? enrollmentOuAccessible;
  Events? eventData;

  LbseReferralOutcomeEvent({
    this.id,
    this.dateOfServiceProvided,
    this.comments,
    this.isRequireFollowUp,
    this.referralOutcomeToReferralOutComeFollowingUpLinkage,
    this.referralToReferralOutcomeLinkage,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  LbseReferralOutcomeEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'Ep3atnNQGTY',
      'lvT9gfpHIlT',
      'LcG4J82PM4Z',
      LbseInterventionConstant.referralToReferralOutcomeLinkage,
      LbseInterventionConstant
          .referralOutcomeToReferralOutComeFollowingUpLinkage,
    ];
    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return LbseReferralOutcomeEvent(
      id: eventData.event,
      dateOfServiceProvided: data['lvT9gfpHIlT'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      isRequireFollowUp: data['Ep3atnNQGTY'] == 'true',
      referralToReferralOutcomeLinkage:
          data[LbseInterventionConstant.referralToReferralOutcomeLinkage] ?? '',
      referralOutcomeToReferralOutComeFollowingUpLinkage: data[
              LbseInterventionConstant
                  .referralOutcomeToReferralOutComeFollowingUpLinkage] ??
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
