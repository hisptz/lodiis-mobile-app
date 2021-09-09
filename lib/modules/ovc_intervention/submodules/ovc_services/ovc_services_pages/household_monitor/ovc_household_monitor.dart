import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/household_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/services_home_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:provider/provider.dart';
import 'components/monitor_list_container.dart';
import 'constants/ovc_household_monitor_constant.dart';
import 'pages/ovc_household_monitor_form.dart';

class OvcHouseholdMonitor extends StatelessWidget {
  final String label = 'Household Monitor';
  final List<String> programStageIds = [
    OvcHouseholdMonitorConstant.programStage
  ];

  final List<String> casePlanProgramStageIds = [
    OvcHouseholdCasePlanConstant.casePlanProgramStage
  ];

  // void updateFormState(
  //     BuildContext context, bool isEditableMode, Events? achievement) {
  //   Provider.of<ServiceFormState>(context, listen: false).resetFormState();
  //   Provider.of<ServiceFormState>(context, listen: false)
  //       .updateFormEditabilityState(isEditableMode: isEditableMode);

  //   if (achievement != null) {
  //     Provider.of<ServiceFormState>(context, listen: false);
  //     Provider.of<ServiceFormState>(context, listen: false)
  //         .setFormFieldState('eventDate', achievement.eventDate);
  //     Provider.of<ServiceFormState>(context, listen: false)
  //         .setFormFieldState('eventId', achievement.event);
  //     for (Map dataValue in achievement.dataValues) {
  //       if (dataValue['value'] != '') {
  //         Provider.of<ServiceFormState>(context, listen: false)
  //             .setFormFieldState(dataValue['dataElement'], dataValue['value']);
  //       }
  //     }
  //   }
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => OvcHouseholdMonitorForm()));
  // }

  // void onAddNewHouseholdMonitor(
  //   BuildContext context,
  //   OvcHousehold? houseHold,
  // ) {
  //   updateFormState(context, true, null);
  // }

  // void onViewHouseholdMonitor(
  //     BuildContext context, OvcHousehold? houseHold, Events monitor) {
  //   updateFormState(context, false, monitor);
  // }

  // void onEditHouseholdMonitor(
  //     BuildContext context, OvcHousehold? houseHold, Events monitor) {
  //   updateFormState(context, true, monitor);
  // }

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
    if (casePlanEvents != null) {
      List<Events> casePlanGapsEvents = eventListByProgramStage[
              OvcHouseholdCasePlanConstant.casePlanGapProgramStage] ??
          [];
      sanitizedDataObject =
          OvcCasePlanConstant.getMappedCasePlanWithGapsByDomain(
        casePlanEvents,
        casePlanGapsEvents,
      );
    }
    for (FormSection formSection
        in HouseholdServicesOngoingMonitoring.getFormSections()) {
      String? formSectionId = formSection.id;
      String casePlanToGapLinkage = AppUtil.getUid();
      Map map = sanitizedDataObject != null &&
              sanitizedDataObject.containsKey(formSectionId)
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
        builder: (context) => OvcHouseholdMonitorForm(
            //   shouldViewCaseGapFollowUp: true,
            //   shouldEditCaseGapFollowUps: true,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<InterventionCardState>(
            builder: (context, interventionCardState, child) {
              InterventionCard activeInterventionProgram =
                  interventionCardState.currentInterventionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            child: Consumer<OvcHouseholdCurrentSelectionState>(
              builder: (context, ovcHouseholdCurrentSelectionState, child) {
                var currentOvcHousehold =
                    ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                return Container(
                  child: Column(
                    children: [
                      OvcHouseholdInfoTopHeader(
                        currentOvcHousehold: currentOvcHousehold,
                      ),
                      Container(
                        child: Consumer<ServiceEventDataState>(
                          builder: (context, serviceEventDataState, child) {
                            bool isLoading = serviceEventDataState.isLoading;
                            Map<String?, List<Events>> eventListByProgramStage =
                                serviceEventDataState.eventListByProgramStage;
                            return isLoading
                                ? CircularProcessLoader(
                                    color: Colors.blueGrey,
                                  )
                                : Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        MonitoringHomeListContainer(
                                          programStageIds:
                                              casePlanProgramStageIds,
                                          onViewCasePlan: (casePlanEvents) =>
                                              onViewCasePlan(
                                            context,
                                            casePlanEvents,
                                            eventListByProgramStage,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
