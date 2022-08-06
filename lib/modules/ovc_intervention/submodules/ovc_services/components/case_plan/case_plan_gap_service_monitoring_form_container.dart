import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/household_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_ongoing_monitoring.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/skip_logics/ovc_service_monitoring_skip_logic.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/utils/ovc_case_plan_service_monitoring_household_to_ovc_util.dart';
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
  bool _isSaving = false;
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

  void onSaveCasePlanMonitoring() async {
    bool hasAtLeasrOnFieldFilled = FormUtil.isAtleastOnFormField(
      hiddenFields: hiddenFields,
      formSections: formSections,
      dataObject: widget.gapServiceMonitoringObject,
    );
    if (hasAtLeasrOnFieldFilled) {
      _isSaving = true;
      setState(() {});
      try {
        List<String> hiddenFields = [
          OvcCasePlanConstant.casePlanGapToMonitoringLinkage
        ];
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
                  .casePlanGapServiceMonitoringProgramStage
              : OvcChildCasePlanConstant
                  .casePlanGapServiceMonitoringProgramStage,
          beneficiary.orgUnit,
          formSections,
          widget.gapServiceMonitoringObject,
          widget.gapServiceMonitoringObject['eventDate'],
          beneficiary.trackedEntityInstance,
          widget.gapServiceMonitoringObject['eventId'],
          hiddenFields,
        );
        if (widget.isHouseholdCasePlan) {
          await OvcCasePlanServiceMonitoringHouseholdToOvcUtil
              .autoSyncOvcsCasePlanServiceMonitoring(
            childrens: Provider.of<OvcHouseholdCurrentSelectionState>(context,
                        listen: false)
                    .currentOvcHousehold!
                    .children ??
                [],
            dataObject: widget.gapServiceMonitoringObject,
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
                ),
                Visibility(
                  visible: widget.isEditableMode,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: widget.formSectionColor,
                      ),
                      onPressed: onSaveCasePlanMonitoring,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 22.0,
                        ),
                        child: Text(
                          _isSaving
                              ? 'SAVING MONITORING ...'
                              : 'SAVE MONITORING',
                          style: const TextStyle().copyWith(
                            color: const Color(0xFFFAFAFA),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
