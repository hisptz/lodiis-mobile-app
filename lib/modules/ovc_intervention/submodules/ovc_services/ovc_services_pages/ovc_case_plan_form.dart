import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan/case_plan_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:provider/provider.dart';

class OvcCasePlanForm extends StatefulWidget {
  const OvcCasePlanForm({
    Key? key,
    required this.casePlanLabel,
    required this.hasEditAccess,
    required this.isHouseholdCasePlan,
    required this.casePlanProgram,
    required this.casePlanProgramStage,
    required this.casePlanGapProgramStage,
    required this.casePlanServiceProgramStage,
    required this.casePlanMonitoringProgramStage,
    required this.isOnCasePlanPage,
    required this.isOnCasePlanServiceProvision,
    required this.isOnCasePlanServiceMonitoring,
  }) : super(key: key);

  final String casePlanLabel;
  final bool hasEditAccess;
  final String casePlanProgram;
  final String casePlanProgramStage;
  final String casePlanGapProgramStage;
  final String casePlanServiceProgramStage;
  final String casePlanMonitoringProgramStage;
  final bool isHouseholdCasePlan;
  final bool isOnCasePlanPage;
  final bool isOnCasePlanServiceProvision;
  final bool isOnCasePlanServiceMonitoring;

  @override
  State<OvcCasePlanForm> createState() => _OvcCasePlanFormState();
}

class _OvcCasePlanFormState extends State<OvcCasePlanForm> {
  List<FormSection> formSections = [];
  Map borderColors = {};

  final bool _isSaving = false;
  bool _isFormReady = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      _setFormMetadata();
    });
  }

  void _setFormMetadata() {
    _isFormReady = true;
    setState(() {});
    formSections = [];
    for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
      borderColors[formSection.id] = formSection.borderColor;
      formSection.borderColor = Colors.transparent;
      formSections.add(formSection);
    }
    Timer(const Duration(milliseconds: 200), () {
      _isFormReady = false;
      setState(() {});
    });
  }

  onInputValueChange(String? formSectionId, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(formSectionId, value);
  }

  void onSaveCasePlan() {}

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
              label: widget.casePlanLabel,
              activeInterventionProgram: activeInterventionProgram,
            );
          },
        ),
      ),
      body: SubPageBody(
        body: Consumer<LanguageTranslationState>(
          builder: (context, languageTranslationState, child) {
            String? currentLanguage = languageTranslationState.currentLanguage;
            return Consumer<OvcHouseholdCurrentSelectionState>(
                builder: (context, ovcHouseholdCurrentSelectionState, child) {
              OvcHousehold? currentOvcHousehold =
                  ovcHouseholdCurrentSelectionState.currentOvcHousehold;
              OvcHouseholdChild? currentOvcHouseholdChild =
                  ovcHouseholdCurrentSelectionState.currentOvcHouseholdChild;
              int beneficairyAge = int.tryParse(widget.isHouseholdCasePlan
                      ? currentOvcHousehold!.age!
                      : currentOvcHouseholdChild!.age!) ??
                  0;
              return Consumer<ServiceFormState>(
                  builder: (context, serviceFormState, child) {
                Map dataObject = serviceFormState.formState;
                return Container(
                  margin: const EdgeInsets.symmetric(),
                  child: _isFormReady
                      ? const CircularProcessLoader(
                          color: Colors.blueGrey,
                        )
                      : Column(
                          children: [
                            widget.isHouseholdCasePlan
                                ? OvcHouseholdInfoTopHeader(
                                    currentOvcHousehold: currentOvcHousehold,
                                  )
                                : const OvcChildInfoTopHeader(),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 13.0,
                              ),
                              child: Column(
                                children: formSections
                                    .where((formSection) =>
                                        formSection.id == 'Schooled'
                                            ? beneficairyAge > 5
                                                ? true
                                                : false
                                            : true)
                                    .toList()
                                    .map(
                                      (formSection) => Container(
                                        margin: const EdgeInsets.symmetric(),
                                        child: CasePlanFormContainer(
                                          formSectionColor:
                                              borderColors[formSection.id],
                                          formSection: formSection,
                                          isEditableMode:
                                              serviceFormState.isEditableMode,
                                          dataObject:
                                              dataObject[formSection.id],
                                          onInputValueChange: (
                                            dynamic value,
                                          ) =>
                                              onInputValueChange(
                                                  formSection.id, value),
                                          isHouseholdCasePlan:
                                              widget.isHouseholdCasePlan,
                                          hasEditAccess: widget.hasEditAccess,
                                          isOnCasePlanPage:
                                              widget.isOnCasePlanPage,
                                          isOnCasePlanServiceProvision: widget
                                              .isOnCasePlanServiceProvision,
                                          isOnCasePlanServiceMonitoring: widget
                                              .isOnCasePlanServiceMonitoring,
                                        ),
                                      ),
                                    )
                                    .toList()
                                  ..add(
                                    Container(
                                      margin: const EdgeInsets.symmetric(),
                                      child: Visibility(
                                        visible:
                                            serviceFormState.isEditableMode,
                                        child: EntryFormSaveButton(
                                          label: _isSaving
                                              ? 'Saving ...'
                                              : currentLanguage == 'lesotho'
                                                  ? 'Boloka'
                                                  : 'Save',
                                          labelColor: Colors.white,
                                          buttonColor: const Color(0xFF4B9F46),
                                          fontSize: 15.0,
                                          onPressButton: () => {},
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                            ),
                          ],
                        ),
                );
              });
            });
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
