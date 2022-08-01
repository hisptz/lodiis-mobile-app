import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan/case_plan_gap_view_container.dart';

class CasePlanFormContainer extends StatelessWidget {
  const CasePlanFormContainer({
    Key? key,
    required this.formSectionColor,
    required this.formSection,
    required this.isEditableMode,
    required this.dataObject,
    required this.onInputValueChange,
    required this.isHouseholdCasePlan,
    required this.hasEditAccess,
    required this.isOnCasePlanPage,
    required this.isOnCasePlanServiceProvision,
    required this.isOnCasePlanServiceMonitoring,
    this.currentHouseholdChild,
  }) : super(key: key);

  final Color formSectionColor;
  final FormSection formSection;
  final bool isEditableMode;
  final Map dataObject;
  final Function onInputValueChange;
  final bool isHouseholdCasePlan;
  final bool hasEditAccess;
  final bool isOnCasePlanPage;
  final bool isOnCasePlanServiceProvision;
  final bool isOnCasePlanServiceMonitoring;
  final OvcHouseholdChild? currentHouseholdChild;

  void onValueChange(String id, dynamic value) {
    dataObject[id] = value;
    onInputValueChange(dataObject);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          topLeft: Radius.circular(12.0),
        ),
        child: MaterialCard(
          body: Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(
                color: formSectionColor,
                width: 8.0,
              ),
            )),
            child: Column(
              children: [
                EntryFormContainer(
                  elevation: 0.0,
                  formSections: [formSection],
                  mandatoryFieldObject: const {},
                  dataObject: dataObject,
                  isEditableMode: isEditableMode && isOnCasePlanPage,
                  onInputValueChange: onValueChange,
                ),
                CasePlanGapViewContainer(
                  isHouseholdCasePlan: isHouseholdCasePlan,
                  isOnCasePlanServiceProvision: isOnCasePlanServiceProvision,
                  isOnCasePlanServiceMonitoring: isOnCasePlanServiceMonitoring,
                  domainId: formSection.id!,
                  hasEditAccess: hasEditAccess,
                  isEditableMode: isEditableMode && isOnCasePlanPage,
                  dataObject: dataObject,
                  formSectionColor: formSectionColor,
                  onInputValueChange: (dynamic value) =>
                      onValueChange(formSection.id!, value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
