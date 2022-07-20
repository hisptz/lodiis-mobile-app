import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_case_plan_gap.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_household_case_plan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_service_provision_container.dart';
import 'case_plan_service_provision_container.dart';

class ServiceGapView extends StatefulWidget {
  const ServiceGapView({
    Key? key,
    required this.casePlanGap,
    required this.isCasePlanForHousehold,
    required this.isServiceMonitoring,
    required this.domainId,
    required this.gapIndex,
    required this.shouldEditCaseGapServiceProvision,
    required this.shouldViewCaseGapServiceProvision,
    required this.formSectionColor,
    required this.hasEditAccess,
  }) : super(key: key);
  final Map casePlanGap;
  final Color? formSectionColor;
  final String? domainId;
  final int gapIndex;
  final bool isCasePlanForHousehold;
  final bool isServiceMonitoring;
  final bool shouldEditCaseGapServiceProvision;
  final bool shouldViewCaseGapServiceProvision;
  final bool hasEditAccess;

  @override
  _ServiceGapViewState createState() => _ServiceGapViewState();
}

class _ServiceGapViewState extends State<ServiceGapView> {
  List<InputField> inputFields = [];
  List<FormSection>? gapViewformSections;
  String label = 'Gap ';
  double iconHeight = 15.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      int gapIndex = widget.gapIndex + 1;
      label = '$label $gapIndex';
      List<FormSection> formSections = widget.isCasePlanForHousehold
          ? OvcHouseholdServicesCasePlanGaps.getFormSections(firstDate: '')
              .where((FormSection form) => form.id == widget.domainId)
              .toList()
          : OvcServicesChildCasePlanGap.getFormSections(firstDate: '')
              .where((FormSection form) => form.id == widget.domainId)
              .toList();
      List keys = widget.casePlanGap.keys.toList();
      inputFields = FormUtil.getFormInputFields(formSections)
          .where((InputField inputField) => keys.contains((inputField.id)))
          .toList();
    });
  }

  _getInputValue(InputField inputField, Map dataObject) {
    dynamic value = '${dataObject[inputField.id]}' != 'null'
        ? '${dataObject[inputField.id]}'
        : '   ';
    if (inputField.valueType == 'BOOLEAN') {
      value = value == 'true'
          ? 'Yes'
          : value == 'false'
              ? 'No'
              : value;
    } else if (inputField.valueType == 'TRUE_ONLY') {
      value = value == 'true' ? 'Yes' : value;
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        color: widget.formSectionColor!.withOpacity(0.2),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle().copyWith(
                      color: widget.formSectionColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: inputFields
                        .map(
                          (InputField inputField) => Container(
                            margin: const EdgeInsets.all(0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: Text(
                                          inputField.name,
                                          style: const TextStyle().copyWith(
                                            color: widget.formSectionColor,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 5.0,
                                        ),
                                        child: Text(
                                          _getInputValue(
                                              inputField, widget.casePlanGap),
                                          style: const TextStyle().copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                LineSeparator(
                                  color:
                                      widget.formSectionColor!.withOpacity(0.5),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList()
                      ..add(
                        Container(
                          margin: const EdgeInsets.all(0),
                          child: CasePlanServiceProvisionContainer(
                            domainId: widget.domainId,
                            hasEditAccess: widget.hasEditAccess,
                            formSectionColor: widget.formSectionColor,
                            isCasePlanForHousehold:
                                widget.isCasePlanForHousehold,
                            isServiceMonitoring: widget.isServiceMonitoring,
                            casePlanGap: widget.casePlanGap,
                            shouldEditCaseGapServiceProvision:
                                widget.shouldEditCaseGapServiceProvision,
                            shouldViewCaseGapServiceProvision:
                                widget.shouldViewCaseGapServiceProvision,
                          ),
                        ),
                      ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
