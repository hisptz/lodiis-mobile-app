import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/household_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/skip_logics/ovc_service_monitoring_skip_logic.dart';
import 'package:provider/provider.dart';

class CasePlanGapServiceMonitoringFormContainer extends StatefulWidget {
  const CasePlanGapServiceMonitoringFormContainer({
    Key? key,
    required this.domainId,
    required this.formSectionColor,
    required this.gapServiceMonitoringObject,
    required this.isHouseholdCasePlan,
    required this.isEditableMode,
  }) : super(key: key);

  final String domainId;
  final Color formSectionColor;
  final Map gapServiceMonitoringObject;
  final bool isHouseholdCasePlan;
  final bool isEditableMode;

  @override
  State<CasePlanGapServiceMonitoringFormContainer> createState() =>
      _CasePlanGapServiceMonitoringFormContainerState();
}

class _CasePlanGapServiceMonitoringFormContainerState
    extends State<CasePlanGapServiceMonitoringFormContainer>
    with OvcServiceMonitoringSkipLogic {
  bool _isFormReady = false;
  final bool _isSaving = false;
  List<FormSection> formSections = [];
  Map mandatoryFieldObject = {};

  @override
  void initState() {
    super.initState();
    setFormMetdata();
  }

  void setFormMetdata() {
    mandatoryFieldObject.clear();
    formSections = widget.isHouseholdCasePlan
        ? HouseholdServicesOngoingMonitoring.getFormSections()
        : OvcServicesOngoingMonitoring.getFormSections();
    formSections = formSections
        .where((formSection) =>
            formSection.id == widget.domainId ||
            formSection.id == '' ||
            formSection.id == null)
        .toList();
    formSections = formSections.map((formSection) {
      formSection.borderColor = Colors.transparent;
      return formSection;
    }).toList();
    Timer(const Duration(milliseconds: 200), () {
      _isFormReady = true;
      evaluateSkipLogics(
          context, formSections, widget.gapServiceMonitoringObject);
      setState(() {});
    });
  }

  void onInputValueChange(String id, dynamic value) {
    widget.gapServiceMonitoringObject[id] = value;
    setState(() {});
    evaluateSkipLogics(
        context, formSections, widget.gapServiceMonitoringObject);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(),
      child: !_isFormReady
          ? const CircularProcessLoader(
              color: Colors.blueGrey,
            )
          : Column(
              children: [
                EntryFormContainer(
                  hiddenFields: hiddenFields,
                  hiddenSections: hiddenSections,
                  elevation: 0.0,
                  formSections: formSections,
                  mandatoryFieldObject: mandatoryFieldObject,
                  dataObject: widget.gapServiceMonitoringObject,
                  isEditableMode: widget.isEditableMode,
                  onInputValueChange: onInputValueChange,
                )
              ],
            ),
    );
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
