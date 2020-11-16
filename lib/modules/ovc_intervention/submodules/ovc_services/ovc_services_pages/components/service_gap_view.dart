import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_caseplan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_house_hold_case_plan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_gap_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/service_gap_followup_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_case_plan/constants/ovc_house_hold_case_plan_constant.dart';
import 'package:provider/provider.dart';
import 'service_gap_followup_container.dart';

class ServiceGapView extends StatefulWidget {
  const ServiceGapView({
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
  _ServiceGapViewState createState() => _ServiceGapViewState();
}

class _ServiceGapViewState extends State<ServiceGapView> {
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

  void onEditCasePlanGap(
    BuildContext context,
    OvcHouseHold currentOvcHouseHold,
    OvcHouseHoldChild currentOvcHouseHoldChild,
  ) async {
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
    if (response != null) {
      List<String> hiddenFields = [
        OvcCasePlanConstant.casePlanToGapLinkage,
        OvcCasePlanConstant.casePlanGapToFollowinUpLinkage
      ];
      String program = widget.isCasePlanForHouseHold
          ? OvcHouseHoldCasePlanConstant.program
          : OvcChildCasePlanConstant.program;
      String programStage = widget.isCasePlanForHouseHold
          ? OvcHouseHoldCasePlanConstant.casePlanGapProgramStage
          : OvcChildCasePlanConstant.casePlanGapProgramStage;
      String orgUnit = widget.isCasePlanForHouseHold
          ? currentOvcHouseHold.orgUnit
          : currentOvcHouseHoldChild.orgUnit;
      String beneficiaryId = widget.isCasePlanForHouseHold
          ? currentOvcHouseHold.id
          : currentOvcHouseHoldChild.id;
      Provider.of<ServiveEventDataState>(context, listen: false)
          .resetServiceEventDataState(beneficiaryId);
      await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
        program,
        programStage,
        orgUnit,
        formSections,
        response,
        response['eventDate'],
        beneficiaryId,
        response['eventId'],
        hiddenFields,
      );
      AppUtil.showToastMessage(
        message: 'Form has been saved successfully',
        position: ToastGravity.TOP,
      );
    }
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
                      visible: false, //widget.shouldEditCaseGapFollowUps,
                      child: Consumer<OvcHouseHoldCurrentSelectionState>(
                        builder: (
                          context,
                          ovcHouseHoldCurrentSelectionState,
                          child,
                        ) {
                          OvcHouseHold currentOvcHouseHold =
                              ovcHouseHoldCurrentSelectionState
                                  .currentOvcHouseHold;
                          OvcHouseHoldChild currentOvcHouseHoldChild =
                              ovcHouseHoldCurrentSelectionState
                                  .currentOvcHouseHoldChild;
                          return Container(
                            child: InkWell(
                              onTap: () => onEditCasePlanGap(
                                context,
                                currentOvcHouseHold,
                                currentOvcHouseHoldChild,
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
                          );
                        },
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
                                child: ServiceGapFollowUpContainer(
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
