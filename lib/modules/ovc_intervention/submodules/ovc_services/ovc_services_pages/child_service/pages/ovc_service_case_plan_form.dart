import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/service_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_case_plan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_case_plan_gap.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:provider/provider.dart';

class OcvServiceCasePlanForm extends StatefulWidget {
  const OcvServiceCasePlanForm({
    Key? key,
    this.shouldEditCaseGapServiceProvision = false,
    this.shouldViewCaseGapServiceProvision = false,
    this.isServiceMonitoring = false,
    required this.hasEditAccess,
  }) : super(key: key);

  final bool shouldEditCaseGapServiceProvision;
  final bool shouldViewCaseGapServiceProvision;
  final bool isServiceMonitoring;
  final bool hasEditAccess;

  @override
  _OcvServiceCasePlanFormState createState() => _OcvServiceCasePlanFormState();
}

class _OcvServiceCasePlanFormState extends State<OcvServiceCasePlanForm> {
  final String serviceProvisionLabel = 'Service Provision';
  final String translatedServiceProvisionLabel = 'Phano ea Litsebeletso';
  final String serviceMonitoringLabel = 'Service Monitoring';
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

  onInputValueChange(String? formSectionId, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(formSectionId, value);
  }

  bool isAllDomainGoalAndGapFilled(Map dataObject) {
    bool isAllDomainFilled = true;
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String domainType in dataObject.keys.toList()) {
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
    OvcHouseholdChild currentOvcHouseholdChild,
  ) async {
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String domainType in dataObject.keys.toList()) {
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
              OvcServicesChildCasePlanGap.getFormSections()
                  .where(
                      (FormSection formSection) => formSection.id == domainType)
                  .toList();
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcChildCasePlanConstant.program,
            OvcChildCasePlanConstant.casePlanProgramStage,
            currentOvcHouseholdChild.orgUnit,
            domainFormSections,
            domainDataObject,
            domainDataObject['eventDate'],
            currentOvcHouseholdChild.id,
            domainDataObject['eventId'],
            hiddenFields,
          );
          hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage
          ];
          for (Map domainGapDataObject in domainDataObject['gaps']) {
            await TrackedEntityInstanceUtil
                .savingTrackedEntityInstanceEventData(
              OvcChildCasePlanConstant.program,
              OvcChildCasePlanConstant.casePlanGapProgramStage,
              currentOvcHouseholdChild.orgUnit,
              domainGapFormSections,
              domainGapDataObject,
              domainGapDataObject['eventDate'],
              currentOvcHouseholdChild.id,
              domainGapDataObject['eventId'],
              hiddenFields,
            );
          }
        } catch (e) {
          //
        }
      }
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
        body: Consumer<ServiceFormState>(
          builder: (context, serviceFormState, child) {
            Map dataObject = serviceFormState.formState;
            return Container(
              child: !isFormReady
                  ? const CircularProcessLoader(
                      color: Colors.blueGrey,
                    )
                  : Consumer<OvcHouseholdCurrentSelectionState>(builder:
                      (context, ovcHouseholdCurrentSelectionState, child) {
                      OvcHouseholdChild currentOvcHouseholdChild =
                          ovcHouseholdCurrentSelectionState
                              .currentOvcHouseholdChild!;
                      int age = 5;
                      try {
                        age = int.parse(currentOvcHouseholdChild.age!);
                      } catch (e) {
                        //
                      }

                      return Column(
                        children: [
                          const OvcChildInfoTopHeader(),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10.0,
                              left: 13.0,
                              right: 13.0,
                            ),
                            child: Column(
                              children: formSections
                                  .map(
                                    (FormSection formSection) => (age < 5 &&
                                            formSection.id == 'Schooled')
                                        ? Container()
                                        : ServiceFormContainer(
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
                                                dataObject[formSection.id],
                                            isEditableMode:
                                                serviceFormState.isEditableMode,
                                            isServiceMonitoring:
                                                widget.isServiceMonitoring,
                                            onInputValueChange:
                                                (dynamic value) =>
                                                    onInputValueChange(
                                                        formSection.id, value),
                                          ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    }),
            );
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
