import 'package:kb_mobile_app/models/events.dart';

class OvcReferralCard {
  String id;
  String date;
  String type;
  String category;
  String status;
  String comments;
  Events eventData;

  OvcReferralCard({
    this.id,
    this.date,
    this.category,
    this.status,
    this.type,
    this.comments,
    this.eventData,
  });

  OvcReferralCard fromTeiModel(
    Events eventData,
  ) {
    List keys = [
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
    return OvcReferralCard(
      id: eventData.event,
      date: eventData.eventDate,
      type: data['OrC9Bh2bcFz'] ?? data['rsh5Kvx6qAU'] ?? '',
      category: data['AuCryxQYmrk'] ?? data['LLWTHwhnch0'] ?? '',
      comments: data['iifSkIcBZz2'] ?? data['WHktsYoFqat'] ?? '',
      status: '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date';
  }
}
