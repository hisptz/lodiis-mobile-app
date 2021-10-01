import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/education_intervention_state/education_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_resume_routes/app_resume_route.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/education_beneficiary.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/components/education_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_intervention_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_lbse/constants/lbse_routes_constant.dart';
import 'package:provider/provider.dart';

class EducationLbseLearningOutcomeHome extends StatelessWidget {
  const EducationLbseLearningOutcomeHome({Key? key}) : super(key: key);

  final String label = "LBSE Learning Outcomes";

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

  void redirectToLearningOutcomeForm(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return PpPrevInterventionServiceProvisionForm();
    //     },
    //   ),
    // );
  }

  onAddNewLearningOutcome(
    BuildContext context,
    EducationBeneficiary lbseBeneficiary,
  ) async {
    bool isEditableMode = true;
    String? beneficiaryId = lbseBeneficiary.id;
    String eventId = '';
    String formAutoSaveId =
        "${LbseRoutesConstant.learningOutcomePageModule}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, isEditableMode, null);
      redirectToLearningOutcomeForm(context);
    }
  }

  onViewLearningOutcome(
    BuildContext context,
    Events eventData,
  ) {
    bool isEditableMode = false;
    updateFormState(context, isEditableMode, eventData);
    redirectToLearningOutcomeForm(context);
  }

  onEditLearningOutcome(
    BuildContext context,
    EducationBeneficiary educationBeneficiary,
    Events eventData,
  ) async {
    bool isEditableMode = true;
    String? beneficiaryId = educationBeneficiary.id;
    String eventId = eventData.event!;
    String formAutoSaveId =
        "${LbseRoutesConstant.learningOutcomePageModule}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave =
        await FormAutoSaveOfflineService().getSavedFormAutoData(formAutoSaveId);
    bool shouldResumeWithUnSavedChanges = await AppResumeRoute()
        .shouldResumeWithUnSavedChanges(context, formAutoSave);
    if (shouldResumeWithUnSavedChanges) {
      AppResumeRoute().redirectToPages(context, formAutoSave);
    } else {
      updateFormState(context, isEditableMode, eventData);
      redirectToLearningOutcomeForm(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> programStageIds = [
      LbseInterventionConstant.learningOutcomeProgamStage
    ];
    return SafeArea(
      child: Scaffold(
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
            child: Consumer<EducationInterventionCurrentSelectionState>(
              builder:
                  (context, educationInterventionCurrentSelectionState, child) {
                return Consumer<ServiceEventDataState>(
                  builder: (context, serviceFormState, child) {
                    EducationBeneficiary? lbseBeneficiary =
                        educationInterventionCurrentSelectionState
                            .currentBeneficiciary;
                    bool isLoading = serviceFormState.isLoading;
                    Map<String?, List<Events>> eventListByProgramStage =
                        serviceFormState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                            eventListByProgramStage, programStageIds);
                    int learningOutcomeIndex = events.length + 1;
                    return Container(
                      child: Column(
                        children: [
                          EducationBeneficiaryTopHeader(
                            educationBeneficiary: lbseBeneficiary!,
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
                                                'There is no learning outcome at a moment',
                                              )
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 13.0,
                                                ),
                                                child: Column(
                                                  children: events
                                                      .map((Events eventData) {
                                                    learningOutcomeIndex--;
                                                    return Text(
                                                        "$eventData => $learningOutcomeIndex");
                                                  }).toList(),
                                                ),
                                              ),
                                      ),
                                      EntryFormSaveButton(
                                        label: 'ADD LEARNING OUTCOME',
                                        labelColor: Colors.white,
                                        buttonColor: Color(0xFF009688),
                                        fontSize: 15.0,
                                        onPressButton: () =>
                                            onAddNewLearningOutcome(
                                                context, lbseBeneficiary),
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
      ),
    );
  }
}
