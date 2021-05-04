import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/dreams_services_visit_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep_short_form/constants/prep_intake_short_form_constants.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep_short_form/pages/agyw_dreams_prep_short_form.dart';
import 'package:provider/provider.dart';

class AgywDreamsPrepShortFormHomePage extends StatefulWidget {
  AgywDreamsPrepShortFormHomePage({Key key}) : super(key: key);
  @override
  _AgywDreamsPrepShortFormHomePageState createState() =>
      _AgywDreamsPrepShortFormHomePageState();
}

class _AgywDreamsPrepShortFormHomePageState
    extends State<AgywDreamsPrepShortFormHomePage> {
  final String label = 'AGYW PrEP';
  List<String> programStageids = [PrepIntakeShortFormConstants.programStage];

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

  redirectPrepShortForm(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsPrepShortForm()));
  }

  onEditPREP(BuildContext context, Events eventdata) {
    updateFormState(context, true, eventdata);
    redirectPrepShortForm(context);
  }

  onViewPREP(BuildContext context, Events eventdata) {
    updateFormState(context, false, eventdata);
    redirectPrepShortForm(context);
  }

  onAddPREP(BuildContext context, AgywDream agywDream) {
    updateFormState(context, true, null);
    redirectPrepShortForm(context);
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
                    .getAllEventListFromServiceDataStateByProgramStages(
                        eventListByProgramStage, programStageids)
                .toList();
            int sessionIndex = events.length + 1;
            return Container(
                child: Column(children: [
              Container(
                child: DreamBenefeciaryTopHeader(
                  agywDream: agywDream,
                ),
              ),
              Container(
                child: isLoading
                    ? Container(
                        child: CircularProcessLoader(
                          color: Colors.blueGrey,
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: events.length == 0
                                    ? Container(
                                        child: Text(
                                          "There is no PrEP visit at a moment",
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 13.0,
                                        ),
                                        child: Column(
                                          children:
                                              events.map((Events eventData) {
                                            sessionIndex--;
                                            return Container(
                                              margin: EdgeInsets.only(
                                                bottom: 15.0,
                                              ),
                                              child: DreamsServiceVisitListCard(
                                                visitName: "PrEP ",
                                                onEdit: () => onEditPREP(
                                                  context,
                                                  eventData,
                                                ),
                                                onView: () => onViewPREP(
                                                  context,
                                                  eventData,
                                                ),
                                                eventData: eventData,
                                                visitCount: sessionIndex,
                                              ),
                                            );
                                          }).toList(),
                                        ))),
                            EntryFormSaveButton(
                              label: 'ADD PREP VISIT',
                              labelColor: Colors.white,
                              buttonColor: Color(0xFF1F8ECE),
                              fontSize: 15.0,
                              onPressButton: () => onAddPREP(
                                context,
                                agywDream,
                              ),
                            )
                          ],
                        ),
                      ),
              )
            ]));
          });
        })
      ])),
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
