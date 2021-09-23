import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/dreams_services_visit_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep_short_form/constants/prep_intake_short_form_constants.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/prep_short_form/pages/agyw_dreams_prep_short_form.dart';
import 'package:provider/provider.dart';

class AgywDreamsPrepShortFormHomePage extends StatefulWidget {
  AgywDreamsPrepShortFormHomePage({Key? key}) : super(key: key);
  @override
  _AgywDreamsPrepShortFormHomePageState createState() =>
      _AgywDreamsPrepShortFormHomePageState();
}

class _AgywDreamsPrepShortFormHomePageState
    extends State<AgywDreamsPrepShortFormHomePage> {
  final String label = 'AGYW PrEP';
  List<String> programStageIds = [PrepIntakeShortFormConstants.programStage];

  @override
  void initState() {
    super.initState();
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    Events? eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
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

  redirectPrepShortForm(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AgywDreamsPrepShortForm()));
  }

  onEditPREP(
      BuildContext context, Events eventData, AgywDream? agywDream) async {
    updateFormState(context, true, eventData);
    String? beneficiaryId = agywDream!.id;
    String? eventId = eventData.event;
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsPrEPShortFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);

    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      redirectPrepShortForm(context);
    }
  }

  onViewPREP(BuildContext context, Events eventData) {
    updateFormState(context, false, eventData);
    redirectPrepShortForm(context);
  }

  onAddPREP(BuildContext context, AgywDream agywDream) async {
    updateFormState(context, true, null);
    String? beneficiaryId = agywDream.id;
    String eventId = '';
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsPrEPShortFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);

    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      redirectPrepShortForm(context);
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
          body: Column(children: [
        Consumer<DreamsBeneficiarySelectionState>(
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
                        eventListByProgramStage, programStageIds)
                .toList();
            int sessionIndex = events.length + 1;
            return Container(
                child: Column(children: [
              Container(
                child: DreamsBeneficiaryTopHeader(
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
                                              child: DreamsServiceVisitCard(
                                                visitName: "PrEP ",
                                                onEdit: () => onEditPREP(
                                                    context,
                                                    eventData,
                                                    agywDream),
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
                                agywDream!,
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
