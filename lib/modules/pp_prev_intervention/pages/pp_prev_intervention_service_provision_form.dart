import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_current_selection_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/pp_prev_beneficiary.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_intervention_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_routes_constant.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/models/pp_prev_service_form.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/skip_logics/pp_prev_service_form_skip_logic.dart';
import 'package:provider/provider.dart';

class PpPrevInterventionServiceProvisionForm extends StatefulWidget {
  const PpPrevInterventionServiceProvisionForm({Key? key}) : super(key: key);

  @override
  State<PpPrevInterventionServiceProvisionForm> createState() =>
      _PpPrevInterventionServiceProvisionFormState();
}

class _PpPrevInterventionServiceProvisionFormState
    extends State<PpPrevInterventionServiceProvisionForm> {
  final String label = "PP Prev Service Provision Form";
  List<FormSection>? formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = PpPrevServiceForm.getFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await PpPrevServiceFormSkipLogic.evaluateSkipLogics(
          context,
          formSections!,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    onUpdateFormAutoSaveState(context);
  }

  void onSaveForm(BuildContext context, Map dataObject,
      PpPrevBeneficiary ppPrevBeneficiary) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      setState(() {
        isSaving = true;
      });
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      List<String> hiddenFields = [];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            PpPrevInterventionConstant.program,
            PpPrevInterventionConstant.programStage,
            ppPrevBeneficiary.orgUnit,
            formSections!,
            dataObject,
            eventDate,
            ppPrevBeneficiary.id,
            eventId,
            hiddenFields);
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(ppPrevBeneficiary.id);
        Timer(Duration(seconds: 1), () {
          setState(() {
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
              context,
              ppPrevBeneficiary.id,
              eventId ?? '',
            );
            Navigator.pop(context);
          });
        });
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
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

  void clearFormAutoSaveState(
      BuildContext context, String? beneficiaryId, String eventId) async {
    String formAutoSaveId =
        "${PpPrevRoutesConstant.serviceFormPageModule}_${beneficiaryId}_$eventId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    var currentPpPrev =
        Provider.of<PpPrevBeneficiarySelectionState>(context, listen: false)
            .currentPpPrev;
    String? beneficiaryId = currentPpPrev!.id;
    Map dataObject =
        Provider.of<ServiceFormState>(context, listen: false).formState;
    String eventId = dataObject['eventId'] ?? '';
    String id =
        "${PpPrevRoutesConstant.serviceFormPageModule}_${beneficiaryId}_$eventId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: PpPrevRoutesConstant.serviceFormPageModule,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : PpPrevRoutesConstant.serviceFormNextPageModule
          : PpPrevRoutesConstant.serviceFormPageModule,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  @override
  Widget build(BuildContext context) {
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
            child: Consumer<LanguageTranslationState>(
                builder: (context, languageTranslationState, child) {
              String? currentLanguage =
                  languageTranslationState.currentLanguage;
              return Consumer<PpPrevBeneficiarySelectionState>(
                builder: (context, dreamBeneficiarySelectionState, child) {
                  return Consumer<ServiceFormState>(
                    builder: (context, serviceFormState, child) {
                      PpPrevBeneficiary? ppPrevBeneficiary =
                          dreamBeneficiarySelectionState.currentPpPrev;
                      return Container(
                        child: Column(
                          children: [
                            PpPrevBeneficiaryTopHeader(
                              ppPrevBeneficiary: ppPrevBeneficiary!,
                            ),
                            Container(
                              child: !isFormReady
                                  ? Container(
                                      child: CircularProcessLoader(
                                        color: Colors.blueGrey,
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10.0,
                                            left: 13.0,
                                            right: 13.0,
                                          ),
                                          child: EntryFormContainer(
                                            hiddenFields:
                                                serviceFormState.hiddenFields,
                                            hiddenSections:
                                                serviceFormState.hiddenSections,
                                            formSections: formSections,
                                            mandatoryFieldObject: Map(),
                                            isEditableMode:
                                                serviceFormState.isEditableMode,
                                            dataObject:
                                                serviceFormState.formState,
                                            onInputValueChange:
                                                onInputValueChange,
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              serviceFormState.isEditableMode,
                                          child: EntryFormSaveButton(
                                            label: isSaving
                                                ? 'Saving ...'
                                                : currentLanguage == 'lesotho'
                                                    ? 'Boloka'
                                                    : 'Save',
                                            labelColor: Colors.white,
                                            buttonColor: Color(0xFF9B2BAE),
                                            fontSize: 15.0,
                                            onPressButton: () => onSaveForm(
                                              context,
                                              serviceFormState.formState,
                                              ppPrevBeneficiary,
                                            ),
                                          ),
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
