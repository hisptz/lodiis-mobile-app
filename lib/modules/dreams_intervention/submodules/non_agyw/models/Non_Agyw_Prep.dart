import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class PrepVisit {
  String id;
  String dateVisit;
  String orgUnit;
  TrackeEntityInstance teiData;

  PrepVisit({
    this.id,
    this.dateVisit,
    this.teiData,
    this.orgUnit
  });

  PrepVisit fromTeiModel(
    TrackeEntityInstance tei,
    String location,
    String orgUnit,
    String createdDate,
    String enrollment,
  ) {
    List keys = [
      'm0G5RLlWR9W',
    ];
    Map data = Map();
    for (Map attributOj in tei.attributes) {
      String attribute = attributOj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${attributOj['value']}'.trim() ?? '';
      }
    }
    return PrepVisit(
        id: tei.trackedEntityInstance,
        dateVisit: data['m0G5RLlWR9W'],
        orgUnit: orgUnit,
        teiData: tei);
  }

  @override
  String toString() {
    return '$dateVisit';
  }
}
