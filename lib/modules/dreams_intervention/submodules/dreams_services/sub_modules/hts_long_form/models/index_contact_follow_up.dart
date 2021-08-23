import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_follow_up_constant.dart';

class IndexContactFollowUp {
  String? id;
  String? date;
  dynamic dataValues;
  Events? eventData;
  String? indexContactToElicitedPartnerLinkage;

  IndexContactFollowUp({
    this.id,
    this.date,
    this.dataValues,
    this.eventData,
    this.indexContactToElicitedPartnerLinkage,
  });

  IndexContactFollowUp fromTeiModel(Events eventData) {
    List keys = [
      AgywDreamsHTSFollowUpConstant.indexContactToElicitedPartnerLinkage
    ];
    Map data = Map();
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return IndexContactFollowUp(
      id: eventData.event,
      date: eventData.eventDate,
      dataValues: eventData.dataValues,
      indexContactToElicitedPartnerLinkage: data[AgywDreamsHTSFollowUpConstant
              .indexContactToElicitedPartnerLinkage] ??
          '',
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
