import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
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
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/pages/ovc_child_case_plan_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_home_list_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';
import 'package:provider/provider.dart';

class OvcChildCasePlanHome extends StatelessWidget {
  final String label = 'Child Care Plan';
  final List<String> programStageIds = [
    OvcChildCasePlanConstant.casePlanProgramStage
  ];

  updateformState(BuildContext context, OvcHouseHoldChild child) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    String casePlanToGapLinkage = AppUtil.getUid();
    for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
      // @TODO update state accordingly
      Map map = Map();
      map['gaps'] = [];
      map[OvcCasePlanConstant.casePlanToGapLinkage] = casePlanToGapLinkage;
      map[OvcCasePlanConstant.casePlanDomainType] = formSection.id;
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState(formSection.id, map);
    }
  }

  isCasePlanExit(Map<String, List<Events>> eventListByProgramStage) {
    List<Events> events =
        TrackedEntityInstanceUtil.getAllEventListFromServiceDataState(
            eventListByProgramStage, programStageIds);
    Map groupedEventByDates =
        TrackedEntityInstanceUtil.getGroupedEventByDates(events);
    String today = AppUtil.formattedDateTimeIntoString(DateTime.now());
    return groupedEventByDates.keys.toList().indexOf(today) > -1;
  }

  void onAddNewAssessment(
    BuildContext context,
    OvcHouseHoldChild child,
    Map<String, List<Events>> eventListByProgramStage,
  ) {
    if (isCasePlanExit(eventListByProgramStage)) {
      AppUtil.showToastMessage(
          message: 'There is exiting case plan that has already created',
          position: ToastGravity.TOP);
    } else {
      updateformState(context, child);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OcvChildCasePlanForm()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
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
              Consumer<OvcHouseHoldCurrentSelectionState>(
                builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                  OvcHouseHoldChild currentOvcHouseHoldChild =
                      ovcHouseHoldCurrentSelectionState
                          .currentOvcHouseHoldChild;
                  return Container(
                    child: Consumer<ServiveEventDataState>(
                      builder: (context, serviveEventDataState, child) {
                        bool isLoading = serviveEventDataState.isLoading;
                        Map<String, List<Events>> eventListByProgramStage =
                            serviveEventDataState.eventListByProgramStage;
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
                                      programStageIds: programStageIds,
                                    ),
                                    Container(
                                      child: Visibility(
                                        visible: !isLoading,
                                        child: OvcEnrollmentFormSaveButton(
                                          label: "NEW CASEPLAN",
                                          labelColor: Colors.white,
                                          fontSize: 10,
                                          buttonColor: Color(0xFF4B9F46),
                                          onPressButton: () =>
                                              onAddNewAssessment(
                                                  context,
                                                  currentOvcHouseHoldChild,
                                                  eventListByProgramStage),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  );
                },
              )
            ]),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
