//  final String label = 'HIV Register';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
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
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/post_gbv/constants/post_gbv_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/post_gbv/pages/agyw_dreams_post_gbv_form.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsPostGBV extends StatefulWidget {
  AgywDreamsPostGBV({Key? key}) : super(key: key);

  @override
  _AgywDreamsPostGBVState createState() => _AgywDreamsPostGBVState();
}

class _AgywDreamsPostGBVState extends State<AgywDreamsPostGBV> {
  final String label = 'POST GBV';
  List<String> programStageIds = [PostGBVConstant.programStage];
  @override
  void initState() {
    super.initState();
  }

  void onAddPrep(BuildContext context, AgywDream agywDream) async {
    FormUtil.updateServiceFormState(context, true, null);
    String? beneficiaryId = agywDream.id;
    String? eventId = '';
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsPostGBVFormPage}_${beneficiaryId}_$eventId";
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
          builder: (context) => AgywDreamsPostGBVForm(),
        ),
      );
    }
  }

  void onViewPrep(BuildContext context, Events eventData) {
    FormUtil.updateServiceFormState(context, false, eventData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgywDreamsPostGBVForm(),
      ),
    );
  }

  void onEditPrep(
      BuildContext context, Events eventData, AgywDream agywDream) async {
    FormUtil.updateServiceFormState(context, true, eventData);
    String? beneficiaryId = agywDream.id;
    String? eventId = eventData.event;
    String formAutoSaveId =
        "${DreamsRoutesConstant.agywDreamsPostGBVFormPage}_${beneficiaryId}_$eventId";
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
          builder: (context) => AgywDreamsPostGBVForm(),
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
                builder: (context, serviceEventDataState, child) {
                  AgywDream? agywDream =
                      dreamBeneficiarySelectionState.currentAgywDream;
                  bool isLoading = serviceEventDataState.isLoading;
                  Map<String?, List<Events>> eventListByProgramStage =
                      serviceEventDataState.eventListByProgramStage;
                  List<Events> events = TrackedEntityInstanceUtil
                      .getAllEventListFromServiceDataStateByProgramStages(
                          eventListByProgramStage, programStageIds);
                  int postGbvVisitIndex = events.length + 1;
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
                                              'There is no POST GBV at a moment')
                                          : Container(
                                              margin: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 13.0,
                                              ),
                                              child: Column(
                                                children: events
                                                    .map((Events eventData) {
                                                  postGbvVisitIndex--;
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                      bottom: 15.0,
                                                    ),
                                                    child:
                                                        DreamsServiceVisitCard(
                                                      visitName: "POST GBV",
                                                      onEdit: () => onEditPrep(
                                                          context,
                                                          eventData,
                                                          agywDream!),
                                                      onView: () => onViewPrep(
                                                          context, eventData),
                                                      eventData: eventData,
                                                      visitCount:
                                                          postGbvVisitIndex,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                    ),
                                    EntryFormSaveButton(
                                      label: 'ADD POST GBV VISIT',
                                      labelColor: Colors.white,
                                      buttonColor: Color(0xFF1F8ECE),
                                      fontSize: 15.0,
                                      onPressButton: () =>
                                          onAddPrep(context, agywDream!),
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
