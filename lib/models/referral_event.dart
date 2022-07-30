import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

class ReferralEvent {
  String? id;
  String? date;
  String? serviceMode;
  String? type;
  String? category;
  String? status;
  String? location;
  String? referredFromIp;
  String? referredToIp;
  String? comments;
  Events? eventData;
  bool? enrollmentOuAccessible;

  ReferralEvent({
    this.id,
    this.date,
    this.serviceMode,
    this.category,
    this.status,
    this.location,
    this.referredFromIp,
    this.referredToIp,
    this.type,
    this.comments,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  Future<ReferralEvent> fromTeiModel(
    Events eventData,
  ) async {
    List keys = [
      'qAed23reDPP',
      'AuCryxQYmrk',
      'OrC9Bh2bcFz',
      'iifSkIcBZz2',
      'LLWTHwhnch0',
      'rsh5Kvx6qAU',
      'WHktsYoFqat',
      'jOXN2iPhkxj',
      'ubB83OWNWsv',
      'y0bvausyTyh',
      UserAccountReference.implementingPartnerDataElement
    ];
    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    String location = await getLocationByIds(data);
    return ReferralEvent(
      id: eventData.event,
      date: eventData.eventDate,
      serviceMode: data['qAed23reDPP'] ?? '',
      referredToIp: data['y0bvausyTyh'] ?? '',
      referredFromIp:
          data[UserAccountReference.implementingPartnerDataElement] ?? '',
      location: location,
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
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  Future<String> getLocationByIds(Map<String, dynamic> data) async {
    String location = "";
    try {
      List referenceIds = ['jOXN2iPhkxj', 'ubB83OWNWsv'];
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

  @override
  String toString() {
    return '$id $date';
  }
}
