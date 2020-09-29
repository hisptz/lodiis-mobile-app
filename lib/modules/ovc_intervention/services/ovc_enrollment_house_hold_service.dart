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
  ) async {
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    inputFieldIds.addAll(consentFields);
    inputFieldIds.addAll(hiddenFields);
    // @TODO generation of beneficiary ids
    TrackeEntityInstance trackeEntityInstanceData =
        FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(trackedEntityInstance,
            trackedEntityType, orgUnit, inputFieldIds, dataObject);
    FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(enrollment,
        enrollmentDate, incidentDate, orgUnit, program, trackedEntityInstance);
    FormUtil.savingEnrollment(enrollmentData);
  }

  Future<List<OvcHouseHold>> getHouseHoldList() async {
    List<OvcHouseHold> ovchouseHoldList = [];
    try {
      List<Enrollment> enrollments =
          await EnrollmentOfflineProvider().getEnrollements(program);
      for (Enrollment enrollment in enrollments) {
        // get location
        List<OrganisationUnit> ous = await OrganisationUnitService()
            .getOrganisationUnits([enrollment.orgUnit]);
        String location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
        String orgUnit = enrollment.orgUnit;
        String createdDate = enrollment.enrollmentDate;
        String enrollmentId = enrollment.enrollment;
        //loading households
        List<TrackeEntityInstance> houseHolds =
            await TrackedEntityInstanceOfflineProvider()
                .getTrackedEntityInstance([enrollment.trackedEntityInstance]);
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
              .map((TrackeEntityInstance child) => OvcHouseHoldChild()
                  .fromTeiModel(child, orgUnit, createdDate, enrollmentId))
              .toList();
          ovchouseHoldList.add(OvcHouseHold().fromTeiModel(tei, location,
              orgUnit, createdDate, enrollmentId, houseHoldChildren));
        }
      }
    } catch (e) {}
    return ovchouseHoldList;
  }
}
