import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_caseplan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_house_hold_case_plan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_follow_up_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_gap_form_container.dart';

class CasePlanGapView extends StatefulWidget {
  const CasePlanGapView({
    Key key,
    @required this.casePlanGap,
    @required this.isCasePlanForHouseHold,
    @required this.domainId,
    @required this.gapIndex,
    @required this.shouldEditCaseGapFollowUps,
    @required this.shouldViewCaseGapFollowUp,
    @required this.formSectionColor,
  }) : super(key: key);
  final Map casePlanGap;
  final Color formSectionColor;
  final String domainId;
  final int gapIndex;
  final bool isCasePlanForHouseHold;
  final bool shouldEditCaseGapFollowUps;
  final bool shouldViewCaseGapFollowUp;

  @override
  _CasePlanGapViewState createState() => _CasePlanGapViewState();
}

class _CasePlanGapViewState extends State<CasePlanGapView> {
  List<InputField> inputFields = [];
  List<FormSection> gapViewformSections;
  String label = 'Gap ';
  double iconHeight = 15.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      int gapIndex = widget.gapIndex + 1;
      label = '$label $gapIndex';
      List<FormSection> formSections = widget.isCasePlanForHouseHold
          ? OvcHouseholdServicesCasePlanGaps.getFormSections()
              .where((FormSection form) => form.id == widget.domainId)
              .toList()
          : OvcServicesChildCasePlanGaps.getFormSections()
              .where((FormSection form) => form.id == widget.domainId)
              .toList();
      List keys = widget.casePlanGap.keys.toList();
      inputFields = FormUtil.getFormInputFields(formSections)
          .where((InputField inputField) => keys.indexOf((inputField.id)) > -1)
          .toList();
    });
  }

  _getInputValue(InputField inputField, Map dataObject) {
    dynamic value =
        inputField != null && '${dataObject[inputField.id]}' != 'null'
            ? '${dataObject[inputField.id]}'
            : '   ';
    if (inputField != null) {
      if (inputField.valueType == 'BOOLEAN') {
        value = value == 'true'
            ? 'Yes'
            : value == 'false'
                ? 'No'
                : value;
      } else if (inputField.valueType == 'TRUE_ONLY') {
        value = value == 'true' ? 'Yes' : value;
      }
    }
    return value.toString();
  }

  void onEditCasePlanGap(BuildContext context) async {
    List<FormSection> formSections = widget.isCasePlanForHouseHold
        ? OvcHouseholdServicesCasePlanGaps.getFormSections()
            .where((FormSection form) => form.id == widget.domainId)
            .toList()
        : OvcServicesChildCasePlanGaps.getFormSections()
            .where((FormSection form) => form.id == widget.domainId)
            .toList();
    formSections = formSections.map((FormSection form) {
      form.borderColor = Colors.transparent;
      return form;
    }).toList();
    Widget modal = CasePlanGapFormContainer(
      formSections: formSections,
      isCasePlanForHouseHold: widget.isCasePlanForHouseHold,
      isEditableMode: widget.shouldEditCaseGapFollowUps,
      formSectionColor: widget.formSectionColor,
      dataObject: widget.casePlanGap,
    );
    Map response = await AppUtil.showPopUpModal(context, modal, true);
    if (response != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: widget.formSectionColor.withOpacity(0.2),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        label,
                        style: TextStyle().copyWith(
                          color: widget.formSectionColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Visibility(
                      visible: widget.shouldEditCaseGapFollowUps,
                      child: Container(
                        child: InkWell(
                          onTap: () => onEditCasePlanGap(
                            context,
                          ),
                          child: Container(
                            height: iconHeight,
                            width: iconHeight,
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: SvgPicture.asset(
                              'assets/icons/edit-icon.svg',
                              color: widget.formSectionColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: inputFields
                            .map((InputField inputField) => Container(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 5.0,
                                            ),
                                            child: Text(inputField.name,
                                                style: TextStyle().copyWith(
                                                  color:
                                                      widget.formSectionColor,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 5.0),
                                            child: Text(
                                                _getInputValue(inputField,
                                                    widget.casePlanGap),
                                                style: TextStyle().copyWith(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    LineSeperator(
                                        color: widget.formSectionColor
                                            .withOpacity(0.5))
                                  ],
                                )))
                            .toList()
                              ..add(Container(
                                child: CasePlanGapFollowUpContainer(
                                  domainId: widget.domainId,
                                  formSectionColor: widget.formSectionColor,
                                  isCasePlanForHouseHold:
                                      widget.isCasePlanForHouseHold,
                                  casePlanGap: widget.casePlanGap,
                                  shouldEditCaseGapFollowUps:
                                      widget.shouldEditCaseGapFollowUps,
                                  shouldViewCaseGapFollowUp:
                                      widget.shouldViewCaseGapFollowUp,
                                ),
                              )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
