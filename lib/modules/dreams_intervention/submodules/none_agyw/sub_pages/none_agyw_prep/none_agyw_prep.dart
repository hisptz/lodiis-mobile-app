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
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/dreams_services_visit_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_prep_visit_constant.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/sub_pages/none_agyw_prep/pages/none_agyw_prep_form.dart';
import 'package:provider/provider.dart';

class NoneAgywPrep extends StatefulWidget {
  NoneAgywPrep({Key? key}) : super(key: key);

  @override
  _NoneAgywPrepState createState() => _NoneAgywPrepState();
}

class _NoneAgywPrepState extends State<NoneAgywPrep> {
  final String label = 'PrEP';
  List<String> programStageIds = [NonAgywPrepVisitConstant.programStage];

  @override
  void initState() {
    super.initState();
  }

  bool isPrePStopped(List<Events> events) {
    return events.any((element) => element.dataValues.any((value) =>
        value['dataElement'] == NonAgywPrepVisitConstant.visitType &&
        value['value'] == 'Stopping PrEP'));
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

  void onAddPrep(BuildContext context, AgywDream agywDream) async {
    String eventId = "";
    String? beneficiaryId = agywDream.id;
    String formAutoSaveId =
        "${DreamsRoutesConstant.noneAgywPrepFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges =
        await AppResumeRoute().shouldResumeWithUnSavedChanges(
      context,
      formAutoSave,
      beneficiaryName: agywDream.toString(),
    );
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, true, null);
      Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
          .setCurrentAgywDream(agywDream);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoneAgywPrepForm(),
        ),
      );
    }
  }

  void onViewPrep(BuildContext context, Events eventData) {
    updateFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoneAgywPrepForm(),
      ),
    );
  }

  void onEditPrep(
      BuildContext context, Events eventData, AgywDream agywDream) async {
    String? beneficiaryId = agywDream.id;
    String eventId = eventData.event ?? "";
    String formAutoSaveId =
        "${DreamsRoutesConstant.noneAgywPrepFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges =
        await AppResumeRoute().shouldResumeWithUnSavedChanges(
      context,
      formAutoSave,
      beneficiaryName: agywDream.toString(),
    );
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, true, eventData);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoneAgywPrepForm(),
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
                  int referralIndex = events.length + 1;

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
                                              'There is no Prep Visit at a moment')
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
                                                    child:
                                                        DreamsServiceVisitCard(
                                                      visitName: "PREP Visit",
                                                      onEdit: () => onEditPrep(
                                                        context,
                                                        eventData,
                                                        agywDream!,
                                                      ),
                                                      onView: () => onViewPrep(
                                                        context,
                                                        eventData,
                                                      ),
                                                      eventData: eventData,
                                                      visitCount: referralIndex,
                                                      editDisabled: eventData !=
                                                          events.first,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                    ),
                                    !isPrePStopped(events)
                                        ? EntryFormSaveButton(
                                            label: 'ADD PREP VISIT',
                                            labelColor: Colors.white,
                                            buttonColor: Color(0xFF1F8ECE),
                                            fontSize: 15.0,
                                            onPressButton: () =>
                                                onAddPrep(context, agywDream!),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: Text(
                                                'Prep program was stopped'),
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
