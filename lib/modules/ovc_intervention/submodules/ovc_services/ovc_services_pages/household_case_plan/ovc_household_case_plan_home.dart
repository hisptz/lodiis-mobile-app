import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan/case_plan_home_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/pages/ovc_household_case_plan_form.dart';
import 'package:provider/provider.dart';

class OvcHouseholdCasePlanHome extends StatefulWidget {
  const OvcHouseholdCasePlanHome({Key? key}) : super(key: key);

  @override
  State<OvcHouseholdCasePlanHome> createState() =>
      _OvcHouseholdCasePlanHomeState();
}

class _OvcHouseholdCasePlanHomeState extends State<OvcHouseholdCasePlanHome> {
  final String label = 'Household Case plan';

  final List<String> casePlanProgramStageIds = [
    OvcHouseholdCasePlanConstant.casePlanProgramStage
  ];

  final List<String> casePlanGapProgramStageIds = [
    OvcHouseholdCasePlanConstant.casePlanGapProgramStage
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
          casePlanEvents.isNotEmpty ? casePlanEvents[0].eventDate : eventDate;
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
          : {};
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
    return groupedEventByDates.keys.toList().contains(today);
  }

  void onAddNewCasePlan(
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
          builder: (context) => const OvcHouseholdCasePlanForm(),
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
        builder: (context) => OvcHouseholdCasePlanForm(
          hasEditAccess:
              AppUtil.hasAccessToEditCasePlanServiceData(casePlanEvents),
          shouldViewCaseGapServiceProvision: true,
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
        builder: (context) => OvcHouseholdCasePlanForm(
          hasEditAccess:
              AppUtil.hasAccessToEditCasePlanServiceData(casePlanEvents),
          shouldViewCaseGapServiceProvision: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
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
        body: Consumer<OvcHouseholdCurrentSelectionState>(
          builder: (context, ovcHouseholdCurrentSelectionState, child) {
            OvcHousehold? currentOvcHousehold =
                ovcHouseholdCurrentSelectionState.currentOvcHousehold;
            return Column(
              children: [
                OvcHouseholdInfoTopHeader(
                  currentOvcHousehold: currentOvcHousehold,
                ),
                CasePlanHomeContainer(
                  casePlanProgram: OvcHouseholdCasePlanConstant.program,
                  casePlanProgramStage:
                      OvcHouseholdCasePlanConstant.casePlanProgramStage,
                  casePlanGapProgramStage:
                      OvcHouseholdCasePlanConstant.casePlanGapProgramStage,
                  casePlanServiceProgramStage: OvcHouseholdCasePlanConstant
                      .casePlanGapServiceProvisionProgramStage,
                  casePlanMonitoringProgramStage: OvcHouseholdCasePlanConstant
                      .casePlanGapServiceMonitoringProgramStage,
                  enrollmentOuAccessible:
                      currentOvcHousehold!.enrollmentOuAccessible!,
                  isHouseholdCasePlan: true,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
