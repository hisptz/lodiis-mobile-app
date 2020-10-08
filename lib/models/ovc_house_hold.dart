import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcHouseHold {
  String id;
  String firstName;
  String middleName;
  String surname;
  String location;
  String orgUnit;
  String createdDate;
  String houseHoldId;
  String ovcMaleCount;
  String ovcFemaleCount;
  String houseHoldStatus;
  List<OvcHouseHoldChild> children;
  TrackeEntityInstance teiData;

  OvcHouseHold({
    this.id,
    this.firstName,
    this.middleName,
    this.surname,
    this.ovcMaleCount,
    this.children,
    this.houseHoldId,
    this.location,
    this.orgUnit,
    this.createdDate,
    this.ovcFemaleCount,
    this.houseHoldStatus,
    this.teiData,
  });

  OvcHouseHold fromTeiModel(
    TrackeEntityInstance tei,
    String location,
    String orgUnit,
    String createdDate,
    List<OvcHouseHoldChild> children,
  ) {
    List keys = [
      'WTZ7GLTrE8Q',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'kQehaqmaygZ',
      'BXUNH6LXeGA',
      'yk0OH9p09C1',
      'PN92g65TkVI'
    ];
    Map data = Map();
    for (Map attributOj in tei.attributes) {
      String attribute = attributOj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${attributOj['value']}'.trim() ?? '';
      }
    }
    return OvcHouseHold(
        id: tei.trackedEntityInstance,
        firstName: data['WTZ7GLTrE8Q'] ?? '',
        middleName: data['s1HaiT6OllL'] ?? '',
        surname: data['rSP9c21JsfC'] ?? '',
        location: location,
        orgUnit: orgUnit,
        createdDate: createdDate,
        ovcMaleCount: data['kQehaqmaygZ'] ?? '',
        ovcFemaleCount: data['BXUNH6LXeGA'] ?? '',
        houseHoldId: data['yk0OH9p09C1'] ?? '',
        houseHoldStatus: data['PN92g65TkVI'] ?? '',
        children: children,
        teiData: tei);
  }

  @override
  String toString() {
    return '$firstName $surname';
  }
}
