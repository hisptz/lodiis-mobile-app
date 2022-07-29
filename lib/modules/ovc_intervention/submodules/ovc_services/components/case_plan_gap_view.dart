import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/models/ovc_household_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_case_plan_gap.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_household_case_plan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_gap_service_provision_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/components/case_plan_gap_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/household_case_plan/constants/ovc_household_case_plan_constant.dart';
import 'package:provider/provider.dart';

class CasePlanGapView extends StatefulWidget {
  const CasePlanGapView({
    Key? key,
    required this.casePlanGap,
    required this.isCasePlanForHousehold,
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
  final bool shouldEditCaseGapServiceProvision;
  final bool shouldViewCaseGapServiceProvision;
  final bool hasEditAccess;

  @override
  _CasePlanGapViewState createState() => _CasePlanGapViewState();
}

class _CasePlanGapViewState extends State<CasePlanGapView> {
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
          ? OvcHouseholdServicesCasePlanGaps.getFormSections(
                  firstDate: widget.casePlanGap['eventDate'] ??
                      AppUtil.formattedDateTimeIntoString(
                        DateTime.now(),
                      ))
              .where((FormSection form) => form.id == widget.domainId)
              .toList()
          : OvcServicesChildCasePlanGap.getFormSections(
                  firstDate: widget.casePlanGap['eventDate'] ??
                      AppUtil.formattedDateTimeIntoString(
                        DateTime.now(),
                      ))
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

  void onEditCasePlanGap(
    BuildContext context,
    OvcHousehold? currentOvcHousehold,
    OvcHouseholdChild? currentOvcHouseholdChild,
  ) async {
    List<FormSection> formSections = widget.isCasePlanForHousehold
        ? OvcHouseholdServicesCasePlanGaps.getFormSections(
                firstDate: widget.casePlanGap['eventDate'] ??
                    AppUtil.formattedDateTimeIntoString(
                      DateTime.now(),
                    ))
            .where((FormSection form) => form.id == widget.domainId)
            .toList()
        : OvcServicesChildCasePlanGap.getFormSections(
                firstDate: widget.casePlanGap['eventDate'] ??
                    AppUtil.formattedDateTimeIntoString(
                      DateTime.now(),
                    ))
            .where((FormSection form) => form.id == widget.domainId)
            .toList();
    formSections = formSections.map((FormSection form) {
      form.borderColor = Colors.transparent;
      return form;
    }).toList();
    Widget modal = CasePlanGapFormContainer(
      formSections: formSections,
      isCasePlanForHousehold: widget.isCasePlanForHousehold,
      isEditableMode: widget.shouldEditCaseGapServiceProvision,
      formSectionColor: widget.formSectionColor,
      dataObject: widget.casePlanGap,
    );
    Map response = await AppUtil.showPopUpModal(context, modal, true);
    List<String> hiddenFields = [
      OvcCasePlanConstant.casePlanToGapLinkage,
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage
    ];
    String program = widget.isCasePlanForHousehold
        ? OvcHouseholdCasePlanConstant.program
        : OvcChildCasePlanConstant.program;
    String programStage = widget.isCasePlanForHousehold
        ? OvcHouseholdCasePlanConstant.casePlanGapProgramStage
        : OvcChildCasePlanConstant.casePlanGapProgramStage;
    String? orgUnit = widget.isCasePlanForHousehold
        ? currentOvcHousehold!.orgUnit
        : currentOvcHouseholdChild!.orgUnit;
    String? beneficiaryId = widget.isCasePlanForHousehold
        ? currentOvcHousehold!.id
        : currentOvcHouseholdChild!.id;
    Provider.of<ServiceEventDataState>(context, listen: false)
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
    String? currentLanguage =
        Provider.of<LanguageTranslationState>(context, listen: false)
            .currentLanguage;
    AppUtil.showToastMessage(
      message: currentLanguage == 'lesotho'
          ? 'Fomo e bolokeile'
          : 'Form has been saved successfully',
      position: ToastGravity.TOP,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: widget.formSectionColor!.withOpacity(0.2),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                Visibility(
                  visible: false,
                  child: Consumer<OvcHouseholdCurrentSelectionState>(
                    builder: (
                      context,
                      ovcHouseholdCurrentSelectionState,
                      child,
                    ) {
                      OvcHousehold? currentOvcHousehold =
                          ovcHouseholdCurrentSelectionState.currentOvcHousehold;
                      OvcHouseholdChild? currentOvcHouseholdChild =
                          ovcHouseholdCurrentSelectionState
                              .currentOvcHouseholdChild;
                      return InkWell(
                        onTap: () => onEditCasePlanGap(
                          context,
                          currentOvcHousehold,
                          currentOvcHouseholdChild,
                        ),
                        child: Container(
                          height: iconHeight,
                          width: iconHeight,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/edit-icon.svg',
                            color: widget.formSectionColor,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: inputFields
                        .map((InputField inputField) => Container(
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
                                        child: Text(inputField.name,
                                            style: const TextStyle().copyWith(
                                              color: widget.formSectionColor,
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
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Text(
                                            _getInputValue(
                                                inputField, widget.casePlanGap),
                                            style: const TextStyle().copyWith(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                LineSeparator(
                                    color: widget.formSectionColor!
                                        .withOpacity(0.5))
                              ],
                            )))
                        .toList()
                      ..add(Container(
                        margin: const EdgeInsets.all(0),
                        child: CasePlanGapServiceProvisionContainer(
                          hasEditAccess: widget.hasEditAccess,
                          domainId: widget.domainId,
                          formSectionColor: widget.formSectionColor,
                          isCasePlanForHousehold: widget.isCasePlanForHousehold,
                          casePlanGap: widget.casePlanGap,
                          shouldEditCaseGapServiceProvision:
                              widget.shouldEditCaseGapServiceProvision,
                          shouldViewCaseGapServiceProvision:
                              widget.shouldViewCaseGapServiceProvision,
                        ),
                      )),
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
