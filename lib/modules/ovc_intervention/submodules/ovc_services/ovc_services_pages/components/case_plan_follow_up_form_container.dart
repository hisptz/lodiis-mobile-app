import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/house_hold_service_followup.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_child_service_followup.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/child_case_plan/constants/ovc_child_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_case_plan/constants/ovc_house_hold_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/skip_logics/ovc_case_plan_follow_up_skip_logic.dart';
import 'package:provider/provider.dart';

class CasePlanFollowUpFormContainer extends StatefulWidget {
  const CasePlanFollowUpFormContainer({
    Key key,
    @required this.dataObject,
    @required this.isCasePlanForHouseHold,
    @required this.domainId,
    @required this.isEditableMode,
  }) : super(key: key);

  final Map dataObject;
  final bool isCasePlanForHouseHold;
  final String domainId;
  final bool isEditableMode;

  @override
  _CasePlanFollowUpFormContainerState createState() =>
      _CasePlanFollowUpFormContainerState();
}

class _CasePlanFollowUpFormContainerState
    extends State<CasePlanFollowUpFormContainer>
    with OvcCasePlanFollowUpSkipLogic {
  bool isFormReady = false;
  bool isSaving = false;
  List<FormSection> formSections;
  Map mandatoryFieldObject;
  Color formSectionColor;
  Map dataObject;

  @override
  void initState() {
    dataObject = widget.dataObject;
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        mandatoryFieldObject = Map();
        formSections = widget.isCasePlanForHouseHold
            ? HouseholdServiceFollowup.getFormSections()
            : OvcServicesChildServiceFollowup.getFormSections();
        formSections = formSections
            .where((formSection) => formSection.id == widget.domainId)
            .toList();
        formSectionColor = formSections.length > 0
            ? formSections[0].borderColor
            : Colors.transparent;
        formSections = formSections.map((formSection) {
          formSection.borderColor = Colors.transparent;
          return formSection;
        }).toList();
        isFormReady = true;
      });
      evaluateSkipLogics(context, formSections, widget.dataObject);
      setState(() {});
    });
  }

  void onSaveGapForm(
    BuildContext context,
    Map dataObject,
    OvcHouseHold currentOvcHouseHold,
    OvcHouseHoldChild currentOvcHouseHoldChild,
  ) async {
    if (widget.dataObject.keys.length > 1) {
      setState(() {
        isSaving = true;
      });
      String program = widget.isCasePlanForHouseHold
          ? OvcHouseHoldCasePlanConstant.program
          : OvcChildCasePlanConstant.program;
      String programStage = widget.isCasePlanForHouseHold
          ? OvcHouseHoldCasePlanConstant.casePlanGapFollowUpProgramStage
          : OvcChildCasePlanConstant.casePlanGapFollowUpProgramStage;
      String orgUnit = widget.isCasePlanForHouseHold
          ? currentOvcHouseHold.orgUnit
          : currentOvcHouseHoldChild.orgUnit;
      String beneficiaryId = widget.isCasePlanForHouseHold
          ? currentOvcHouseHold.id
          : currentOvcHouseHoldChild.id;
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      List<String> hiddenFields = [
        OvcCasePlanConstant.casePlanGapToFollowinUpLinkage
      ];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          program,
          programStage,
          orgUnit,
          formSections,
          dataObject,
          eventDate,
          beneficiaryId,
          eventId,
          hiddenFields,
        );
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
          });
          Provider.of<ServiveEventDataState>(context, listen: false)
              .resetServiceEventDataState(beneficiaryId);
          String currentLanguage =
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
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
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

  void onInputValueChange(String id, dynamic value) {
    setState(() {
      widget.dataObject[id] = value;
    });
    evaluateSkipLogics(context, formSections, widget.dataObject);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !isFormReady
          ? Container(
              child: CircularProcessLoader(
                color: Colors.blueGrey,
              ),
            )
          : Container(
              child: Column(
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
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    child: Visibility(
                      visible: widget.isEditableMode,
                      child: Row(
                        children: [
                          Expanded(
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
                                return TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: formSectionColor,
                                  ),
                                  onPressed: () => onSaveGapForm(
                                      context,
                                      dataObject,
                                      currentOvcHouseHold,
                                      currentOvcHouseHoldChild),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 22.0),
                                    child: Text(
                                      isSaving
                                          ? 'SAVING FOLLOW-UP ...'
                                          : 'SAVE FOLLOW-UP',
                                      style: TextStyle().copyWith(
                                        color: Color(0xFFFAFAFA),
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
            ),
    );
  }
}
