import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/case_plan_gap_service_provision_event.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_case_plan_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_service_provision.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';

class OvcCasePlanServiceProvisionHouseholdToOvcUtil {
  static Future autoSyncOvcsCasePlanServiceProvisions({
    required List<OvcHouseholdChild> childrens,
    required Map dataObject,
    required String domainId,
    required String orgUnit,
  }) async {
    try {
      List<FormSection> formSections =
          OvcServicesChildServiceProvision.getFormSections(firstDate: '')
              .where((formSection) => formSection.id == domainId)
              .toList();
      Map<String, dynamic> sanitizedDataObjects =
          getSanitizedCaregiverDataObjects(
              dataObject: dataObject, domainId: domainId);
      if (sanitizedDataObjects.isNotEmpty) {
        String casePlanDate = dataObject['casePlanDate'] ?? '';
        String casePlanGapToServiceProvisionLinkage = dataObject[
                OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage] ??
            '';
        for (OvcHouseholdChild child in childrens) {
          Map<String, dynamic> dataObject =
              await getChildServiceProvisionObject(casePlanDate, child,
                  casePlanGapToServiceProvisionLinkage, sanitizedDataObjects);
          if (dataObject.isNotEmpty) {
            await TrackedEntityInstanceUtil
                .savingTrackedEntityInstanceEventData(
              OvcChildCasePlanConstant.program,
              OvcChildCasePlanConstant.casePlanGapServiceProvisionProgramStage,
              orgUnit,
              formSections,
              dataObject,
              dataObject['eventDate'],
              child.id,
              dataObject['eventId'],
              [OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage],
            );
          }
        }
      }
    } catch (e) {
      //
    }
  }

  static Future<Map<String, dynamic>> getChildServiceProvisionObject(
    String casePlanDate,
    OvcHouseholdChild child,
    String casePlanGapToServiceProvisionLinkage,
    Map<String, dynamic> sanitizedDataObjects,
  ) async {
    Map<String, dynamic> dataObject = {};
    List<CasePlanGapServiceProvisionEvent> gapServiceProvisions =
        await OvcCasePlanService().getCasePlanServiceProvisonEvents(
            date: casePlanDate,
            programStageId: OvcChildCasePlanConstant
                .casePlanGapServiceProvisionProgramStage,
            teiId: child.id!,
            casePlanGapToServiceProvisionLinkage:
                casePlanGapToServiceProvisionLinkage);
    if (gapServiceProvisions.isNotEmpty) {
      dataObject = gapServiceProvisions.first.toDataObject();
    }
    dataObject = {...dataObject, ...sanitizedDataObjects};
    return dataObject;
  }

  static Map<String, dynamic> getSanitizedCaregiverDataObjects({
    required Map dataObject,
    required String domainId,
  }) {
    Map<String, dynamic> sanitizedDataObjects = {};
    List<String> validFields = OvcChildCasePlanConstant
            .domainToAutopopuledCasePlanServiceProvision[domainId] ??
        [];
    for (String key in dataObject.keys) {
      if (validFields.contains(key)) {
        sanitizedDataObjects[key] = dataObject[key];
      }
    }
    return sanitizedDataObjects;
  }
}
