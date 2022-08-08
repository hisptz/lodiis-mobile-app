import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/components/dreams_services_visit_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/condoms/pages/agyw_dreams_condoms_form.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

import 'constants/condoms_constant.dart';

class AgywDreamsCondoms extends StatefulWidget {
  const AgywDreamsCondoms({Key? key}) : super(key: key);

  @override
  _AgywDreamsCondomsState createState() => _AgywDreamsCondomsState();
}

class _AgywDreamsCondomsState extends State<AgywDreamsCondoms> {
  final String label = 'Condom Education/Provision';
  List<String> programStageIds = [CondomsConstant.programStage];
  @override
  void initState() {
    super.initState();
  }

  void onAddCondomProvision(BuildContext context, AgywDream agywDream) async {
    FormUtil.updateServiceFormState(context, true, null);
    String? beneficiaryId = agywDream.id;
    String eventId = '';
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsCondomsFormPage}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);

    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      Provider.of<DreamsBeneficiarySelectionState>(context, listen: false)
          .setCurrentAgywDream(agywDream);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AgywDreamsCondomsForm(),
        ),
      );
    }
  }

  void onViewCondomProvision(BuildContext context, Events eventData) {
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsCondomsForm(),
      ),
    );
  }

  void onEditCondomProvision(
      BuildContext context, Events eventData, AgywDream agywDream) async {
    FormUtil.updateServiceFormState(context, true, eventData);
    String? beneficiaryId = agywDream.id;
    String eventId = eventData.event!;
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsCondomsFormPage}_${beneficiaryId}_$eventId";
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
          builder: (context) => const AgywDreamsCondomsForm(),
        ),
      );
    }
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
        body: Consumer<DreamsBeneficiarySelectionState>(
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
                  eventListByProgramStage,
                  programStageIds,
                  shouldSortByDate: true,
                );
                int condomIndex = events.length + 1;
                return Column(
                  children: [
                    DreamsBeneficiaryTopHeader(
                      agywDream: agywDream,
                    ),
                    Container(
                      child: isLoading
                          ? const CircularProcessLoader(
                              color: Colors.blueGrey,
                            )
                          : Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: events.isEmpty
                                      ? const Text(
                                          'There is no visit at a moment')
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 5.0,
                                            horizontal: 13.0,
                                          ),
                                          child: Column(
                                            children:
                                                events.map((Events eventData) {
                                              condomIndex--;

                                              return Container(
                                                margin: const EdgeInsets.only(
                                                  bottom: 15.0,
                                                ),
                                                child: DreamsServiceVisitCard(
                                                  visitName: "Condom Education/Provision",
                                                  onEdit: () =>
                                                      onEditCondomProvision(
                                                          context,
                                                          eventData,
                                                          agywDream!),
                                                  onView: () =>
                                                      onViewCondomProvision(
                                                          context, eventData),
                                                  eventData: eventData,
                                                  visitCount: condomIndex,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                ),
                                EntryFormSaveButton(
                                  label: 'ADD VISIT',
                                  labelColor: Colors.white,
                                  buttonColor: const Color(0xFF1F8ECE),
                                  fontSize: 15.0,
                                  onPressButton: () =>
                                      onAddCondomProvision(context, agywDream!),
                                )
                              ],
                            ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
