import 'package:kb_mobile_app/models/events.dart';

class OvcReferralEvent {
  String id;
  String date;
  String serviceMode;
  String type;
  String category;
  String status;
  String comments;
  Events eventData;

  OvcReferralEvent({
    this.id,
    this.date,
    this.serviceMode,
    this.category,
    this.status,
    this.type,
    this.comments,
    this.eventData,
  });

  OvcReferralEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'qAed23reDPP',
      'AuCryxQYmrk',
      'OrC9Bh2bcFz',
      'iifSkIcBZz2',
      'LLWTHwhnch0',
      'rsh5Kvx6qAU',
      'WHktsYoFqat'
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return OvcReferralEvent(
      id: eventData.event,
      date: eventData.eventDate,
      serviceMode: data['qAed23reDPP'] ?? '',
      type: data['OrC9Bh2bcFz'] != null && data['OrC9Bh2bcFz'] != ''
          ? data['OrC9Bh2bcFz']
          : data['rsh5Kvx6qAU'] != null && data['rsh5Kvx6qAU'] != ""
              ? data['rsh5Kvx6qAU']
              : '',
      category: data['AuCryxQYmrk'] != null && data['AuCryxQYmrk'] != ''
          ? data['AuCryxQYmrk']
          : data['LLWTHwhnch0'] != null && data['LLWTHwhnch0'] != ''
              ? data['LLWTHwhnch0']
              : '',
      comments: data['iifSkIcBZz2'] != null && data['iifSkIcBZz2'] != ''
          ? data['iifSkIcBZz2']
          : data['WHktsYoFqat'] != null && data['WHktsYoFqat'] != ''
              ? data['WHktsYoFqat']
              : '',
      status: '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date';
  }
}
