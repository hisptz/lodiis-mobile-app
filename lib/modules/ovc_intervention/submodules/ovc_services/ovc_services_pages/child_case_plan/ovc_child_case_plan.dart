import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/pages/ovc_child_case_plan_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_home_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:provider/provider.dart';

class OvcChildCasePlan extends StatelessWidget {
  final String label = 'Child Case Plan';
  final List<String> casePlanProgramStageIds = [
    OvcChildCasePlanConstant.casePlanProgramStage
  ];

  final List<String> casePlanGapProgramStageIds = [
    OvcChildCasePlanConstant.casePlanGapProgramStage
  ];

  updateformState(
    BuildContext context,
    bool isEditableMode,
    List<Events>? casePlanEvents,
    Map<String?, List<Events>> eventListByProgramStage,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Map? sanitizedDataObject;
    String? eventDate;
    if (casePlanEvents != null) {
      eventDate =
          casePlanEvents.length > 0 ? casePlanEvents[0].eventDate : eventDate;
      List<Events> casePlanGapsEvents = eventListByProgramStage[
              OvcChildCasePlanConstant.casePlanGapProgramStage] ??
          [];
      sanitizedDataObject =
          OvcCasePlanConstant.getMappedCasePlanWithGapsByDomain(
        casePlanEvents,
        casePlanGapsEvents,
      );
    }
    for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
      String? formSectionId = formSection.id;
      String casePlanToGapLinkage = AppUtil.getUid();
      Map map = sanitizedDataObject != null &&
              sanitizedDataObject.containsKey(formSectionId)
          ? sanitizedDataObject[formSectionId]
          : Map();

      map['gaps'] = map['gaps'] ?? [];
      map['eventDate'] = map['eventDate'] ?? eventDate;
      map[OvcCasePlanConstant.casePlanToGapLinkage] =
          map[OvcCasePlanConstant.casePlanToGapLinkage] ?? casePlanToGapLinkage;
      map[OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage] =
          map[OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage] ??
              AppUtil.getUid();
      map[OvcCasePlanConstant.casePlanDomainType] = formSection.id;
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState(formSection.id, map);
    }
  }

  isCasePlanExit(Map<String?, List<Events>> eventListByProgramStage) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, casePlanProgramStageIds);
    Map groupedEventByDates =
        TrackedEntityInstanceUtil.getGroupedEventByDates(events);
    String today = AppUtil.formattedDateTimeIntoString(DateTime.now());
    return groupedEventByDates.keys.toList().indexOf(today) > -1;
  }

  void onAddNewAssessment(
    BuildContext context,
    Map<String?, List<Events>> eventListByProgramStage,
  ) {
    bool isEditableMode = true;
    if (isCasePlanExit(eventListByProgramStage)) {
      AppUtil.showToastMessage(
          message: 'There is exiting case plan that has already created',
          position: ToastGravity.TOP);
    } else {
      updateformState(context, isEditableMode, null, eventListByProgramStage);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OcvChildCasePlanForm(),
        ),
      );
    }
  }

  void onEditCasePlan(
    BuildContext context,
    List<Events> casePlanEvents,
    Map<String?, List<Events>> eventListByProgramStage,
  ) {
    bool isEditableMode = true;
    updateformState(
        context, isEditableMode, casePlanEvents, eventListByProgramStage);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OcvChildCasePlanForm(
          shouldAddCasePlanGap: true,
        ),
      ),
    );
  }

  void onViewCasePlan(
    BuildContext context,
    List<Events> casePlanEvents,
    Map<String?, List<Events>> eventListByProgramStage,
  ) {
    bool isEditableMode = false;
    updateformState(
        context, isEditableMode, casePlanEvents, eventListByProgramStage);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OcvChildCasePlanForm(
          shoulViewCaseGapServiceProvision: true,
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
            child: Column(children: [
              OvcChildInfoTopHeader(),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CasePlanHomeListContainer(
                                    programStageIds: casePlanProgramStageIds,
                                    onEditCasePlan: (casePlanEvents) =>
                                        onEditCasePlan(
                                          context,
                                          casePlanEvents,
                                          eventListByProgramStage,
                                        ),
                                    onViewCasePlan: (casePlanEvents) =>
                                        onViewCasePlan(
                                          context,
                                          casePlanEvents,
                                          eventListByProgramStage,
                                        )),
                                Container(
                                  child: Visibility(
                                    visible: !isLoading,
                                    child: EntryFormSaveButton(
                                      label: 'NEW CASE PLAN',
                                      labelColor: Colors.white,
                                      fontSize: 10,
                                      buttonColor: Color(0xFF4B9F46),
                                      onPressButton: () => onAddNewAssessment(
                                          context, eventListByProgramStage),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              )
            ]),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
