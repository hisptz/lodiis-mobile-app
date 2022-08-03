import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/event_offline/event_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tei_relationship_offline/tei_relationship_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/none_participation_beneficiary.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/models/tei_relationship.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollement_none_participation_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollment_consent_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_household.dart';

class OvcEnrollmentHouseholdService {
  final String program = 'BNsDaCclOiu';
  final String trackedEntityType = 'XZIKX0bA8WN';
  final List<FormSection> formSections =
      OvcEnrollmentHousehold.getFormSections();
  final List<String> hiddenFields = OvcEnrollmentHousehold.getHiddenField();
  final List<String> consentFields = OvcEnrollmentConstant.getConsentFields();

  Future savingHouseholdForm(
      Map dataObject,
      String? trackedEntityInstance,
      String? orgUnit,
      String? enrollment,
      String? enrollmentDate,
      String? incidentDate,
      bool shouldEnroll,
      List<String> hiddenFields) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(
      formSections,
    );
    hiddenFields = hiddenFields;
    inputFieldIds.addAll(consentFields);
    inputFieldIds.addAll(hiddenFields);
    TrackedEntityInstance trackedEntityInstanceData =
        await FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(
            trackedEntityInstance,
            trackedEntityType,
            orgUnit,
            inputFieldIds,
            dataObject,
            hasBeneficiaryId: false);
    await FormUtil.savingTrackedEntityInstance(trackedEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(
        enrollment,
        enrollmentDate,
        incidentDate,
        orgUnit,
        program,
        trackedEntityInstance,
        dataObject);
    await FormUtil.savingEnrollment(enrollmentData);
  }

  Future<List<OvcHousehold>> getHouseholdList(
      {page,
      Map searchedAttributes = const {},
      List<Map<String, dynamic>> filters = const []}) async {
    List<OvcHousehold> ovcHouseHoldList = [];
    List<String> accessibleOrgUnits = await OrganisationUnitService()
        .getOrganisationUnitAccessedByCurrentUser();
    List<TrackedEntityInstance> allTrackedEntityInstanceList = [];
    try {
      List<Enrollment> enrollments = await EnrollmentOfflineProvider()
          .getEnrollmentsByProgram(program,
              page: page, searchedAttributes: searchedAttributes);
      allTrackedEntityInstanceList =
          await TrackedEntityInstanceOfflineProvider()
              .getTrackedEntityInstanceByIds(enrollments
                  .map((Enrollment enrollment) =>
                      enrollment.trackedEntityInstance)
                  .toList());
      for (Enrollment enrollment in enrollments) {
        List<OrganisationUnit> ous = await OrganisationUnitService()
            .getOrganisationUnits([enrollment.orgUnit]);
        String? location = ous.isNotEmpty ? ous[0].name : enrollment.orgUnit;
        String? orgUnit = enrollment.orgUnit;
        String? createdDate = enrollment.enrollmentDate;
        bool enrollmentOuAccessible = accessibleOrgUnits.contains(orgUnit);
        List<TrackedEntityInstance> houseHolds = allTrackedEntityInstanceList
            .where((tei) =>
                tei.trackedEntityInstance == enrollment.trackedEntityInstance)
            .toList();
        for (TrackedEntityInstance tei in houseHolds) {
          List<TeiRelationship> relationships =
              await TeiRelationshipOfflineProvider()
                  .getTeiRelationships(tei.trackedEntityInstance);
          List<String?> childTeiIds = relationships
              .map((TeiRelationship relationship) => relationship.toTei)
              .toList();
          List<TrackedEntityInstance> houseHoldChildrenTeiData =
              await TrackedEntityInstanceOfflineProvider()
                  .getTrackedEntityInstanceByIds(childTeiIds);
          List<OvcHouseholdChild> houseHoldChildren = houseHoldChildrenTeiData
              .map((TrackedEntityInstance child) => OvcHouseholdChild()
                  .fromTeiModel(
                      child, orgUnit, createdDate, enrollmentOuAccessible))
              .toList();
          try {
            tei =
                getUpdatedHouseholdWithOvcCounts(tei, houseHoldChildrenTeiData);
            FormUtil.savingTrackedEntityInstance(tei);
          } catch (e) {
            //
          }
          ovcHouseHoldList.add(OvcHousehold().fromTeiModel(
            tei,
            location,
            orgUnit,
            createdDate,
            enrollmentOuAccessible,
            houseHoldChildren,
          ));
        }
      }
    } catch (e) {
      //
    }
    if (filters.isNotEmpty) {
      for (Map<String, dynamic> filter in filters) {
        String? implementingPartner = filter['implementingPartner'];
        ovcHouseHoldList = implementingPartner == null
            ? ovcHouseHoldList
            : ovcHouseHoldList
                .where((OvcHousehold household) =>
                    household.implementingPartner == implementingPartner)
                .toList();
      }
    }

    return ovcHouseHoldList;
  }

  Future<int> getHouseholdCount() async {
    return await EnrollmentOfflineProvider().getEnrollmentsCount(program);
  }

  Future<int> getNoneParticipationCount() async {
    String programId = OvcEnrollmentNoneParticipationConstant.program;
    String programStageId = OvcEnrollmentNoneParticipationConstant.programStage;

    return await EventOfflineProvider().getEventsByProgramCount(
        programId: programId, programStageId: programStageId);
  }

  Future<List<NoneParticipationBeneficiary>>
      getNoneParticipationBeneficiaryList(
          {page, Map searchedDataValues = const {}}) async {
    String programId = OvcEnrollmentNoneParticipationConstant.program;
    String programStageId = OvcEnrollmentNoneParticipationConstant.programStage;

    List<NoneParticipationBeneficiary> ovcNoneParticipants =
        await EventOfflineProvider().getEventsByProgram(
      programId: programId,
      programStageId: programStageId,
      page: page,
      searchedDataValues: searchedDataValues,
    );

    return ovcNoneParticipants;
  }

  TrackedEntityInstance getUpdatedHouseholdWithOvcCounts(
    TrackedEntityInstance trackedEntityInstanceData,
    List<TrackedEntityInstance> houseHoldChildren,
  ) {
    int male = 0;
    int female = 0;
    for (var child in houseHoldChildren) {
      for (var attributeObj in child.attributes) {
        if (attributeObj['attribute'] == 'vIX4GTSCX4P') {
          String? sexValue = attributeObj['value'];
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
    for (Map attributeObj in trackedEntityInstanceData.attributes) {
      String? value = attributeObj['value'];
      if (attributeObj['attribute'] == 'kQehaqmaygZ') {
        value = male.toString();
      }
      if (attributeObj['attribute'] == 'BXUNH6LXeGA') {
        value = female.toString();
      }
      Map newMap = {};
      newMap['attribute'] = attributeObj['attribute'];
      newMap['value'] = value;
      attributes.add(newMap);
    }
    trackedEntityInstanceData.attributes = attributes;
    return trackedEntityInstanceData;
  }
}
