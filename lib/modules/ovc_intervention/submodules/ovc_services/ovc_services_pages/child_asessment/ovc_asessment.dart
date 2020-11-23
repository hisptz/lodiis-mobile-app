import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
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
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_asessment/components/ovc_child_assessment_list_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_asessment/components/ovc_child_assessment_selection.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_asessment/constants/ovc_asessment_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_asessment/pages/ovc_service_hiv_assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_asessment/pages/ovc_service_tb_assessment_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_asessment/pages/ovc_service_well_being_assessment_form.dart';
import 'package:provider/provider.dart';

class OvcAssessmentServiceChildView extends StatelessWidget {
  final String label = 'Child Assessment';

  void onAddMewchildAssessment(BuildContext context, OvcHouseHoldChild child) async {
    updateFormStateData(context, null, child);
    Widget model = OvcChildAssessmentSelection();
    String assessmentResponse =
        await AppUtil.showPopUpModal(context, model, false);
    onRedirectToAssessmentForm(context, assessmentResponse, true);
  }

  void onRedirectToAssessmentForm(
      BuildContext context, String assessmentResponse, bool isEditableMode) {
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (assessmentResponse != null) {
      assessmentResponse == 'Well-being'
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OvcServiceWellBeingAssessmentForm()))
          : assessmentResponse == 'TB'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OvcServiceTBAssessmentForm()))
              : assessmentResponse == 'HIV'
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OvcServiceHIVAssessmentForm()))
                  : print(assessmentResponse);
    }
  }

  void updateFormStateData(
      BuildContext context, Events eventData, OvcHouseHoldChild child) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('age', child.age);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map datavalue in eventData.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
  }

  void onViewAssessment(
    BuildContext context,
    String assessmentResponse,
    Events eventData,
      OvcHouseHoldChild child
  ) {
    bool isEditableMode = false;
    updateFormStateData(context, eventData, child);
    onRedirectToAssessmentForm(context, assessmentResponse, isEditableMode);
  }

  void onEditAssessment(
    BuildContext context,
    String assessmentResponse,
    Events eventData,
      OvcHouseHoldChild child
  ) {
    bool isEditableMode = true;
    updateFormStateData(context, eventData, child);
    onRedirectToAssessmentForm(context, assessmentResponse, isEditableMode);
  }

  @override
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
            child: Consumer<OvcHouseHoldCurrentSelectionState>(
              builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                OvcHouseHoldChild currentOvcHouseHoldChild =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHoldChild;
                return Column(children: [
                  OvcChildInfoTopHeader(),
                  Container(
                    child: Container(
                      child: Consumer<ServiveEventDataState>(
                        builder: (context, serviveEventDataState, child) {
                          bool isLoading = serviveEventDataState.isLoading;
                          Map<String, List<Events>> eventListByProgramStage =
                              serviveEventDataState.eventListByProgramStage;
                          Map programStageMap = OvcAssessmentConstant
                              .getOvcAssessmentProgramStageMap();
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
                              child: Text(
                                  'There is no asseement at moment'),
                            )
                                : Column(
                              children: events
                                  .map((Events eventData) =>
                                  OvcChildAssessmentListCard(
                                    eventData: eventData,
                                    programStageMap:
                                    programStageMap,
                                    onEditAssessment: () {
                                      String
                                      assessmentResponse =
                                      programStageMap[
                                      eventData
                                          .programStage];
                                      onEditAssessment(
                                          context,
                                          assessmentResponse,
                                          eventData,
                                          currentOvcHouseHoldChild);
                                    },
                                    onViewAssessment: () {
                                      String
                                      assessmentResponse =
                                      programStageMap[
                                      eventData
                                          .programStage];
                                      onViewAssessment(
                                          context,
                                          assessmentResponse,
                                          eventData,
                                          currentOvcHouseHoldChild);
                                    },
                                  ))
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                      child: OvcEnrollmentFormSaveButton(
                        label: 'NEW ASSESSMENT',
                        labelColor: Colors.white,
                        fontSize: 14,
                        buttonColor: Color(0xFF4B9F46),
                        onPressButton: () => onAddMewchildAssessment(
                            context, currentOvcHouseHoldChild),
                      ))
                ]);
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
