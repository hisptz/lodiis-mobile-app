import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dream_hts_follow_up.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dreams_index_positive_constant.dart';

class AgywDreamsIndexInfoEvent {
  String id;
  String date;
  String consent;
  String onART;
  String startDateART;
  String enrollmentFacility;
  String htsIndexLinkage;
  String indexInfoToIndexContactLinkage;
  String indexContactToElicitedPartnerLinkage;
  dynamic datavalues;

  Events eventData;

  AgywDreamsIndexInfoEvent({
    this.id,
    this.date,
    this.consent,
    this.onART,
    this.startDateART,
    this.enrollmentFacility,
    this.htsIndexLinkage,
    this.indexInfoToIndexContactLinkage,
    this.indexContactToElicitedPartnerLinkage,
    this.datavalues,
    this.eventData,
  });

  AgywDreamsIndexInfoEvent fromTeiModel(Events eventData) {
    List keys = [
      'eT9Dk0tPnHe',
      'ePGwxaqA5Po',
      'qdN6oXzoUCg',
      'rvZ3SgtvxB5',
      AgywDreamsIndexPositiveConstant.htsToIndexLinkage,
      AgywDreamsIndexPositiveConstant.indexInfoToIndexContactLinkage,
      AgywDreamsHTSFOLLOWUPConstant.indexContactToElicitedPartnerLinkage
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim() ?? '';
      }
    }
    return AgywDreamsIndexInfoEvent(
      id: eventData.event,
      date: eventData.eventDate,
      datavalues: eventData.dataValues,
      consent: data['eT9Dk0tPnHe'] ?? '',
      onART: data['ePGwxaqA5Po'] ?? '',
      startDateART: data['qdN6oXzoUCg'] ?? '',
      enrollmentFacility: data['rvZ3SgtvxB5'] ?? '',
      htsIndexLinkage:
          data[AgywDreamsIndexPositiveConstant.htsToIndexLinkage] ?? '',
      indexInfoToIndexContactLinkage: data[
              AgywDreamsIndexPositiveConstant.indexInfoToIndexContactLinkage] ??
          '',
      indexContactToElicitedPartnerLinkage: data[AgywDreamsHTSFOLLOWUPConstant
              .indexContactToElicitedPartnerLinkage] ??
          '',
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $date $datavalues';
  }
}
