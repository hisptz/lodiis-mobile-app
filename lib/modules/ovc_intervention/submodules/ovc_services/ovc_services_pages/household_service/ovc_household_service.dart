import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/services_home_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/pages/household_service_form.dart';
import 'package:provider/provider.dart';

class OvcHouseholdService extends StatelessWidget {
  final String label = 'Household Service Provision';
  final String translatedServiceProvisionLabel = 'Litsebeletso tsa lelapa';

  final List<String> casePlanProgramStageIds = [
    OvcHouseholdCasePlanConstant.casePlanProgramStage
  ];

  final List<String> casePlanGapProgramStageIds = [
    OvcHouseholdCasePlanConstant.casePlanGapProgramStage
  ];

  updateformState(
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
    for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
      String? formSectionId = formSection.id;
      String casePlanToGapLinkage = AppUtil.getUid();
      Map map = sanitizedDataObject != null &&
              sanitizedDataObject.containsKey(formSectionId)
          ? sanitizedDataObject[formSectionId]
          : Map();
      map['gaps'] = map['gaps'] ?? [];
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

  isCasePlanExit(Map<String, List<Events>> eventListByProgramStage) {
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, casePlanProgramStageIds);
    Map groupedEventByDates =
        TrackedEntityInstanceUtil.getGroupedEventByDates(events);
    String today = AppUtil.formattedDateTimeIntoString(DateTime.now());
    return groupedEventByDates.keys.toList().indexOf(today) > -1;
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
        builder: (context) => HouseholdServiceForm(
          hasEditAccess:
              AppUtil.hasAccessToEditCasePlanServiceData(casePlanEvents),
          shouldViewCaseGapServiceProvision: true,
          shouldEditCaseGapServiceProvision: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Consumer<LanguageTranslationState>(
          builder: (context, languageTranslationState, child) {
            String? currentLanguage = languageTranslationState.currentLanguage;
            return Consumer<InterventionCardState>(
              builder: (context, interventionCardState, child) {
                InterventionCard activeInterventionProgram =
                    interventionCardState.currentInterventionProgram;
                return SubPageAppBar(
                  label: currentLanguage != 'lesotho'
                      ? label
                      : translatedServiceProvisionLabel,
                  activeInterventionProgram: activeInterventionProgram,
                );
              },
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ServicesHomeListContainer(
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
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
