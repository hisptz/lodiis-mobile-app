import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_case_plan_gap.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_household_case_plan_gaps.dart';

class CasePlanGapView extends StatelessWidget {
  const CasePlanGapView({
    Key? key,
    required this.casePlanGapObjects,
    required this.hasEditAccess,
    required this.isEditableMode,
    required this.isHouseholdCasePlan,
    required this.domainId,
    required this.formSectionColor,
    required this.onEdiCasePlanGap,
    required this.isOnCasePlanServiceProvision,
    required this.isOnCasePlanServiceMonitoring,
  }) : super(key: key);

  final List casePlanGapObjects;
  final bool isHouseholdCasePlan;
  final bool hasEditAccess;
  final bool isEditableMode;
  final bool isOnCasePlanServiceProvision;
  final bool isOnCasePlanServiceMonitoring;
  final String domainId;
  final Color formSectionColor;

  final Function onEdiCasePlanGap;

  final double iconHeight = 15.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: Column(
        children: casePlanGapObjects.map((casePlanGapObject) {
          int gapIndex = casePlanGapObjects.indexOf(casePlanGapObject) + 1;
          Map casePlanGap = Map<String, dynamic>.from(casePlanGapObject);
          String label = "Gap $gapIndex";
          List<FormSection> formSections =
              _getCasePlanGapFormSection(casePlanGapObject);
          List<InputField> inputFields =
              FormUtil.getFormInputFields(formSections)
                  .where((InputField inputField) =>
                      casePlanGap.keys.toList().contains((inputField.id)))
                  .toList();

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: formSectionColor.withOpacity(0.2),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  ...[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            label,
                            style: const TextStyle().copyWith(
                              color: formSectionColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: hasEditAccess &&
                              isEditableMode &&
                              !(isOnCasePlanServiceMonitoring ||
                                  isOnCasePlanServiceProvision),
                          child: InkWell(
                            onTap: () => onEdiCasePlanGap(casePlanGap),
                            child: Container(
                              height: iconHeight,
                              width: iconHeight,
                              margin: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/edit-icon.svg',
                                color: formSectionColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                  ...inputFields
                      .map(
                        (inputField) => Container(
                          margin: const EdgeInsets.symmetric(),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  inputField.name,
                                  style: const TextStyle().copyWith(
                                    color: formSectionColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  _getInputValue(
                                    inputField,
                                    casePlanGap,
                                  ),
                                  style: const TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              LineSeparator(
                                color: formSectionColor.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<FormSection> _getCasePlanGapFormSection(casePlanGapObject) {
    return isHouseholdCasePlan
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
  }

  String _getInputValue(InputField inputField, Map dataObject) {
    dynamic value = '${dataObject[inputField.id]}' != 'null'
        ? '${dataObject[inputField.id]}'
        : '   ';
    if (inputField.valueType == 'BOOLEAN') {
      value = '$value' == 'true'
          ? 'Yes'
          : value == 'false'
              ? 'No'
              : value;
    } else if (inputField.valueType == 'TRUE_ONLY') {
      value = '$value' == 'true' ? 'Yes' : value;
    }
    return value.toString();
  }
}
