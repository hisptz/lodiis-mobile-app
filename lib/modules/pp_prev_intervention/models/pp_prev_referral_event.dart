import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class PpPrevReferralEvent {
  String? id;
  String? referralService;
  String? referralPoint;
  String? referredTo;
  String? referralDate;
  Events? eventData;

  PpPrevReferralEvent({
    this.eventData,
    this.id,
    this.referralDate,
    this.referralPoint,
    this.referralService,
    this.referredTo,
  });

  Future<PpPrevReferralEvent> fromEventModel(Events eventData) async {
    List keys = [
      'IEdBgx4vn1J',
      'h4PRnqfEOCL',
      'k3nt1Qkxat0',
      'OIUDljKyNgy',
    ];

    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }

    String location = await getLocationByIds(data);

    return PpPrevReferralEvent(
      id: eventData.event,
      eventData: eventData,
      referralDate: data['OIUDljKyNgy'] ?? 'N/A',
      referralService: data['IEdBgx4vn1J'] ?? 'N/A',
      referralPoint: data['h4PRnqfEOCL'] ?? 'N/A',
      referredTo: location,
    );
  }

  Future<String> getLocationByIds(Map<String, dynamic> data) async {
    String location = "";
    try {
      List referenceIds = ['k3nt1Qkxat0'];
      List ouIds = referenceIds
          .map((id) => data[id] ?? "")
          .toList()
          .where((id) => id != '')
          .toSet()
          .toList();
      if (ouIds.isNotEmpty) {
        List<OrganisationUnit> ous =
            await OrganisationUnitService().getOrganisationUnits(ouIds);
        location = ous
            .map((OrganisationUnit organisationUnit) => organisationUnit.name)
            .toList()
            .join(", ");
      }
    } catch (e) {
      //
    }

    return location;
  }
}
