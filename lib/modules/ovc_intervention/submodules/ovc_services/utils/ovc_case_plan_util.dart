import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/case_plan_event.dart';
import 'package:kb_mobile_app/models/case_plan_gap_event.dart';
import 'package:kb_mobile_app/models/case_plan_gap_service_monitoring_event.dart';
import 'package:kb_mobile_app/models/case_plan_gap_service_provision_event.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_case_plan_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_case_plan_gap.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';

class OvcCasePlanUtil {
  static Map<String, List<Events>> getCasePlanByDates({
    required Map<String?, List<Events>> eventListByProgramStage,
    required List<String> programStageIds,
  }) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, programStageIds);
    return TrackedEntityInstanceUtil.getGroupedEventByDates(events);
  }

  static bool hasAccessToEdit(List<Events> events) {
    return events.length ==
        events
            .where((Events event) => event.enrollmentOuAccessible!)
            .toList()
            .length;
  }

  static Map getMappedCasePlanWithGapsByDomain({
    required List<Events> casePlanEvents,
    required List<Events> casePlanGapsEvents,
  }) {
    Map casePlanDataObject = {};
    for (Events casePlanEventData in casePlanEvents) {
      CasePlanEvent casePlanEvent =
          CasePlanEvent().toDataModel(eventData: casePlanEventData);
      String domainType = casePlanEvent.domainType!;
      Map casePlanObject = getMappedEventObject(casePlanEvent.eventData!);
      casePlanObject['gaps'] = casePlanGapsEvents
          .map(
            (Events casePlanGapEventData) =>
                CasePlanGapEvent().toDataModel(eventData: casePlanGapEventData),
          )
          .toList()
          .where((casePlanGapEvent) =>
              casePlanGapEvent.casePlanToGap == casePlanEvent.casePlanToGap)
          .toList()
          .map((casePlanGapEvent) =>
              getMappedEventObject(casePlanGapEvent.eventData!))
          .toList();
      casePlanDataObject[domainType] = casePlanObject;
    }
    return casePlanDataObject;
  }

  static Map getMappedEventObject(Events eventData) {
    Map map = {};
    map['eventDate'] = eventData.eventDate;
    map['eventId'] = eventData.event;
    for (Map dataValue in eventData.dataValues) {
      if ('${dataValue['value']}'.trim() != '') {
        map[dataValue['dataElement']] = dataValue['value'];
      }
    }
    return map;
  }

  static bool isAllDomainGoalAndGapFilled(Map dataObject) {
    bool isAllDomainFilled = true;
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String? domainType in dataObject.keys.toList()) {
      Map domainDataObject = dataObject[domainType];
      if (domainDataObject['gaps'].length > 0 &&
          (domainDataObject[casePlanFirstGoal] == null ||
              '${domainDataObject[casePlanFirstGoal]}'.trim() == '')) {
        isAllDomainFilled = false;
      }
    }
    return isAllDomainFilled;
  }

  static List<CasePlanGapServiceProvisionEvent>
      getCasePlanGapServiceProvisionEvents({
    required Map<String?, List<Events>> eventListByProgramStage,
    required List<String> programStageIds,
    required String casePlanGapToServiceProvisionLinkage,
  }) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, programStageIds);
    return events
        .map((eventData) => CasePlanGapServiceProvisionEvent()
            .toDataModel(eventData: eventData))
        .toList()
        .where((casePlanService) =>
            casePlanService.casePlanGapToServiceProvisionLinkage ==
            casePlanGapToServiceProvisionLinkage)
        .toList();
  }

  static List<CasePlanGapServiceMonitoringEvent>
      getCasePlanGapServiceMonitoringEvents({
    required Map<String?, List<Events>> eventListByProgramStage,
    required List<String> programStageIds,
    required String casePlanGapToServiceMonitoringLinkage,
  }) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, programStageIds);
    return events
        .map((eventData) => CasePlanGapServiceMonitoringEvent()
            .toDataModel(eventData: eventData))
        .toList()
        .where((casePlanService) =>
            casePlanService.casePlanGapToServiceMonitoringLinkage ==
            casePlanGapToServiceMonitoringLinkage)
        .toList();
  }

  static Future autoSyncOvcsCasPlanGaps({
    required String currentCasePlanDate,
    required List<OvcHouseholdChild> childrens,
    required Map dataObject,
  }) async {
    try {
      List<FormSection> formSections = OvcServicesCasePlan.getFormSections();
      Map<String, dynamic> sanitizedDataObjects =
          getSanitizedCaregiverDataObjects(dataObject);
      for (OvcHouseholdChild child in childrens) {
        Map childDataObject = await getAutoPopulatingDataObejct(
          currentCasePlanDate,
          child,
          sanitizedDataObjects,
        );
        for (String domainType in childDataObject.keys.toList()) {
          Map domainDataObject = dataObject[domainType];
          List<String> hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanDomainType
          ];
          List<FormSection> domainFormSections = formSections
              .where((FormSection formSection) => formSection.id == domainType)
              .toList();
          List<FormSection> domainGapFormSections =
              OvcServicesChildCasePlanGap.getFormSections(firstDate: '')
                  .where(
                      (FormSection formSection) => formSection.id == domainType)
                  .toList();
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcChildCasePlanConstant.program,
            OvcChildCasePlanConstant.casePlanProgramStage,
            child.orgUnit,
            domainFormSections,
            domainDataObject,
            domainDataObject['eventDate'],
            child.id,
            domainDataObject['eventId'],
            hiddenFields,
          );
          for (Map domainGapDataObject in domainDataObject['gaps']) {
            hiddenFields = [
              OvcCasePlanConstant.casePlanToGapLinkage,
              OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
              OvcCasePlanConstant.casePlanGapToMonitoringLinkage
            ];
            await TrackedEntityInstanceUtil
                .savingTrackedEntityInstanceEventData(
              OvcChildCasePlanConstant.program,
              OvcChildCasePlanConstant.casePlanGapProgramStage,
              child.orgUnit,
              domainGapFormSections,
              domainGapDataObject,
              domainGapDataObject['eventDate'],
              child.id,
              domainGapDataObject['eventId'],
              hiddenFields,
            );
          }
        }
      }
    } catch (e) {
      //
    }
  }

  static Map<String, dynamic> getSanitizedCaregiverDataObjects(
    Map dataObject,
  ) {
    Map<String, dynamic> sanitizedDataObjects = {};
    List<String> domains =
        OvcChildCasePlanConstant.domainToAutopopuledCasePlanGaps.keys.toList();
    for (String domain in domains) {
      List<String> validFields =
          OvcChildCasePlanConstant.domainToAutopopuledCasePlanGaps[domain] ??
              [];
      Map selectedCasePlan = dataObject[domain];
      List gaps = selectedCasePlan['gaps'] ?? [];
      if (gaps.isNotEmpty) {
        List selectedGaps = [];
        for (Map gap in gaps) {
          Map selectedGap = {};
          for (String key in gap.keys.toList()) {
            if (validFields.contains(key)) {
              selectedGap[key] = gap[key];
            }
          }
          if (selectedGap.keys.isNotEmpty) {
            selectedGaps.add(selectedGap);
          }
        }
        if (selectedGaps.isNotEmpty) {
          selectedCasePlan['gaps'] = selectedGaps;
          sanitizedDataObjects[domain] = selectedCasePlan;
        }
      }
    }
    return sanitizedDataObjects;
  }

  static Future<Map<String, dynamic>> getAutoPopulatingDataObejct(
    String currentCasePlanDate,
    OvcHouseholdChild child,
    Map<String, dynamic> caregiverDataObjects,
  ) async {
    Map<String, dynamic> dataObject = {};
    Map domainToAutopopuledCasePlanGaps =
        OvcChildCasePlanConstant.domainToAutopopuledCasePlanGaps;
    List<CasePlanEvent> casePlans =
        await OvcCasePlanService().getCasePlanEvents(
      date: currentCasePlanDate,
      programStageId: OvcChildCasePlanConstant.casePlanProgramStage,
      teiId: child.id!,
    );
    casePlans = casePlans
        .where((casePlan) => domainToAutopopuledCasePlanGaps.keys
            .toList()
            .contains(casePlan.domainType))
        .toList();
    if (casePlans.isEmpty) {
      dataObject = {...dataObject, ...caregiverDataObjects};
    } else {
      List<CasePlanGapEvent> casePlanGaps = await OvcCasePlanService()
          .getCasePlanGapEvents(
              date: currentCasePlanDate,
              programStageId: OvcChildCasePlanConstant.casePlanGapProgramStage,
              teiId: child.id!,
              casePlanToGaps:
                  casePlans.map((casePlan) => casePlan.casePlanToGap).toList());
      List<String> existingDomains =
          casePlans.map((casePlan) => casePlan.domainType!).toList();
      for (String domainType in caregiverDataObjects.keys) {
        for (CasePlanEvent casePlan in casePlans) {
          if (existingDomains.contains(domainType)) {
            Map casePlanObject = casePlan.toDataObject();
            List caregiverGaps = caregiverDataObjects[domainType]['gaps'] ?? [];
            List<Map<String, dynamic>> domainCasePlanGaps = casePlanGaps
                .where((casePlanGap) =>
                    casePlanGap.casePlanToGap == casePlan.casePlanToGap)
                .toList()
                .map((casePlanGap) => casePlanGap.toDataObject())
                .toList();
            casePlanObject['gaps'] = domainCasePlanGaps.isEmpty
                ? caregiverGaps
                : caregiverGaps.map((dynamic caregiverGap) {
                    String eventDate = caregiverGap['eventDate'] ?? '';
                    Map<String, dynamic> selectedDominGap = domainCasePlanGaps
                        .firstWhere((Map<String, dynamic> domainCasePlanGap) {
                      return domainCasePlanGap['eventDate'] == eventDate;
                    }, orElse: () => {});
                    for (String key in caregiverGap.keys.toList()) {
                      if (key != 'eventId') {
                        selectedDominGap[key] = caregiverGap[key];
                      }
                    }
                    return selectedDominGap;
                  }).toList();
            dataObject[domainType] = casePlanObject;
          } else {
            dataObject[domainType] = caregiverDataObjects[domainType];
          }
        }
      }
    }
    return dataObject;
  }
}
