import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:provider/provider.dart';
import 'components/ovc_child_monitor_home_list_container.dart';
import 'components/ovc_monitor_save_button.dart';
import 'pages/add_school/pages/ovc_school_monitoring_form.dart';
import 'pages/add_service/pages/ovc_service_monitoring_form.dart';
import 'pages/constants/ovc_monitor_constant.dart';

class OvcMonitorChildView extends StatelessWidget {
  final String label = 'Child Monitoring tool';

  void onAddService(BuildContext context,) {
       Provider.of<ServiceFormState>(context, listen: false).resetFormState();
       Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcServiceMonitoringForm()));
  }
  void onAddSchool(BuildContext context) {
       Provider.of<ServiceFormState>(context, listen: false).resetFormState();
       Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcSchoolMonitoringForm()));
  }
 void onRedirectToMonitorForm(
      BuildContext context, String monitorResponse, bool isEditableMode) {
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (monitorResponse != null) {
      monitorResponse == 'Service'
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OvcServiceMonitoringForm()))
          : monitorResponse == 'School'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  OvcSchoolMonitoringForm()))
                  : print(monitorResponse);
    }
  }
 void updateFormStateData(BuildContext context, Events eventData) {
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
  void onEditMonitor(BuildContext context,
    String monitorResponse,
    Events eventData,) {
    bool isEditableMode = true;
    updateFormStateData(context, eventData);
    onRedirectToMonitorForm(context, monitorResponse, isEditableMode);
  }
  void onViewMonitor(BuildContext context,
    String monitorResponse,
    Events eventData,) {
    bool isEditableMode = false;
    updateFormStateData(context, eventData);
    onRedirectToMonitorForm(context, monitorResponse, isEditableMode);
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
              Container(
                child: Consumer<ServiveEventDataState>(
                  builder: (context, serviveEventDataState, child) {
                    bool isLoading = serviveEventDataState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviveEventDataState.eventListByProgramStage;
                    Map programStageMap =
                        OvcMonitorConstant.getOvcMonitorProgramStageMap();
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
                                        Text('There is no monitor details at moment'),
                                  )
                                : Column(
                                    children: events
                                        .map((Events eventData) =>
                                            OvcChildMonitorHomeListContainer(
                                              eventData: eventData,
                                              programStageMap: programStageMap,
                                              onEditMonitor: () {
                                                String monitorResponse =
                                                    programStageMap[
                                                        eventData.programStage];
                                                onEditMonitor(
                                                    context,
                                                    monitorResponse,
                                                    eventData);
                                              },
                                              onViewMonitor: () {
                                                String monitorResponse =
                                                    programStageMap[
                                                        eventData.programStage];
                                                onViewMonitor(
                                                    context,
                                                    monitorResponse,
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
                child: Row(
                  children:[
                    Expanded(child: 
                     OvcMonitorSaveButton(
                          label: 'ADD SERVICE',
                          labelColor: Color(0xFF4B9F46),
                          fontSize: 14,
                          buttonColor: Colors.transparent,
                          borderColor: Color(0xFFAEB9AD),
                          onPressButton: () => onAddService(context),
                        )
                    ),
                      Expanded(child: 
                       OvcMonitorSaveButton(
                          label: 'ADD SCHOOL',
                          labelColor: Colors.white,
                          fontSize: 14,
                          buttonColor: Color(0xFF4B9F46),
                          onPressButton: () => onAddSchool(context),
                        )
                    ),
                  ]
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
