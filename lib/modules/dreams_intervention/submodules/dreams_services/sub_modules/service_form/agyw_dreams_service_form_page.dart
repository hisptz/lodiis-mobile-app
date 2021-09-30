import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/service_event.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/dreams_services_visit_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/constants/service_form_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/pages/agyw_dreams_service_form.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsServiceFormPage extends StatefulWidget {
  AgywDreamsServiceFormPage({Key? key}) : super(key: key);

  @override
  _AgywDreamsServiceFormPage createState() => _AgywDreamsServiceFormPage();
}

class _AgywDreamsServiceFormPage extends State<AgywDreamsServiceFormPage> {
  final String label = 'Service Form';
  List<String> programStageIds = [ServiceFormConstant.programStage];
  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
    AgywDream agywDream,
    List<ServiceEvent>? serviceEvents,
  ) {
    Map<String?, List<String?>> interventionSessions =
        getSessionsPerIntervention(serviceEvents, eventData)
            as Map<String?, List<String?>>;
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('age', agywDream.age);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('interventionSessions', interventionSessions);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  Map<String?, List<dynamic>> getSessionsPerIntervention(
    List<ServiceEvent>? serviceEvents,
    Events? currentEvent,
  ) {
    Map<String?, List<String>> interventionSessions = Map();
    String currentEventId =
        currentEvent != null ? currentEvent.event ?? '' : '';
    (serviceEvents ?? [])
        .removeWhere((eventData) => eventData.event == currentEventId);
    for (ServiceEvent event in (serviceEvents ?? [])) {
      if (interventionSessions[event.interventionType] != null) {
        interventionSessions[event.interventionType]!.add(event.sessionNumber!);
        interventionSessions[event.interventionType]!.sort();
      } else {
        interventionSessions[event.interventionType] = [event.sessionNumber!];
      }
    }
    return interventionSessions;
  }

  void onAddService(
    BuildContext context,
    AgywDream agywDream,
    List<ServiceEvent> serviceEvents,
  ) async {
    updateFormState(context, true, null, agywDream, serviceEvents);

    String? beneficiaryId = agywDream.id;
    String eventId = '';
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsServiceFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);

    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      CurrentUser? currentUser = await (UserService().getCurrentUser());
      String? youthMentorName = currentUser!.name;
      String? implementingPartner = currentUser.implementingPartner;
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('W79837fEI3C', youthMentorName);
      Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
          .setCurrentAgywDream(agywDream);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgywDreamsServiceForm(
            currentUserImplementingPartner: implementingPartner,
          ),
        ),
      );
    }
  }

  void onViewService(
    BuildContext context,
    Events eventData,
    AgywDream agywDream,
  ) {
    updateFormState(context, false, eventData, agywDream, null);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsServiceForm()));
  }

  void onEditService(
    BuildContext context,
    Events eventData,
    AgywDream agywDream,
    List<ServiceEvent> serviceEvents,
  ) async {
    updateFormState(context, true, eventData, agywDream, serviceEvents);
    CurrentUser? currentUser = await (UserService().getCurrentUser());
    String? youthMentorName = currentUser!.name;
    String? implementingPartner = currentUser.implementingPartner;
    String? eventId = eventData.event;
    String? beneficiaryId = agywDream.id;
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsServiceFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, true, eventData, agywDream, serviceEvents);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('W79837fEI3C', youthMentorName);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgywDreamsServiceForm(
            isFormEdited: true,
            currentUserImplementingPartner: implementingPartner,
          ),
        ),
      );
    }
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
          child: Consumer<DreamsBeneficiarySelectionState>(
            builder: (context, dreamBeneficiarySelectionState, child) {
              return Consumer<ServiceEventDataState>(
                builder: (context, serviceFormState, child) {
                  AgywDream? agywDream =
                      dreamBeneficiarySelectionState.currentAgywDream;
                  bool isLoading = serviceFormState.isLoading;
                  Map<String?, List<Events>> eventListByProgramStage =
                      serviceFormState.eventListByProgramStage;
                  List<Events> events = TrackedEntityInstanceUtil
                      .getAllEventListFromServiceDataStateByProgramStages(
                          eventListByProgramStage, programStageIds);
                  List<ServiceEvent> serviceEvents = events
                      .map((Events event) =>
                          ServiceEvent().getServiceSessions(event))
                      .toList();
                  int serviceIndex = events.length + 1;
                  return Container(
                    child: Column(
                      children: [
                        DreamsBeneficiaryTopHeader(
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
                                              'There is no Services at a moment',
                                            )
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
                                                        DreamsServiceVisitCard(
                                                      visitName: "Service",
                                                      onEdit: () =>
                                                          onEditService(
                                                              context,
                                                              eventData,
                                                              agywDream!,
                                                              serviceEvents),
                                                      onView: () =>
                                                          onViewService(
                                                        context,
                                                        eventData,
                                                        agywDream!,
                                                      ),
                                                      eventData: eventData,
                                                      visitCount: serviceIndex,
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
                                        agywDream!,
                                        serviceEvents,
                                      ),
                                    )
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
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
