import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_consent_subpart_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/constants/prep_intake_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/dreams_services_visit_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/pages/agyw_dreams_prep_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/pages/agyw_prep_visit_form.dart';
import 'package:provider/provider.dart';

class AgywDreamsPrep extends StatefulWidget {
  const AgywDreamsPrep({Key? key}) : super(key: key);

  @override
  _AgywDreamsPrepState createState() => _AgywDreamsPrepState();
}

class _AgywDreamsPrepState extends State<AgywDreamsPrep> {
  final String label = 'AGYW PrEP';
  List<String> programStageIds = [PrepIntakeConstant.programStage];
  List<String> visitProgramStageIds = [
    PrepIntakeConstant.prepVisitProgramStage
  ];

  @override
  void initState() {
    super.initState();
  }

  Container _getIneligibleMessage() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 13.0,
      ),
      child: const Text(
        'PrEP is restricted to beneficiaries from 15-24 years only',
      ),
    );
  }

  bool isEligibleForPrep(AgywDream agywDream) {
    return int.parse(agywDream.age!) >= 15 && int.parse(agywDream.age!) <= 25;
  }

  void onViewPrep(BuildContext context, Events eventData) {
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsPrepFormPage(),
      ),
    );
  }

  void onEditPrep(
    BuildContext context,
    Events eventData,
    AgywDream agywDream,
  ) async {
    FormUtil.updateServiceFormState(context, true, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsPrepFormPage(),
      ),
    );
  }

  void onAddVisit(BuildContext context, AgywDream agywDream) async {
    FormUtil.updateServiceFormState(context, true, null);
    if (isEligibleForPrep(agywDream)) {
      String? beneficiaryId = agywDream.id;
      String? eventId = '';
      String formAutoSaveId =
          "${DreamsRoutesConstant.agywDreamsPrepVisitFormPage}_${beneficiaryId}_$eventId";
      FormAutoSave formAutoSave = await FormAutoSaveOfflineService()
          .getSavedFormAutoData(formAutoSaveId);
      bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
          .shouldResumeWithUnSavedChanges(context, formAutoSave);
      if (shouldResumeWithUnSavedChanges) {
        AppResumeRoute().redirectToPages(context, formAutoSave);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AgywPrepVisitForm(),
          ),
        );
      }
    } else {
      AppUtil.showToastMessage(
        message: 'PrEP is restricted to beneficiaries from 15-24 years only',
        position: ToastGravity.TOP,
      );
    }
  }

  void onViewVisit(BuildContext context, Events eventData) {
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywPrepVisitForm(),
      ),
    );
  }

  void onEditVisit(
      BuildContext context, Events eventData, AgywDream agywDream) async {
    FormUtil.updateServiceFormState(context, true, eventData);
    String? beneficiaryId = agywDream.id;
    String? eventId = eventData.event;
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsPrepVisitFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AgywPrepVisitForm(),
        ),
      );
    }
  }

  List getStoppedPrepEvent(List<Events> events) {
    List stoppedEventDates = [];
    if (events.isNotEmpty) {
      for (var event in events) {
        if (event.dataValues != null && event.dataValues.length > 0) {
          for (var dataValue in event.dataValues) {
            if (dataValue['dataElement'] ==
                    PrepIntakeConstant.prepStoppedDate &&
                dataValue['value'].isNotEmpty) {
              stoppedEventDates.add(dataValue);
            }
          }
        }
      }
    }
    return stoppedEventDates;
  }

  bool isPrepProgramStopped(List<Events> events, List<Events> visits) {
    List stoppedPrepEvents = getStoppedPrepEvent(events);
    List stoppedPrepVisits = getStoppedPrepEvent(visits);
    return stoppedPrepEvents.isNotEmpty || stoppedPrepVisits.isNotEmpty
        ? true
        : false;
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
        body: Column(
          children: [
            Consumer<DreamsBeneficiarySelectionState>(
              builder: (context, dreamBeneficiarySelectionState, child) {
                return Consumer<ServiceEventDataState>(
                  builder: (context, serviceEventDataState, child) {
                    AgywDream? agywDream =
                        dreamBeneficiarySelectionState.currentAgywDream;
                    bool isLoading = serviceEventDataState.isLoading;
                    Map<String?, List<Events>> eventListByProgramStage =
                        serviceEventDataState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                            eventListByProgramStage, programStageIds);

                    List<Events> visits = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                      eventListByProgramStage,
                      visitProgramStageIds,
                    );
                    int visitprepVisitIndex = visits.length;
                    return Column(
                      children: [
                        Container(
                          child: events.isNotEmpty
                              ? DreamsBeneficiaryTopHeader(
                                  agywDream: agywDream,
                                )
                              : null,
                        ),
                        Container(
                          child: isLoading
                              ? const CircularProcessLoader(
                                  color: Colors.blueGrey,
                                )
                              : Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: isEligibleForPrep(agywDream!)
                                            ? 5.0
                                            : 0,
                                      ),
                                      child: events.isEmpty
                                          ? isEligibleForPrep(agywDream)
                                              ? Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 13.0,
                                                  ),
                                                  child:
                                                      const AgywDreamsHTSConsentFormSubpart(
                                                    isComingFromPrep: true,
                                                  ),
                                                )
                                              : Column(
                                                  children: [
                                                    DreamsBeneficiaryTopHeader(
                                                      agywDream: agywDream,
                                                    ),
                                                    _getIneligibleMessage()
                                                  ],
                                                )
                                          : isEligibleForPrep(
                                              agywDream,
                                            )
                                              ? Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 13.0,
                                                  ),
                                                  child: Column(
                                                    children: events.map(
                                                        (Events eventData) {
                                                      return Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                          bottom: 15.0,
                                                        ),
                                                        child:
                                                            DreamsServiceVisitCard(
                                                          visitName:
                                                              "PrEP Screening",
                                                          onEdit: () =>
                                                              onEditPrep(
                                                                  context,
                                                                  eventData,
                                                                  agywDream),
                                                          onView: () =>
                                                              onViewPrep(
                                                                  context,
                                                                  eventData),
                                                          eventData: eventData,
                                                          editDisabled:
                                                              visits.isNotEmpty
                                                                  ? true
                                                                  : false,
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                )
                                              : _getIneligibleMessage(),
                                    ),
                                    Column(
                                      children: events.isNotEmpty &&
                                              isEligibleForPrep(agywDream)
                                          ? [
                                              const Text(
                                                "VISITS",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Container(
                                                child: visits.isEmpty
                                                    ? Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                          vertical: 5.0,
                                                          horizontal: 13.0,
                                                        ),
                                                        child: const Text(
                                                          'There is no PrEP Visit at a moment',
                                                        ),
                                                      )
                                                    : Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                          vertical: 1.0,
                                                          horizontal: 13.0,
                                                        ),
                                                        child: Column(
                                                          children: visits.map(
                                                              (Events
                                                                  eventData) {
                                                            int count =
                                                                visitprepVisitIndex--;
                                                            return Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                bottom: 15.0,
                                                              ),
                                                              child:
                                                                  DreamsServiceVisitCard(
                                                                visitName:
                                                                    "PrEP Visit",
                                                                onEdit: () =>
                                                                    onEditVisit(
                                                                        context,
                                                                        eventData,
                                                                        agywDream),
                                                                onView: () =>
                                                                    onViewVisit(
                                                                        context,
                                                                        eventData),
                                                                eventData:
                                                                    eventData,
                                                                visitCount:
                                                                    count,
                                                                editDisabled: !(visits
                                                                        .first ==
                                                                    eventData),
                                                              ),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                              ),
                                              events.isNotEmpty &&
                                                      isPrepProgramStopped(
                                                              events, visits) ==
                                                          false
                                                  ? EntryFormSaveButton(
                                                      label: 'ADD VISIT',
                                                      labelColor: Colors.white,
                                                      buttonColor: const Color(
                                                          0xFF1F8ECE),
                                                      fontSize: 15.0,
                                                      onPressButton: () =>
                                                          onAddVisit(context,
                                                              agywDream),
                                                    )
                                                  : const Text(
                                                      'PrEP program was stopped',
                                                    )
                                            ]
                                          : [],
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
