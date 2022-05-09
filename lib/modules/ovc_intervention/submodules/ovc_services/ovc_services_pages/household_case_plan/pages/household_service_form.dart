import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/service_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:provider/provider.dart';

class HouseholdServiceForm extends StatefulWidget {
  const HouseholdServiceForm({
    Key? key,
    required this.hasEditAccess,
    this.shouldEditCaseGapServiceProvision = false,
    this.shouldViewCaseGapServiceProvision = false,
    this.isServiceMonitoring = false,
  }) : super(key: key);

  final bool shouldEditCaseGapServiceProvision;
  final bool shouldViewCaseGapServiceProvision;
  final bool isServiceMonitoring;
  final bool hasEditAccess;
  @override
  _HouseholdServiceFormState createState() => _HouseholdServiceFormState();
}

class _HouseholdServiceFormState extends State<HouseholdServiceForm> {
  final String serviceProvisionLabel = 'Household Service Provision';
  final String translatedServiceProvisionLabel = 'Litsebeletso tsa lelapa';
  final String serviceMonitoringLabel = 'Household Service Monitoring';
  late List<FormSection> formSections;
  Map borderColors = {};
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: Consumer<InterventionCardState>(
          builder: (context, interventionCardState, child) {
            InterventionCard activeInterventionProgram =
                interventionCardState.currentInterventionProgram;
            return Consumer<LanguageTranslationState>(
              builder: (context, languageTranslationState, child) {
                String? currentLanguage =
                    languageTranslationState.currentLanguage;
                return SubPageAppBar(
                  label: widget.isServiceMonitoring
                      ? serviceMonitoringLabel
                      : currentLanguage != 'lesotho'
                          ? serviceProvisionLabel
                          : translatedServiceProvisionLabel,
                  activeInterventionProgram: activeInterventionProgram,
                );
              },
            );
          },
        ),
      ),
      body: SubPageBody(
        body: Consumer<LanguageTranslationState>(
          builder: (context, languageTranslationState, child) {
            return Consumer<OvcHouseholdCurrentSelectionState>(
              builder: (context, ovcHouseholdCurrentSelectionState, child) {
                OvcHousehold? currentOvcHousehold =
                    ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                return Consumer<ServiceFormState>(
                  builder: (context, serviceFormState, child) {
                    Map dataObject = serviceFormState.formState;
                    return Container(
                      child: !isFormReady
                          ? const CircularProcessLoader(
                              color: Colors.blueGrey,
                            )
                          : Column(
                              children: [
                                OvcHouseholdInfoTopHeader(
                                  currentOvcHousehold: currentOvcHousehold,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 13.0,
                                    right: 13.0,
                                  ),
                                  child: Column(
                                    children: formSections
                                        .map(
                                          (FormSection formSection) =>
                                              ServiceFormContainer(
                                            hasEditAccess: widget.hasEditAccess,
                                            shouldEditCaseGapServiceProvision:
                                                widget
                                                    .shouldEditCaseGapServiceProvision,
                                            shouldViewCaseGapServiceProvision:
                                                widget
                                                    .shouldViewCaseGapServiceProvision,
                                            formSectionColor:
                                                borderColors[formSection.id],
                                            formSection: formSection,
                                            dataObject:
                                                dataObject[formSection.id] ??
                                                    {},
                                            isEditableMode: false,
                                            isCasePlanForHousehold: true,
                                            isServiceMonitoring:
                                                widget.isServiceMonitoring,
                                            onInputValueChange: (
                                              dynamic value,
                                            ) =>
                                                null,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
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
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
