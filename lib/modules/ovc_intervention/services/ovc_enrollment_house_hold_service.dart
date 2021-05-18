import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollment_consent_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_house_hold.dart';

class OvcEnrollmentHouseHoldService {
  final String program = 'BNsDaCclOiu';
  final String trackedEntityType = 'XZIKX0bA8WN';
  final List<FormSection> formSections =
      OvcEnrollmentHouseHold.getFormSections();
  final List<String> hiddenFields = OvcEnrollmentHouseHold.getHiddenField();
  final List<String> consentFields = OvcEnrollmentConstant.getConsentFields();

  Future savingHouseHoldform(
      Map dataObject,
      String trackedEntityInstance,
      String orgUnit,
      String enrollment,
      String enrollmentDate,
      String incidentDate,
      bool shouldEnroll,
      List<String> hiddenFields) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    hiddenFields = hiddenFields ?? [];
    inputFieldIds.addAll(consentFields);
    inputFieldIds.addAll(hiddenFields);
    TrackeEntityInstance trackeEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            trackedEntityType,
            orgUnit,
            inputFieldIds,
            dataObject,
            hasBeneficiaryId: false);
    await FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
    if (shouldEnroll) {
      Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
          enrollment,
          enrollmentDate,
          incidentDate,
          orgUnit,
          program,
          trackedEntityInstance);
      await FormUtil.savingEnrollment(enrollmentData);
    }
  }

  Future<List<OvcHouseHold>> getHouseHoldList(
      {page, String searchableValue = ''}) async {
    List<OvcHouseHold> ovchouseHoldList = [];

    List<TrackeEntityInstance> allTrackedEntityInstanceList = [];

    try {
      List<Enrollment> enrollments = await EnrollmentOfflineProvider()
          .getEnrollements(program, page: page);
      allTrackedEntityInstanceList =
          await TrackedEntityInstanceOfflineProvider().getTrackedEntityInstance(
              enrollments.map((e) => e.trackedEntityInstance).toList());

      for (Enrollment enrollment in enrollments) {
        // get location
        List<OrganisationUnit> ous = await OrganisationUnitService()
            .getOrganisationUnits([enrollment.orgUnit]);
        String location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
        String orgUnit = enrollment.orgUnit;
        String createdDate = enrollment.enrollmentDate;
        //loading households
        List<TrackeEntityInstance> houseHolds = allTrackedEntityInstanceList
            .where((tei) =>
                tei.trackedEntityInstance == enrollment.trackedEntityInstance)
            .toList();
        // loop house hold/caregiver
        for (TrackeEntityInstance tei in houseHolds) {
          List<TeiRelationship> relationships =
              await TeiRelatioShipOfflineProvider()
                  .getTeirelationShips(tei.trackedEntityInstance);
          List<String> childTeiIds = relationships
              .map((TeiRelationship relationship) => relationship.toTei)
              .toList();
          List<TrackeEntityInstance> houseHoldChildrenTeiData =
              await TrackedEntityInstanceOfflineProvider()
                  .getTrackedEntityInstance(childTeiIds);
          //assign household data
          List<OvcHouseHoldChild> houseHoldChildren = houseHoldChildrenTeiData
              .map((TrackeEntityInstance child) =>
                  OvcHouseHoldChild().fromTeiModel(child, orgUnit, createdDate))
              .toList();
          // update ovc counts
          try {
            tei =
                getUpdatedHouseHoldWithOvcCounts(tei, houseHoldChildrenTeiData);
            FormUtil.savingTrackeEntityInstance(tei);
          } catch (e) {}
          ovchouseHoldList.add(OvcHouseHold().fromTeiModel(
              tei, location, orgUnit, createdDate, houseHoldChildren));
        }
      }
    } catch (e) {}
    return searchableValue == ''
        ? ovchouseHoldList
        : ovchouseHoldList
            .where((OvcHouseHold beneficiary) =>
                beneficiary.searchableValue
                    .toLowerCase()
                    .indexOf(searchableValue.toLowerCase()) !=
                -1)
            .toList();
  }

  Future<int> getHouseholdCount() async {
    return await EnrollmentOfflineProvider().getEnrollmentsCount(program);
  }

  TrackeEntityInstance getUpdatedHouseHoldWithOvcCounts(
    TrackeEntityInstance trackeEntityInstanceData,
    List<TrackeEntityInstance> houseHoldChildren,
  ) {
    int male = 0;
    int female = 0;
    for (var child in houseHoldChildren) {
      for (var attributeObj in child.attributes) {
        if (attributeObj['attribute'] == 'vIX4GTSCX4P') {
          String sexValue = attributeObj['value'];
          if (sexValue != null) {
            if (sexValue == 'Male') {
              male++;
            } else if (sexValue == 'Female') {
              female++;
            }
          }
        }
      }
    }
    List<dynamic> attributes = [];
    for (Map attributeObj in trackeEntityInstanceData.attributes) {
      String value = attributeObj['value'];
      if (attributeObj['attribute'] == 'kQehaqmaygZ') {
        value = male.toString();
      }
      if (attributeObj['attribute'] == 'BXUNH6LXeGA') {
        value = female.toString();
      }
      Map newMap = Map();
      newMap['attribute'] = attributeObj['attribute'];
      newMap['value'] = value;
      attributes.add(newMap);
    }
    trackeEntityInstanceData.attributes = attributes;
    return trackeEntityInstanceData;
  }
}
