import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_service/pages/ovc_service_case_plan_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_monitor/components/monitor_list_container.dart';
import 'package:provider/provider.dart';

class OvcServiceMonitoring extends StatefulWidget {
  const OvcServiceMonitoring({Key? key}) : super(key: key);

  @override
  _OvcServiceMonitoringState createState() => _OvcServiceMonitoringState();
}

class _OvcServiceMonitoringState extends State<OvcServiceMonitoring> {
  List<String> casePlanProgramStageIds = [
    OvcChildCasePlanConstant.casePlanProgramStage
  ];

  updateFormState(
    BuildContext context,
    bool isEditableMode,
    List<Events> casePlanEvents,
    Map<String?, List<Events>> eventListByProgramStage,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Map? sanitizedDataObject;
    List<Events> casePlanGapsEvents = eventListByProgramStage[
            OvcChildCasePlanConstant.casePlanGapProgramStage] ??
        [];

    sanitizedDataObject = OvcCasePlanConstant.getMappedCasePlanWithGapsByDomain(
      casePlanEvents,
      casePlanGapsEvents,
    );

    for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
      String? formSectionId = formSection.id;
      String casePlanToGapLinkage = AppUtil.getUid();
      Map map = sanitizedDataObject.containsKey(formSectionId)
          ? sanitizedDataObject[formSectionId]
          : Map();
      map['gaps'] = map['gaps'] ?? [];
      map[OvcCasePlanConstant.casePlanToGapLinkage] =
          map[OvcCasePlanConstant.casePlanToGapLinkage] ?? casePlanToGapLinkage;
      map[OvcCasePlanConstant.casePlanGapToMonitoringLinkage] =
          map[OvcCasePlanConstant.casePlanGapToMonitoringLinkage] ??
              AppUtil.getUid();
      map[OvcCasePlanConstant.casePlanDomainType] = formSection.id;
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState(formSection.id, map);
    }
  }

  void onViewCasePlan(
    BuildContext context,
    List<Events> casePlanEvents,
    Map<String?, List<Events>> eventListByProgramStage,
  ) {
    bool isEditableMode = false;
    updateFormState(
        context, isEditableMode, casePlanEvents, eventListByProgramStage);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OcvServiceCasePlanForm(
            shouldEditCaseGapServiceProvision: true,
            shouldViewCaseGapServiceProvision: true,
            isServiceMonitoring: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Consumer<ServiceEventDataState>(
            builder: (context, serviceEventDataState, _) {
          bool isLoading = serviceEventDataState.isLoading;
          Map<String?, List<Events>> eventListByProgramStage =
              serviceEventDataState.eventListByProgramStage;

          return isLoading
              ? CircularProgressIndicator()
              : Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MonitoringHomeListContainer(
                        programStageIds: casePlanProgramStageIds,
                        onViewCasePlan: (casePlanEvents) => onViewCasePlan(
                          context,
                          casePlanEvents,
                          eventListByProgramStage,
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
