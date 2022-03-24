import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/household_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/skip_logics/ovc_service_monitoring_skip_logic.dart';
import 'package:provider/provider.dart';

class CasePlanServiceMonitoringFormContainer extends StatefulWidget {
  const CasePlanServiceMonitoringFormContainer({
    Key? key,
    required this.dataObject,
    required this.isCasePlanForHousehold,
    required this.domainId,
    required this.isEditableMode,
  }) : super(key: key);

  final Map dataObject;
  final bool isCasePlanForHousehold;
  final String? domainId;
  final bool isEditableMode;

  @override
  _CasePlanServiceMonitoringFormContainerState createState() =>
      _CasePlanServiceMonitoringFormContainerState();
}

class _CasePlanServiceMonitoringFormContainerState
    extends State<CasePlanServiceMonitoringFormContainer>
    with OvcServiceMonitoringSkipLogic {
  bool isFormReady = false;
  bool isSaving = false;
  List<FormSection>? formSections;
  Map? mandatoryFieldObject;
  Color? formSectionColor;
  Map? dataObject;

  @override
  void initState() {
    dataObject = widget.dataObject;
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        mandatoryFieldObject = {};
        formSections = widget.isCasePlanForHousehold
            ? HouseholdServicesOngoingMonitoring.getFormSections()
            : OvcServicesOngoingMonitoring.getFormSections();
        formSections = formSections!
            .where((formSection) =>
                formSection.id == widget.domainId ||
                formSection.id == '' ||
                formSection.id == null)
            .toList();
        formSectionColor = formSections!.isNotEmpty
            ? formSections![0].borderColor
            : Colors.transparent;

        formSections = formSections!.map((formSection) {
          formSection.borderColor = Colors.transparent;
          return formSection;
        }).toList();
        isFormReady = true;
      });
      evaluateSkipLogics(context, formSections!, widget.dataObject);
      setState(() {});
    });
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

  void onInputValueChange(String id, dynamic value) {
    widget.dataObject[id] = value;
    setState(() {});
    evaluateSkipLogics(context, formSections!, widget.dataObject);
  }

  void onSaveForm(
    BuildContext context,
    Map? dataObject,
    OvcHousehold? currentOvcHousehold,
    OvcHouseholdChild? currentOvcHouseholdChild,
  ) async {
    if (widget.dataObject.keys.length > 1) {
      setState(() {
        isSaving = true;
      });
      String program = widget.isCasePlanForHousehold
          ? OvcHouseholdCasePlanConstant.program
          : OvcChildCasePlanConstant.program;
      String programStage = widget.isCasePlanForHousehold
          ? OvcHouseholdCasePlanConstant
              .casePlanGapServiceMonitoringProgramStage
          : OvcChildCasePlanConstant.casePlanGapServiceMonitoringProgramStage;
      String? orgUnit = widget.isCasePlanForHousehold
          ? currentOvcHousehold!.orgUnit
          : currentOvcHouseholdChild!.orgUnit;
      String? beneficiaryId = widget.isCasePlanForHousehold
          ? currentOvcHousehold!.id
          : currentOvcHouseholdChild!.id;
      String? eventDate = dataObject!['eventDate'];
      String? eventId = dataObject['eventId'];
      List<String> hiddenFields = [
        OvcCasePlanConstant.casePlanGapToMonitoringLinkage
      ];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          program,
          programStage,
          orgUnit,
          formSections!,
          dataObject,
          eventDate,
          beneficiaryId,
          eventId,
          hiddenFields,
        );
        Timer(const Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
          });
          Provider.of<ServiceEventDataState>(context, listen: false)
              .resetServiceEventDataState(beneficiaryId);
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
          message: 'Please fill at least one field',
          position: ToastGravity.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !isFormReady
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
                  dataObject: widget.dataObject,
                  isEditableMode: widget.isEditableMode,
                  onInputValueChange: onInputValueChange,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                  child: Visibility(
                    visible: widget.isEditableMode,
                    child: Row(
                      children: [
                        Expanded(
                          child: Consumer<OvcHouseholdCurrentSelectionState>(
                            builder: (
                              context,
                              ovcHouseholdCurrentSelectionState,
                              child,
                            ) {
                              OvcHousehold? currentOvcHousehold =
                                  ovcHouseholdCurrentSelectionState
                                      .currentOvcHousehold;
                              OvcHouseholdChild? currentOvcHouseholdChild =
                                  ovcHouseholdCurrentSelectionState
                                      .currentOvcHouseholdChild;
                              return TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: formSectionColor,
                                ),
                                onPressed: () => onSaveForm(
                                    context,
                                    dataObject,
                                    currentOvcHousehold,
                                    currentOvcHouseholdChild),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 22.0),
                                  child: Text(
                                    isSaving
                                        ? 'SAVING MONITORING ...'
                                        : 'SAVE MONITORING',
                                    style: const TextStyle().copyWith(
                                      color: const Color(0xFFFAFAFA),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
