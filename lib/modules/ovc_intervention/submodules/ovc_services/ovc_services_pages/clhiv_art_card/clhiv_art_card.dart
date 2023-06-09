import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/clhiv_art_card/components/clhiv_art_card_visit.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/clhiv_art_card/constants/clhiv_art_card_constants.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/clhiv_art_card/pages/clhiv_art_card_service_form.dart';
import 'package:provider/provider.dart';

class ClhivArtCard extends StatelessWidget {
  ClhivArtCard({Key? key}) : super(key: key);

  final String header = 'CLHIV ART Card Services';
  final List<String> programStageIds = [ClhivArtCardConstants.programStage];

  void updateFormStateData(
    BuildContext context,
    Events? eventData,
    bool isEditableMode,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (isEditableMode) {
      CurrentUser? currentUser =
          Provider.of<CurrentUserState>(context, listen: false).currentUser;
      Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
          ClhivArtCardConstants.serviceProvider, currentUser?.name ?? '');
    }
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

  void onAddClhivArtCardService(
    BuildContext context,
  ) async {
    // TODO add auto-save logic here
    updateFormStateData(context, null, true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClhivArtCardServiceForm(),
      ),
    );
  }

  void onEditClhivArtCardService(
    BuildContext context,
    Events? eventData,
  ) async {
    // TODO add logic to check auto-save
    updateFormStateData(context, eventData, true);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClhivArtCardServiceForm(),
      ),
    );
  }

  void onViewClhivArtCardService(
    BuildContext context,
    Events? eventData,
  ) {
    updateFormStateData(context, eventData, false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClhivArtCardServiceForm(),
      ),
    );
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
              label: header,
              activeInterventionProgram: activeInterventionProgram,
            );
          },
        ),
      ),
      body: SubPageBody(
        body: Column(
          children: [
            const OvcChildInfoTopHeader(),
            Consumer<OvcHouseholdCurrentSelectionState>(
              builder: (context, ovcHouseholdCurrentSelectionState, child) {
                var currentOvc =
                    ovcHouseholdCurrentSelectionState.currentOvcHouseholdChild;

                return Consumer<ServiceEventDataState>(
                  builder: (context, serviceEventDataState, child) {
                    bool isLoading = serviceEventDataState.isLoading;
                    Map<String?, List<Events>> eventListByProgramStage =
                        serviceEventDataState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                            eventListByProgramStage, programStageIds);
                    int serviceIndex = events.length + 1;
                    return isLoading
                        ? const CircularProcessLoader(
                            color: Colors.blueGrey,
                          )
                        : Consumer<LanguageTranslationState>(
                            builder:
                                (context, languageTranslationState, child) =>
                                    Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: events.isEmpty
                                      ? const Text(
                                          'There is no CLHIV ART Card services at a moment',
                                        )
                                      : Column(
                                          children: events.map((eventData) {
                                            serviceIndex--;
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                bottom: 15.0,
                                              ),
                                              child: ClhivArtCardVisit(
                                                visitName:
                                                    " CLHIV ART Card service",
                                                eventData: eventData,
                                                visitCount: serviceIndex,
                                                editDisabled: eventData
                                                        .enrollmentOuAccessible !=
                                                    true,
                                                onEdit: () =>
                                                    onEditClhivArtCardService(
                                                  context,
                                                  eventData,
                                                ),
                                                onView: () =>
                                                    onViewClhivArtCardService(
                                                  context,
                                                  eventData,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: EntryFormSaveButton(
                                    label: 'Add CLHIV ART Card Service',
                                    labelColor: Colors.white,
                                    fontSize: 14.0,
                                    buttonColor: const Color(0xFF4B9F46),
                                    onPressButton: () =>
                                        onAddClhivArtCardService(context),
                                  ),
                                ),
                              ],
                            ),
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
