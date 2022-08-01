import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan/case_plan_gap_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan/case_plan_gap_view.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_case_plan_gap.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_household_case_plan_gaps.dart';

class CasePlanGapViewContainer extends StatelessWidget {
  const CasePlanGapViewContainer({
    Key? key,
    required this.dataObject,
    required this.formSectionColor,
    required this.isHouseholdCasePlan,
    required this.hasEditAccess,
    required this.domainId,
    required this.onInputValueChange,
  }) : super(key: key);

  final bool isHouseholdCasePlan;
  final bool hasEditAccess;
  final Map dataObject;
  final Color formSectionColor;
  final String domainId;
  final Function onInputValueChange;

  final String caseToGapLinkage = OvcCasePlanConstant.casePlanToGapLinkage;
  final String casePlanGapToServiceProvisionLinkage =
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage;
  final String casePlanGapToServiceMonitoringLinkage =
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage;

  void onAddOrEditCasePlanGap(
    BuildContext context, {
    Map? gapDataObject,
    bool isOnEdit = false,
  }) async {
    double ratio = 0.8;
    gapDataObject = gapDataObject ?? {};
    gapDataObject[casePlanGapToServiceProvisionLinkage] =
        gapDataObject[casePlanGapToServiceProvisionLinkage] ?? AppUtil.getUid();
    gapDataObject[casePlanGapToServiceMonitoringLinkage] =
        gapDataObject[casePlanGapToServiceMonitoringLinkage] ??
            AppUtil.getUid();
    gapDataObject[caseToGapLinkage] =
        dataObject[caseToGapLinkage] ?? AppUtil.getUid();
    List<FormSection> formSections = isHouseholdCasePlan
        ? OvcHouseholdServicesCasePlanGaps.getFormSections(
            firstDate: gapDataObject['eventDate'] ??
                AppUtil.formattedDateTimeIntoString(
                  DateTime.now(),
                ),
          ).where((FormSection form) => form.id == domainId).toList()
        : OvcServicesChildCasePlanGap.getFormSections(
            firstDate: gapDataObject['eventDate'] ??
                AppUtil.formattedDateTimeIntoString(
                  DateTime.now(),
                ),
          ).where((FormSection form) => form.id == domainId).toList();
    formSections = formSections.map((FormSection form) {
      form.borderColor = Colors.transparent;
      return form;
    }).toList();
    var response = await AppUtil.showActionSheetModal(
      context: context,
      containerBody: CasePlanGapFormContainer(
        formSections: formSections,
        //TODO dynamic view and edit this variables
        isEditableMode: true,
        formSectionColor: formSectionColor,
        dataObject: gapDataObject,
      ),
      initialHeightRatio: ratio,
      maxHeightRatio: ratio,
    );
    if (response != null) {
      var eventId = response['eventId'] ?? '';
      if (isOnEdit) {
        dataObject['gaps'] = dataObject['gaps']
            .where((Map gap) => gap['eventId'] != eventId)
            .toList();
      }
      dataObject['gaps'].add(response);
      onValueChange('gaps', dataObject['gaps']);
    }
  }

  void onValueChange(String id, dynamic value) {
    dataObject[id] = value;
    onInputValueChange(dataObject);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          CasePlanGapView(
            hasEditAccess: hasEditAccess,
            domainId: domainId,
            formSectionColor: formSectionColor,
            isHouseholdCasePlan: isHouseholdCasePlan,
            casePlanGapObjects: dataObject['gaps'],
            onEdiCasePlanGap: (dynamic gapDataObject) => onAddOrEditCasePlanGap(
              context,
              gapDataObject: gapDataObject,
              isOnEdit: true,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                onSurface: formSectionColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: formSectionColor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () => onAddOrEditCasePlanGap(context),
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
          )
        ],
      ),
    );
  }

  Widget _getCasePlanGapList({List<dynamic> casePlanGapObjects = const []}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: casePlanGapObjects.map((dynamic casePlanGapObject) {
          int gapIndex = casePlanGapObjects.indexOf(casePlanGapObject) + 1;
          String label = "Gap $gapIndex";
          List<FormSection> formSections = isHouseholdCasePlan
              ? OvcHouseholdServicesCasePlanGaps.getFormSections(
                      firstDate: casePlanGapObject['eventDate'] ??
                          AppUtil.formattedDateTimeIntoString(
                            DateTime.now(),
                          ))
                  .where((FormSection form) => form.id == domainId)
                  .toList()
              : OvcServicesChildCasePlanGap.getFormSections(
                      firstDate: casePlanGapObject['eventDate'] ??
                          AppUtil.formattedDateTimeIntoString(
                            DateTime.now(),
                          ))
                  .where((FormSection form) => form.id == domainId)
                  .toList();

          return Container(
            margin: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Text('$gapIndex => $casePlanGapObject'),
          );
        }).toList(),
      ),
    );
  }
}
