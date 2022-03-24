import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_index_constant.dart';

class IndexContact {
  String? id;
  String? date;
  String? name;
  dynamic dataValues;
  Events? eventData;
  String? indexInfoToIndexContactLinkage;
  String? indexContactToElicitedPartnerLinkage;

  IndexContact(
      {this.id,
      this.date,
      this.name,
      this.dataValues,
      this.eventData,
      this.indexInfoToIndexContactLinkage,
      this.indexContactToElicitedPartnerLinkage});

  IndexContact fromTeiModel(Events eventData) {
    List keys = [
      AgywDreamsHTSIndexConstant.indexName,
      AgywDreamsHTSIndexConstant.indexInfoToIndexContactLinkage,
      AgywDreamsHTSIndexConstant.indexContactToElicitedSexualPartnerLinkage
    ];
    Map data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return IndexContact(
      id: eventData.event,
      date: eventData.eventDate,
      dataValues: eventData.dataValues,
      indexInfoToIndexContactLinkage:
          data[AgywDreamsHTSIndexConstant.indexInfoToIndexContactLinkage] ?? '',
      name: data[AgywDreamsHTSIndexConstant.indexName] ?? '',
      indexContactToElicitedPartnerLinkage: data[AgywDreamsHTSIndexConstant
          .indexContactToElicitedSexualPartnerLinkage],
      eventData: eventData,
    );
  }

  Map toDataMap() {
    return {
      'type': dataValues.firstWhere(
          (value) => value['dataElement'] == 'CEKq8l9b8DG',
          orElse: () => '')['value'],
      'name': dataValues.firstWhere(
          (value) => value['dataElement'] == 'p9AA21uFn2n',
          orElse: () => '')['value'],
      'dateOfBirth': dataValues.firstWhere(
          (value) => value['dataElement'] == 'Y0QGNDBCEbz',
          orElse: () => '')['value'],
      'age': dataValues.firstWhere(
          (value) => value['dataElement'] == 'cYoXGqzLXLr',
          orElse: () => '')['value'],
      'sex': dataValues.firstWhere(
          (value) => value['dataElement'] == 'mUN2hEf7R57',
          orElse: () => '')['value'],
      'phoneNumber': dataValues.firstWhere(
          (value) => value['dataElement'] == 'mkyHnxwr6QL',
          orElse: () => '')['value'],
      'status': dataValues.firstWhere(
          (value) => value['dataElement'] == 'xTD6pePFLIW',
          orElse: () => '')['value']
    };
  }

  @override
  String toString() {
    return '$id $date $dataValues';
  }
}
