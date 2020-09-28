import 'dart:ui';
import 'package:flutter/material.dart';
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
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/componets/ovc_child_assessment_list_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/componets/ovc_child_assessment_selection.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/constants/ovc_asessment_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/ovc_service_hiv_assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/ovc_service_tb__assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/sub_pages/child_asessment/pages/ovc_service_well_being_assessment_form.dart';
import 'package:provider/provider.dart';

class OvcAssessmentServiceChildView extends StatelessWidget {
  final String label = 'Child Assessment';

  onAddMewchildAssessment(BuildContext context) async {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Widget model = OvcChildAssessmentSelection();
    String assessmentResponse = await AppUtil.showPopUpModal(context, model);
    onRedirectToAssessmentForm(context, assessmentResponse);
  }

  onRedirectToAssessmentForm(BuildContext context, String assessmentResponse) {
    if (assessmentResponse != null) {
      assessmentResponse == "Well-being"
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OvcServiceWellBeingAssessmentForm()))
          : assessmentResponse == "TB"
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OvcServiceTBAssessmentForm()))
              : assessmentResponse == "HIV"
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OvcServiceHIVAssessmentForm()))
                  : print(assessmentResponse);
    }
  }

  onViewAssessment(
      BuildContext context, String assessmentResponse, Events eventDat) {}

  onEditAssessment(
      BuildContext context, String assessmentResponse, Events eventDat) {}

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
              Container(
                child: Consumer<ServiveEventDataState>(
                  builder: (context, serviveEventDataState, child) {
                    bool isLoading = serviveEventDataState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviveEventDataState.eventListByProgramStage;
                    Map programStageMap =
                        OvcAssessmentConstant.getOvcAssessmentProgramStageMap();
                    List<String> programStageids = [];
                    for (var id in programStageMap.keys.toList()) {
                      programStageids.add('$id');
                    }
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataState(
                            eventListByProgramStage, programStageids);
                    return isLoading
                        ? CircularProcessLoader(
                            color: Colors.blueGrey,
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: events.length == 0
                                ? Center(
                                    child:
                                        Text('There is no asseement at moment'),
                                  )
                                : Column(
                                    children: events
                                        .map((Events eventData) =>
                                            OvcChildAssessmentListCard(
                                              eventData: eventData,
                                              programStageMap: programStageMap,
                                              onEditAssessment: () {
                                                String assessmentResponse =
                                                    programStageMap[
                                                        eventData.programStage];
                                                onEditAssessment(
                                                    context,
                                                    assessmentResponse,
                                                    eventData);
                                              },
                                              onViewAssessment: () {
                                                String assessmentResponse =
                                                    programStageMap[
                                                        eventData.programStage];
                                                onViewAssessment(
                                                    context,
                                                    assessmentResponse,
                                                    eventData);
                                              },
                                            ))
                                        .toList(),
                                  ),
                          );
                  },
                ),
              ),
              Container(
                  child: OvcEnrollmentFormSaveButton(
                label: "NEW ASSESSMENT",
                labelColor: Colors.white,
                fontSize: 14,
                buttonColor: Color(0xFF4B9F46),
                onPressButton: () => onAddMewchildAssessment(context),
              ))
            ]),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
