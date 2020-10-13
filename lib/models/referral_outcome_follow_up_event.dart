import 'package:kb_mobile_app/models/events.dart';

class ReferralOutFollowUpComeEvent {
  String id;
  String referralReference;
  Events eventData;

  ReferralOutFollowUpComeEvent({
    this.id,
    this.referralReference,
    this.eventData,
  });

  ReferralOutFollowUpComeEvent fromTeiModel(
    Events eventData,
    String referralToFollowUpLinkage,
  ) {
    List keys = [referralToFollowUpLinkage];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String dataElement = detailObj['dataElement'];
      if (dataElement != null && keys.indexOf(dataElement) > -1) {
        data[dataElement] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return ReferralOutFollowUpComeEvent(
      id: eventData.event,
      referralReference: data[referralToFollowUpLinkage] ?? '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id  ';
  }
}
