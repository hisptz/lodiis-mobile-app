import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';

class LbseLearningOutcomeEvent {
  String? id;
  String? theme;
  String? date;
  String? learningOutcome;
  String? referralLinkeage;
  Events? eventData;

  LbseLearningOutcomeEvent({
    this.id,
    this.theme,
    this.learningOutcome,
    this.date,
    this.referralLinkeage,
    this.eventData,
  });

  LbseLearningOutcomeEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'kuMzFGnDULh',
      'mm5ZvlsZ6Sx',
      LbseInterventionConstant.learningOutcomeToReferralLinkage
    ];
    Map<String, dynamic> data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return LbseLearningOutcomeEvent(
      id: eventData.event,
      theme: data['kuMzFGnDULh'] ?? '',
      learningOutcome: data['mm5ZvlsZ6Sx'] ?? '',
      referralLinkeage:
          data[LbseInterventionConstant.learningOutcomeToReferralLinkage] ?? '',
      date: eventData.eventDate,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$theme - $learningOutcome';
  }
}
