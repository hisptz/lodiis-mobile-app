import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';

class LbseReferralEvent {
  String? id;
  String? date;
  String? casetType;
  String? referralTo;
  String? description;
  String? referralToReferralOutcomeLinkage;
  Events? eventData;

  LbseReferralEvent({
    this.id,
    this.date,
    this.casetType,
    this.referralTo,
    this.description,
    this.referralToReferralOutcomeLinkage,
    this.eventData,
  });

  LbseReferralEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'CoUEvTpNjvO',
      'hpuu3TCZkKx',
      'OT97N8oZhpF',
      LbseInterventionConstant.referralToReferralOutcomeLinkage,
    ];
    Map<String, dynamic> data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return LbseReferralEvent(
      id: eventData.event,
      casetType: data['CoUEvTpNjvO'] ?? '',
      referralTo: data['hpuu3TCZkKx'] ?? '',
      description: data['OT97N8oZhpF'] ?? '',
      referralToReferralOutcomeLinkage:
          data[LbseInterventionConstant.referralToReferralOutcomeLinkage] ?? '',
      date: eventData.eventDate,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return 'casetType => $casetType referralTop => $referralTo';
  }
}
