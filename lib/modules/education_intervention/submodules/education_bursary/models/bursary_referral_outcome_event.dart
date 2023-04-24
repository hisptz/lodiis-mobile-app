import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_intervention_constant.dart';

class BursaryReferralOutcomeEvent {
  String? id;
  String? dateOfServiceProvided;
  String? eventDate;
  String? comments;
  bool? isRequireFollowUp;
  String? referralToReferralOutcomeLinkage;
  String? referralOutcomeToReferralOutComeFollowingUpLinkage;
  bool? enrollmentOuAccessible;
  Events? eventData;

  BursaryReferralOutcomeEvent({
    this.id,
    this.eventDate,
    this.dateOfServiceProvided,
    this.comments,
    this.isRequireFollowUp,
    this.referralOutcomeToReferralOutComeFollowingUpLinkage,
    this.referralToReferralOutcomeLinkage,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  BursaryReferralOutcomeEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'lvT9gfpHIlT',
      'LcG4J82PM4Z',
      'Ep3atnNQGTY',
      BursaryInterventionConstant
          .clubAttendanceReferralToReferralOutcomeLinkage,
      BursaryInterventionConstant
          .clubAttendanceReferralOutcomeToReferralOutComeFollowingUpLinkage,
    ];
    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return BursaryReferralOutcomeEvent(
      id: eventData.event,
      eventDate: eventData.eventDate,
      dateOfServiceProvided: data['lvT9gfpHIlT'] ?? '',
      comments: data['LcG4J82PM4Z'] ?? '',
      isRequireFollowUp: data['Ep3atnNQGTY'] == 'true',
      referralToReferralOutcomeLinkage: data[BursaryInterventionConstant
              .clubAttendanceReferralToReferralOutcomeLinkage] ??
          '',
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
