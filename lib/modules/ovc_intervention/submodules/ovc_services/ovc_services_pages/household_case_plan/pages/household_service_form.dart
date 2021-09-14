import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_household_case_plan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/service_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:provider/provider.dart';

class HouseholdServiceForm extends StatefulWidget {
  HouseholdServiceForm({
    Key? key,
    this.shouldEditCaseGapServiceProvision = false,
    this.shoulViewCaseGapServiceProvision = false,
  }) : super(key: key);

  final bool shouldEditCaseGapServiceProvision;
  final bool shoulViewCaseGapServiceProvision;
  @override
  _HouseholdServiceFormState createState() => _HouseholdServiceFormState();
}

class _HouseholdServiceFormState extends State<HouseholdServiceForm> {
  final String label = 'Household Service Provision';
  late List<FormSection> formSections;
  Map borderColors = Map();
  bool isSaving = false;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      formSections = [];
      for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
        borderColors[formSection.id] = formSection.borderColor;
        formSection.borderColor = Colors.transparent;
        formSections.add(formSection);
      }
      isFormReady = true;
    });
  }

  onInputValueChange(String? formSectionId, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(formSectionId, value);
  }

  bool isAllDomainGoalAndGapFilled(Map dataObject) {
    bool isAllDomainFilled = true;
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String? domainType in dataObject.keys.toList()) {
      Map domainDataObject = dataObject[domainType];
      if (domainDataObject['gaps'].length > 0 &&
          (domainDataObject[casePlanFirstGoal] == null ||
              '${domainDataObject[casePlanFirstGoal]}'.trim() == '')) {
        isAllDomainFilled = false;
      }
    }
    return isAllDomainFilled;
  }

  Future savingDomainsAndGaps(
    Map dataObject,
    OvcHousehold? currentOvcHousehold,
  ) async {
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String? domainType in dataObject.keys.toList()) {
      Map domainDataObject = dataObject[domainType];
      if (domainDataObject['gaps'].length > 0 &&
          (domainDataObject[casePlanFirstGoal] != null ||
              '${domainDataObject[casePlanFirstGoal]}'.trim() != '')) {
        try {
          List<String> hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanDomainType
          ];
          List<FormSection> domainFormSections = formSections
              .where((FormSection formSection) => formSection.id == domainType)
              .toList();
          List<FormSection> domainGapFormSections =
              OvcHouseholdServicesCasePlanGaps.getFormSections()
                  .where(
                      (FormSection formSection) => formSection.id == domainType)
                  .toList();
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcHouseholdCasePlanConstant.program,
            OvcHouseholdCasePlanConstant.casePlanProgramStage,
            currentOvcHousehold!.orgUnit,
            domainFormSections,
            domainDataObject,
            domainDataObject['eventDate'],
            currentOvcHousehold.id,
            domainDataObject['eventId'],
            hiddenFields,
          );
          hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanGapToFollowUpLinkage
          ];
          for (Map domainGapDataObject in domainDataObject['gaps']) {
            await TrackedEntityInstanceUtil
                .savingTrackedEntityInstanceEventData(
              OvcHouseholdCasePlanConstant.program,
              OvcHouseholdCasePlanConstant.casePlanGapProgramStage,
              currentOvcHousehold.orgUnit,
              domainGapFormSections,
              domainGapDataObject,
              domainGapDataObject['eventDate'],
              currentOvcHousehold.id,
              domainGapDataObject['eventId'],
              hiddenFields,
            );
          }
        } catch (e) {}
      }
    }
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    OvcHousehold? currentOvcHousehold,
  ) async {
    bool isAllDomainFilled = isAllDomainGoalAndGapFilled(dataObject);
    if (isAllDomainFilled) {
      setState(() {
        isSaving = true;
      });
      await savingDomainsAndGaps(dataObject, currentOvcHousehold);
      Provider.of<ServiceEventDataState>(context, listen: false)
          .resetServiceEventDataState(currentOvcHousehold!.id);
      Timer(Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
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
          Navigator.pop(context);
        }
      });
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least first goal for all domain with gaps',
          position: ToastGravity.TOP);
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
            child: Consumer<LanguageTranslationState>(
              builder: (context, languageTranslationState, child) {
                String? currentLanguage =
                    languageTranslationState.currentLanguage;
                return Consumer<OvcHouseholdCurrentSelectionState>(
                  builder: (context, ovcHouseholdCurrentSelectionState, child) {
                    OvcHousehold? currentOvcHousehold =
                        ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                    return Consumer<ServiceFormState>(
                      builder: (context, serviceFormState, child) {
                        Map dataObject = serviceFormState.formState;
                        return Container(
                          child: !isFormReady
                              ? Container(
                                  child: CircularProcessLoader(
                                    color: Colors.blueGrey,
                                  ),
                                )
                              : Column(
                                  children: [
                                    OvcHouseholdInfoTopHeader(
                                      currentOvcHousehold: currentOvcHousehold,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 10.0,
                                        left: 13.0,
                                        right: 13.0,
                                      ),
                                      child: Column(
                                        children: formSections
                                            .map(
                                              (FormSection formSection) =>
                                                  ServiceFormContainer(
                                                shouldEditCaseGapServiceProvision:
                                                    widget
                                                        .shouldEditCaseGapServiceProvision,
                                                shoulViewCaseGapServiceProvision:
                                                    widget
                                                        .shoulViewCaseGapServiceProvision,
                                                formSectionColor: borderColors[
                                                    formSection.id],
                                                formSection: formSection,
                                                dataObject:
                                                    dataObject[formSection.id],
                                                isEditableMode: serviceFormState
                                                    .isEditableMode,
                                                isCasePlanForHousehold: true,
                                                onInputValueChange: (
                                                  dynamic value,
                                                ) =>
                                                    onInputValueChange(
                                                        formSection.id, value),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    Visibility(
                                      visible: serviceFormState.isEditableMode,
                                      child: EntryFormSaveButton(
                                        label: isSaving
                                            ? 'Saving ...'
                                            : currentLanguage == 'lesotho'
                                                ? 'Boloka'
                                                : 'Save',
                                        labelColor: Colors.white,
                                        buttonColor: Color(0xFF4B9F46),
                                        fontSize: 15.0,
                                        onPressButton: () => onSaveForm(
                                            context,
                                            serviceFormState.formState,
                                            currentOvcHousehold),
                                      ),
                                    )
                                  ],
                                ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
