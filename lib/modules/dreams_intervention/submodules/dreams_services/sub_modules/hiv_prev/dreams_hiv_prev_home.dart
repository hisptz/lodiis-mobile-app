import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';
import 'components/dreams_hiv_prev_list_card.dart';
import 'constant/dreams_hiv_prev_constant.dart';
import 'pages/dreams_hiv_prev_form.dart';

class DreamsHIVPrevHome extends StatefulWidget {
  DreamsHIVPrevHome({Key key}) : super(key: key);

  @override
  _DreamsHIVPrevHomeState createState() => _DreamsHIVPrevHomeState();
}

class _DreamsHIVPrevHomeState extends State<DreamsHIVPrevHome> {
  final String label = 'HIV prevention';
  List<String> programStageids = [DreamsHIVPrevConstant.programStage];
  @override
  void initState() {
    super.initState();
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(
            Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
                .currentAgywDream
                .id);
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

  void onAddHivPrev(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamsHivPrevForm()));
  }

  void onViewHivPrev(BuildContext context, Events eventdata) {
    updateFormState(context, false, eventdata);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamsHivPrevForm()));
  }

  void onEditHivPrev(BuildContext context, Events eventdata) {
    updateFormState(context, true, eventdata);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DreamsHivPrevForm()));
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
                        .getAllEventListFromServiceDataState(
                            eventListByProgramStage, programStageids);
                       int sessionIndex = events.length + 1;      
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
                                                'There is no HIV Prev Sessions at a moment')
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: events
                                                      .map((Events eventData) {
                                                        sessionIndex--;
                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                        bottom: 15.0,
                                                      ),
                                             child:
                                                          DreamsHivPrevListCard(
                                                         onEditPrev: () =>
                                                            onEditHivPrev(context,
                                                                eventData),
                                                        onViewPrev: () =>
                                                            onViewHivPrev(context,
                                                                eventData),
                                                        eventData: eventData,
                                                        sessionCount:
                                                            sessionIndex,
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                      ),
                                      OvcEnrollmentFormSaveButton(
                                          label: 'NEW SESSION',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF1F8ECE),
                                          fontSize: 15.0,
                                          onPressButton: () =>
                                          onAddHivPrev(context, agywDream))
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
