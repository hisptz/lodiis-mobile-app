import 'package:kb_mobile_app/models/events.dart';

class CLOReferralEvent {
  String? id;
  String? referralDate;
  String? referralFor;
  String? outComeStatus;
  String? communityPartner;
  String? referralType;

  CLOReferralEvent(
      {this.id,
      this.referralDate,
      this.referralFor,
      this.outComeStatus,
      this.communityPartner});

  CLOReferralEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = ['OIUDljKyNgy', 'rWIw1JHPiTo', 'pdUklLmaauR', 'RiNop7mvTRW'];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return CLOReferralEvent(
      id: eventData.event,
      referralDate: data['OIUDljKyNgy'] ?? eventData.eventDate,
      referralFor: data['rWIw1JHPiTo'] ?? '',
      outComeStatus: data['pdUklLmaauR'] != null && data['pdUklLmaauR'] != ''
          ? data['pdUklLmaauR']
          : '',
      communityPartner: data['RiNop7mvTRW'] != null && data['RiNop7mvTRW'] != ''
          ? data['RiNop7mvTRW']
          : '',
    );
  }

  @override
  String toString() {
    return '$id $referralDate';
  }
}
