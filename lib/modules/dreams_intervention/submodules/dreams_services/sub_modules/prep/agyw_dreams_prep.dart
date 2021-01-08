import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/pages/agyw_dreams_hts_consent_subpart_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/constants/prep_intake_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep/pages/agyw_dreams_prep_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/prep_visit_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_prep_visit_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/sub_pages/none_agyw_prep/pages/none_agyw_prep_form.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsPrep extends StatefulWidget {
  AgywDreamsPrep({Key key}) : super(key: key);

  @override
  _AgywDreamsPrepState createState() => _AgywDreamsPrepState();
}

class _AgywDreamsPrepState extends State<AgywDreamsPrep> {
  final String label = 'AGYW Prep';
  List<String> programStageids = [PrepIntakeConstant.programStage];
  List<String> nonAgywprogramStageids = [NonAgywPrepVisitConstant.programStage];

  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
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

  void onAddPrep(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    if (int.parse(agywDream.age) >= 15 && int.parse(agywDream.age) <= 24) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AgywDreamsPrepFormPage()));
    } else {
      AppUtil.showToastMessage(
          message: 'PrEP is restricted to beneficiaries from 15-24 years only',
          position: ToastGravity.TOP);
    }
  }

  void onViewPrep(BuildContext context, Events eventdata) {
    updateFormState(context, false, eventdata);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsPrepFormPage()));
  }

  void onEditPrep(BuildContext context, Events eventdata) {
    updateFormState(context, true, eventdata);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsPrepFormPage()));
  }

  void onAddVisit(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    if (int.parse(agywDream.age) >= 15 && int.parse(agywDream.age) <= 24) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NoneAgywPrepForm()));
    } else {
      AppUtil.showToastMessage(
          message: 'PrEP is restricted to beneficiaries from 15-24 years only',
          position: ToastGravity.TOP);
    }
  }

  void onViewVisit(BuildContext context, Events eventdata) {
    updateFormState(context, false, eventdata);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NoneAgywPrepForm()));
  }

  void onEditVisit(BuildContext context, Events eventdata) {
    updateFormState(context, true, eventdata);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NoneAgywPrepForm()));
  }

  bool isPrepProgramStopped(List<Events> events, List<Events> visits) {
    List stoppedPrepEvents = getStoppedPrepEvent(events);
    List stoppedPrepVisits = getStoppedPrepEvent(visits);
    // print({stoppedPrepEvents, stoppedPrepVisits}.toString());
    return stoppedPrepEvents.length > 0 || stoppedPrepVisits.length > 0
        ? true
        : false;
  }

  List getStoppedPrepEvent(List<Events> events) {
    List stoppedEventDates = [];
    if (events != null && events.length > 0) {
      for (var event in events) {
        if (event != null &&
            event.dataValues != null &&
            event.dataValues.length > 0) {
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
          body: Column(children: [
            Consumer<DreamBenefeciarySelectionState>(
              builder: (context, dreamBenefeciarySelectionState, child) {
                return Consumer<ServiveEventDataState>(
                  builder: (context, serviceFormState, child) {
                    AgywDream agywDream =
                        dreamBenefeciarySelectionState.currentAgywDream;
                    bool isLoading = serviceFormState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviceFormState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataState(
                            eventListByProgramStage, programStageids);

                    List<Events> visits = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataState(
                            eventListByProgramStage, nonAgywprogramStageids);
                    Events lastVisit = visits != null && visits.length > 0
                        ? visits.last
                        : null;
                    int referralIndex = events.length;
                    int visitReferralIndex = visits.length;
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            child: events.length > 0
                                ? DreamBenefeciaryTopHeader(
                                    agywDream: agywDream,
                                  )
                                : null,
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
                                            ? Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child:
                                                    AgywDreamsHTSConsentFormSubpart(
                                                  isComingFromPrep: true,
                                                ))
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: events
                                                      .map((Events eventData) {
                                                    referralIndex--;

                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 15.0,
                                                      ),
                                                      child: PrepVisitListCard(
                                                        visitName:
                                                            "Baseline Information",
                                                        onEditPrep: () =>
                                                            onEditPrep(context,
                                                                eventData),
                                                        onViewPrep: () =>
                                                            onViewPrep(context,
                                                                eventData),
                                                        eventData: eventData,
                                                        editDisabled: visits !=
                                                                    null &&
                                                                visits.length >
                                                                    0
                                                            ? true
                                                            : false,
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                      ),
                                      Column(
                                        children: events.length > 0
                                            ? [
                                                Text(
                                                  "VISITS",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Container(
                                                  child: visits.length == 0
                                                      ? Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 13.0,
                                                          ),
                                                          child: Text(
                                                              'There is no Prep Visit at a moment'))
                                                      : Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                            vertical: 1.0,
                                                            horizontal: 13.0,
                                                          ),
                                                          child: Column(
                                                            children: visits
                                                                .map((Events
                                                                    eventData) {
                                                              int count = visitReferralIndex--;
                                                              return Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  bottom: 15.0,
                                                                ),
                                                                child:
                                                                    PrepVisitListCard(
                                                                  visitName:
                                                                      "Prep Visit",
                                                                  onEditPrep: () =>
                                                                      onEditVisit(
                                                                          context,
                                                                          eventData),
                                                                  onViewPrep: () =>
                                                                      onViewVisit(
                                                                          context,
                                                                          eventData),
                                                                  eventData:
                                                                      eventData,
                                                                  visitCount:
                                                                      count,
                                                                  editDisabled:
                                                                      !(visits.first == eventData)
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                ),
                                                events != null &&
                                                        events.length > 0 &&
                                                        isPrepProgramStopped(
                                                                events,
                                                                visits) ==
                                                            false
                                                    ? EntryFormSaveButton(
                                                        label: 'ADD VISIT',
                                                        labelColor:
                                                            Colors.white,
                                                        buttonColor:
                                                            Color(0xFF1F8ECE),
                                                        fontSize: 15.0,
                                                        onPressButton: () =>
                                                            onAddVisit(context,
                                                                agywDream))
                                                    : Text(
                                                        'Prep program was stopped')
                                              ]
                                            : [],
                                      ),
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
          ]),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
