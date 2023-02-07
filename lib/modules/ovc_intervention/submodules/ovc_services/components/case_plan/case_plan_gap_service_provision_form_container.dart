import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/household_service_provision.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_service_provision.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/skip_logics/ovc_case_plan_service_provision_skip_logic.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_case_plan_service_provision_household_to_ovc_util.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_service_provision_util.dart';
import 'package:provider/provider.dart';

class CasePlanGapServiceProvisionFormContainer extends StatefulWidget {
  const CasePlanGapServiceProvisionFormContainer({
    Key? key,
    required this.gapServiceObject,
    required this.isHouseholdCasePlan,
    required this.domainId,
    required this.isEditableMode,
    required this.formSectionColor,
  }) : super(key: key);

  final Map gapServiceObject;
  final bool isHouseholdCasePlan;
  final String domainId;
  final bool isEditableMode;
  final Color formSectionColor;

  @override
  State<CasePlanGapServiceProvisionFormContainer> createState() =>
      _CasePlanGapServiceProvisionFormContainerState();
}

class _CasePlanGapServiceProvisionFormContainerState
    extends State<CasePlanGapServiceProvisionFormContainer>
    with OvcCasePlanServiceProvisionSkipLogic {
  bool _isFormReady = false;
  bool _isSaving = false;
  List<FormSection> formSections = [];
  Map mandatoryFieldObject = {};

  @override
  void initState() {
    super.initState();
    setFormMetadata();
  }

  void setFormMetadata() {
    mandatoryFieldObject.clear();
    formSections = widget.isHouseholdCasePlan
        ? HouseholdServiceProvision.getFormSections(
            firstDate: widget.gapServiceObject['casePlanDate'] ??
                AppUtil.formattedDateTimeIntoString(
                  DateTime.now(),
                ))
        : OvcServicesChildServiceProvision.getFormSections(
            firstDate: widget.gapServiceObject['casePlanDate'] ??
                AppUtil.formattedDateTimeIntoString(
                  DateTime.now(),
                ));
    formSections = formSections
        .where((formSection) => formSection.id == widget.domainId)
        .toList();
    formSections = formSections.map((formSection) {
      formSection.borderColor = Colors.transparent;
      return formSection;
    }).toList();
    Timer(const Duration(milliseconds: 200), () {
      _isFormReady = true;
      evaluateSkipLogics(context, formSections, widget.gapServiceObject);
      setState(() {});
    });
  }

  void onInputValueChange(String id, dynamic value) {
    widget.gapServiceObject[id] = value;
    setState(() {});
    evaluateSkipLogics(context, formSections, widget.gapServiceObject);
    Map<String, dynamic> sessionNumberValidation =
        OvcServiceProvisionUtil.getSessionNumberValidation(
            widget.gapServiceObject);
    setState(() {});
    setSessionNumberViolationMessages(sessionNumberValidation);
  }

  void onSaveCasePlanServiceProvision() async {
    bool hasAtLeastOnFieldFilled = FormUtil.hasAtLeastOnFieldFilled(
      hiddenFields: hiddenFields,
      formSections: formSections,
      dataObject: widget.gapServiceObject,
    );
    if (hasAtLeastOnFieldFilled) {
      Map<String, dynamic> sessionNumberValidation =
          OvcServiceProvisionUtil.getSessionNumberValidation(
              widget.gapServiceObject);
      setSessionNumberViolationMessages(sessionNumberValidation);
      bool isSessionNumberExit = sessionNumberValidation["isSessionNumberExit"];
      bool isSessionNumberInValid =
          sessionNumberValidation["isSessionNumberInValid"];
      if (!isSessionNumberExit && !isSessionNumberInValid) {
        _isSaving = true;
        setState(() {});
        try {
          TrackedEntityInstance beneficiary = widget.isHouseholdCasePlan
              ? Provider.of<OvcHouseholdCurrentSelectionState>(context,
                      listen: false)
                  .currentOvcHousehold!
                  .teiData!
              : Provider.of<OvcHouseholdCurrentSelectionState>(context,
                      listen: false)
                  .currentOvcHouseholdChild!
                  .teiData!;
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            widget.isHouseholdCasePlan
                ? OvcHouseholdCasePlanConstant.program
                : OvcChildCasePlanConstant.program,
            widget.isHouseholdCasePlan
                ? OvcHouseholdCasePlanConstant
                    .casePlanGapServiceProvisionProgramStage
                : OvcChildCasePlanConstant
                    .casePlanGapServiceProvisionProgramStage,
            beneficiary.orgUnit,
            formSections,
            widget.gapServiceObject,
            widget.gapServiceObject['eventDate'],
            beneficiary.trackedEntityInstance,
            widget.gapServiceObject['eventId'],
            [OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage],
          );
          if (widget.isHouseholdCasePlan) {
            await OvcCasePlanServiceProvisionHouseholdToOvcUtil
                .autoSyncOvcsCasePlanServiceProvisions(
              childrens: Provider.of<OvcHouseholdCurrentSelectionState>(context,
                          listen: false)
                      .currentOvcHousehold!
                      .children ??
                  [],
              dataObject: widget.gapServiceObject,
              domainId: widget.domainId,
            );
          }
          Provider.of<ServiceEventDataState>(context, listen: false)
              .resetServiceEventDataState(beneficiary.trackedEntityInstance);
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
          );
          Navigator.pop(context);
        } catch (e) {
          _isSaving = true;
          setState(() {});
          AppUtil.showToastMessage(
            message: e.toString(),
          );
        }
      } else {
        AppUtil.showToastMessage(
          message: 'Session number is invalid or already exist',
        );
      }
    } else {
      AppUtil.showToastMessage(
        message: 'Please fill at least one field field',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15.0,
      ),
      child: !_isFormReady
          ? const CircularProcessLoader(
              color: Colors.blueGrey,
            )
          : Container(
              margin: const EdgeInsets.symmetric(),
              child: Column(
                children: [
                  EntryFormContainer(
                    hiddenFields: hiddenFields,
                    hiddenSections: hiddenSections,
                    elevation: 0.0,
                    formSections: formSections,
                    mandatoryFieldObject: mandatoryFieldObject,
                    dataObject: widget.gapServiceObject,
                    isEditableMode: widget.isEditableMode,
                    onInputValueChange: onInputValueChange,
                  ),
                  Visibility(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Consumer<LanguageTranslationState>(
                          builder: (context, languageTranslationState, child) {
                        String? currentLanguage =
                            languageTranslationState.currentLanguage;
                        return TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: widget.formSectionColor,
                          ),
                          onPressed: onSaveCasePlanServiceProvision,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              vertical: 22.0,
                            ),
                            child: Text(
                              currentLanguage == 'lesotho'
                                  ? _isSaving
                                      ? 'E EA BOLOKA LITSEBELETSO ...'
                                      : 'BOLOKA LITSEBELETSO'
                                  : _isSaving
                                      ? 'SAVING SERVICE ...'
                                      : 'SAVE SERVICE',
                              style: const TextStyle().copyWith(
                                color: const Color(0xFFFAFAFA),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  void setSessionNumberViolationMessages(
    Map<String, dynamic> sessionNumberValidation,
  ) {
    bool isSessionNumberExit = sessionNumberValidation["isSessionNumberExit"];
    bool isSessionNumberInValid =
        sessionNumberValidation["isSessionNumberInValid"];
    String message = "";
    if (isSessionNumberInValid) {
      List<String> sessionWithInvalidSessionNumber =
          sessionNumberValidation["sessionWithInvalidSessionNumber"] ?? [];
      String inputFieldLabels =
          getInputFieldsLabel(formSections, sessionWithInvalidSessionNumber)
              .join(", ");
      message =
          "Session number for $inputFieldLabels are not valid session number";
    } else if (isSessionNumberExit) {
      List<String> sessionWithExistingSessionNumber =
          sessionNumberValidation["sessionWithExistingSessionNumber"] ?? [];
      String inputFieldLabels =
          getInputFieldsLabel(formSections, sessionWithExistingSessionNumber)
              .join(", ");
      message =
          "Session number for $inputFieldLabels already existed for prevision service provision ";
    }
    if (message.isNotEmpty) {
      AppUtil.showToastMessage(
        message: message,
      );
    }
  }

  List<String> getInputFieldsLabel(
    List<FormSection> formSections,
    List<String> inputFieldIds,
  ) {
    String? currentLanguage =
        Provider.of<LanguageTranslationState>(context, listen: false)
            .currentLanguage;
    List<String> inputFieldLabels = [];
    for (FormSection formSection in formSections) {
      for (InputField inputField in formSection.inputFields!) {
        if (inputFieldIds.contains(inputField.id)) {
          if (inputField.id != '' &&
              inputField.id != 'location' &&
              inputField.valueType != 'CHECK_BOX') {
            String? label = currentLanguage == 'lesotho' &&
                    inputField.translatedName!.isNotEmpty
                ? inputField.translatedName
                : inputField.name;
            inputFieldLabels.add(label!);
          }
          if (inputField.valueType == 'CHECK_BOX') {
            for (var option in inputField.options!) {
              String? label = currentLanguage == 'lesotho' &&
                      option.translatedName!.isNotEmpty
                  ? option.translatedName
                  : option.name;
              inputFieldLabels.add(label!);
            }
          }
        }
      }
      List<String> subSectionFormInputFieldLabels =
          getInputFieldsLabel(formSection.subSections!, inputFieldIds);
      inputFieldLabels.addAll(subSectionFormInputFieldLabels);
    }
    return inputFieldLabels.toSet().toList();
  }
}
