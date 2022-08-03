import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/program_status.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_household_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/models/ovc_exit_case_transfer.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/component/ovc_household_exit_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/household_exit_pages/household_transfer/constants/ovc_household_case_transfer_constant.dart';
import 'package:provider/provider.dart';

class OvcHouseholdCaseTransfer extends StatefulWidget {
  const OvcHouseholdCaseTransfer({Key? key}) : super(key: key);

  @override
  _OvcHouseholdCaseTransferState createState() =>
      _OvcHouseholdCaseTransferState();
}

class _OvcHouseholdCaseTransferState extends State<OvcHouseholdCaseTransfer> {
  final String label = 'Household Case Transfer Form';

  final List<String> programStageIds = [
    OvcHouseholdCaseTransferConstant.programStage
  ];

  bool isSaving = false;
  List<FormSection>? formSections;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setFromSection();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
      });
    });
  }

  setFromSection() {
    OvcHousehold? household =
        Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
            .currentOvcHousehold;
    formSections = OvcExitCaseTransfer.getFormSections(
      firstDate: household!.createdDate!,
    );
  }

  void clearFormAutoSaveState(
      BuildContext context, String? beneficiaryId, String eventId) async {
    String formAutoSaveId =
        "${OvcRoutesConstant.householdTransferFormPage}_${beneficiaryId}_$eventId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    OvcHousehold? currentOvcHousehold,
  ) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      setState(() {
        isSaving = true;
      });
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      String programStatusId = 'PN92g65TkVI';
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          OvcHouseholdCaseTransferConstant.program,
          OvcHouseholdCaseTransferConstant.programStage,
          currentOvcHousehold!.orgUnit,
          formSections!,
          dataObject,
          eventDate,
          currentOvcHousehold.id,
          eventId,
          null,
        );
        await OvcEnrollmentHouseholdService().updateHouseholdStatus(
          trackedEntityInstance: currentOvcHousehold.id,
          orgUnit: currentOvcHousehold.orgUnit,
          dataObject: {programStatusId: ProgramStatus.transferred},
        );
        Provider.of<OvcInterventionListState>(context, listen: false)
            .refreshOvcList();
        Provider.of<OvcHouseholdCurrentSelectionState>(context, listen: false)
            .refetchCurrentHousehold();
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentOvcHousehold.id);
        Timer(const Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
          });
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          clearFormAutoSaveState(
              context, currentOvcHousehold.id, eventId ?? '');
          Navigator.pop(context);
        });
      } catch (e) {
        Timer(const Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
            AppUtil.showToastMessage(
              message: e.toString(),
              position: ToastGravity.BOTTOM,
            );
            Navigator.pop(context);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
        message: 'Please fill at least one form field',
        position: ToastGravity.TOP,
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
        body: Consumer<OvcHouseholdCurrentSelectionState>(
          builder: (context, ovcHouseholdCurrentSelectionState, child) {
            OvcHousehold? currentOvcHousehold =
                ovcHouseholdCurrentSelectionState.currentOvcHousehold;
            return Column(
              children: [
                OvcHouseholdInfoTopHeader(
                  currentOvcHousehold: currentOvcHousehold,
                ),
                Consumer<ServiceEventDataState>(
                  builder: (context, serviceEventDataState, child) {
                    bool isLoading = serviceEventDataState.isLoading;
                    Map<String?, List<Events>> eventListByProgramStage =
                        serviceEventDataState.eventListByProgramStage;
                    List<Events> eventList = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                            eventListByProgramStage, programStageIds);
                    Events? event = eventList.isNotEmpty ? eventList[0] : null;
                    return isLoading && !isFormReady
                        ? const CircularProcessLoader(
                            color: Colors.blueGrey,
                          )
                        : OvcHouseholdExitFormContainer(
                            event: event,
                            isSaving: isSaving,
                            exitType: 'transfer',
                            formSections: formSections,
                            onSaveForm: (dataObject) => onSaveForm(
                              context,
                              dataObject,
                              currentOvcHousehold,
                            ),
                          );
                  },
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
