import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_case_plan_gap.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_household_case_plan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_gap_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_service_provision_view_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class ServiceFormContainer extends StatelessWidget {
  const ServiceFormContainer({
    Key? key,
    required this.formSectionColor,
    required this.formSection,
    required this.isEditableMode,
    required this.dataObject,
    this.isCasePlanForHousehold = false,
    required this.isServiceMonitoring,
    this.onInputValueChange,
    required this.shouldEditCaseGapServiceProvision,
    required this.shouldViewCaseGapServiceProvision,
    required this.hasEditAccess,
  }) : super(key: key);

  final Color formSectionColor;
  final FormSection formSection;
  final bool isEditableMode;
  final Map dataObject;
  final Function? onInputValueChange;
  final bool isCasePlanForHousehold;
  final bool hasEditAccess;
  final bool isServiceMonitoring;
  final bool shouldEditCaseGapServiceProvision;
  final bool shouldViewCaseGapServiceProvision;

  final String caseToGapLinkage = OvcCasePlanConstant.casePlanToGapLinkage;
  final String casePlanGapToServiceProvisionLinkage =
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage;
  final String casePlanGapToServiceMonitoringLinkage =
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage;

  void onAddNewGap(BuildContext context) async {
    Map gapDataObject = {};
    gapDataObject[casePlanGapToServiceProvisionLinkage] =
        gapDataObject[casePlanGapToServiceProvisionLinkage] ?? AppUtil.getUid();
    gapDataObject[caseToGapLinkage] =
        dataObject[caseToGapLinkage] ?? AppUtil.getUid();
    gapDataObject[casePlanGapToServiceMonitoringLinkage] =
        gapDataObject[casePlanGapToServiceMonitoringLinkage] ??
            AppUtil.getUid();
    List<FormSection> formSections = isCasePlanForHousehold
        ? OvcHouseholdServicesCasePlanGaps.getFormSections(
                firstDate: dataObject['eventDate'])
            .where((FormSection form) => form.id == formSection.id)
            .toList()
        : OvcServicesChildCasePlanGap.getFormSections(
                firstDate: dataObject['eventDate'])
            .where((FormSection form) => form.id == formSection.id)
            .toList();
    formSections = formSections.map((FormSection form) {
      form.borderColor = Colors.transparent;
      return form;
    }).toList();
    Widget modal = CasePlanGapFormContainer(
      formSections: formSections,
      isCasePlanForHousehold: isCasePlanForHousehold,
      isEditableMode: isEditableMode,
      formSectionColor: formSectionColor,
      dataObject: gapDataObject,
    );
    Map response = await AppUtil.showPopUpModal(context, modal, true);
    dataObject['gaps'].add(response);
    onValueChange('gaps', dataObject['gaps']);
  }

  void onValueChange(String id, dynamic value) {
    dataObject[id] = value;
    onInputValueChange!(dataObject);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
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
                  isEditableMode: isEditableMode,
                  onInputValueChange: onValueChange,
                ),
                CasePlanServiceProvisionViewContainer(
                  casePlanGaps: dataObject['gaps'] ?? [],
                  hasEditAccess: hasEditAccess,
                  domainId: formSection.id,
                  isCasePlanForHousehold: isCasePlanForHousehold,
                  isServiceMonitoring: isServiceMonitoring,
                  formSectionColor: formSectionColor,
                  shouldEditCaseGapServiceProvision:
                      shouldEditCaseGapServiceProvision,
                  shouldViewCaseGapServiceProvision:
                      shouldViewCaseGapServiceProvision,
                ),
                Visibility(
                  visible:
                      (isEditableMode || shouldEditCaseGapServiceProvision) &&
                          !shouldViewCaseGapServiceProvision,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        onSurface: formSectionColor.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: formSectionColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () => onAddNewGap(context),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 40.0,
                        ),
                        child: Text(
                          'Add Gap',
                          style: const TextStyle().copyWith(
                            color: formSectionColor,
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
          ),
        ),
      ),
    );
  }
}
