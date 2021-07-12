import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/service_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/dreams_services_visit_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/constants/service_form_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/pages/agyw_dreams_service_form.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsServiceFormPage extends StatefulWidget {
  AgywDreamsServiceFormPage({Key key}) : super(key: key);

  @override
  _AgywDreamsServiceFormPage createState() => _AgywDreamsServiceFormPage();
}

class _AgywDreamsServiceFormPage extends State<AgywDreamsServiceFormPage> {
  final String label = 'Service Form';
  List<String> programStageids = [ServiceFormConstant.programStage];
  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
      BuildContext context,
      bool isEditableMode,
      Events eventData,
      AgywDream agywDream,
      List<ServiceEvents> serviceEvents) {
    Map serviceEventSessions = getLastSessionNumbers(serviceEvents);
    Map<String, List<int>> interventionSessions =
        getSessionsPerIntervention(serviceEvents, eventData);
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('age', agywDream.age);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('eventSessions', serviceEventSessions);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('interventionSessions', interventionSessions);
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

  Map getLastSessionNumbers(List<ServiceEvents> serviceEvents) {
    Map eventsWithLastSessionNumber = Map();
    for (ServiceEvents event in serviceEvents ?? []) {
      if (eventsWithLastSessionNumber[event.interventionType] != null) {
        eventsWithLastSessionNumber[event.interventionType] =
            eventsWithLastSessionNumber[event.interventionType] <
                    event.sessionNumber
                ? event.sessionNumber
                : eventsWithLastSessionNumber[event.interventionType];
      } else {
        eventsWithLastSessionNumber[event.interventionType] =
            event.sessionNumber;
      }
    }
    return eventsWithLastSessionNumber;
  }

  Map<String, List<int>> getSessionsPerIntervention(
      List<ServiceEvents> serviceEvents, Events currentEvent) {
    Map<String, List<int>> interventionSessions = Map();
    String currentEventId =
        currentEvent != null ? currentEvent.event ?? '' : '';
    (serviceEvents ?? [])
        .removeWhere((eventData) => eventData.event == currentEventId);
    for (ServiceEvents event in (serviceEvents ?? [])) {
      if (interventionSessions[event.interventionType] != null) {
        interventionSessions[event.interventionType].add(event.sessionNumber);
        interventionSessions[event.interventionType].sort();
      } else {
        interventionSessions[event.interventionType] = [event.sessionNumber];
      }
    }
    return interventionSessions;
  }

  void onAddService(BuildContext context, AgywDream agywDream,
      List<ServiceEvents> serviceEvents) async {
    updateFormState(context, true, null, agywDream, serviceEvents);
    CurrentUser currentUser = await UserService().getCurrentUser();
    String youthMentorName = currentUser.name;
    String implementingPartner = currentUser.implementingPartner;
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('W79837fEI3C', youthMentorName);
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsServiceForm(
                  currentUserImplementingPartner: implementingPartner,
                )));
  }

  void onViewService(
      BuildContext context, Events eventdata, AgywDream agywDream) {
    updateFormState(context, false, eventdata, agywDream, null);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsServiceForm()));
  }

  void onEditService(BuildContext context, Events eventdata,
      AgywDream agywDream, List<ServiceEvents> serviceEvents) async {
    CurrentUser currentUser = await UserService().getCurrentUser();
    String youthMentorName = currentUser.name;
    String implementingPartner = currentUser.implementingPartner;
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('W79837fEI3C', youthMentorName);
    updateFormState(context, true, eventdata, agywDream, serviceEvents);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AgywDreamsServiceForm(
                  isFormEdited: true,
                  currentUserImplementingPartner: implementingPartner,
                )));
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
            child: Consumer<DreamBenefeciarySelectionState>(
              builder: (context, dreamBenefeciarySelectionState, child) {
                return Consumer<ServiveEventDataState>(
                  builder: (context, serviceFormState, child) {
                    AgywDream agywDream =
                        dreamBenefeciarySelectionState.currentAgywDream;
                    bool isLoading = serviceFormState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviceFormState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                            eventListByProgramStage, programStageids);
                    List<ServiceEvents> serviceEvents = events
                        .map((Events event) =>
                            ServiceEvents().getServiceSessions(event))
                        .toList();
                    int serviceIndex = events.length + 1;
                    return Container(
                      child: Column(
                        children: [
                          DreamBenefeciaryTopHeader(
                            agywDream: agywDream,
                          ),
                          Container(
                            child: isLoading
                                ? CircularProcessLoader(
                                    color: Colors.blueGrey,
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: events.length == 0
                                            ? Text(
                                                'There is no Services at a moment')
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: events
                                                      .map((Events eventData) {
                                                    serviceIndex--;

                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 15.0,
                                                      ),
                                                      child:
                                                          DreamsServiceVisitListCard(
                                                        visitName: "Service",
                                                        onEdit: () =>
                                                            onEditService(
                                                                context,
                                                                eventData,
                                                                agywDream,
                                                                serviceEvents),
                                                        onView: () =>
                                                            onViewService(
                                                                context,
                                                                eventData,
                                                                agywDream),
                                                        eventData: eventData,
                                                        visitCount:
                                                            serviceIndex,
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                      ),
                                      EntryFormSaveButton(
                                          label: 'ADD Service',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF1F8ECE),
                                          fontSize: 15.0,
                                          onPressButton: () => onAddService(
                                              context,
                                              agywDream,
                                              serviceEvents))
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
