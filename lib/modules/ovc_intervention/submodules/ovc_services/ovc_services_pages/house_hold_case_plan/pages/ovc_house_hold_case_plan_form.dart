import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_house_hold_case_plan_gaps.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_form_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/constants/ovc_case_plan_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/house_hold_case_plan/constants/ovc_house_hold_case_plan_constant.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldCasePlanForm extends StatefulWidget {
  OvcHouseHoldCasePlanForm({
    Key key,
    this.shouldEditCaseGapFollowUps = false,
    this.shouldViewCaseGapFollowUp = false,
    this.shouldAddCasePlanGap = false,
  }) : super(key: key);

  final bool shouldEditCaseGapFollowUps;
  final bool shouldViewCaseGapFollowUp;
  final bool shouldAddCasePlanGap;
  @override
  _OvcHouseHoldCasePlanFormState createState() =>
      _OvcHouseHoldCasePlanFormState();
}

class _OvcHouseHoldCasePlanFormState extends State<OvcHouseHoldCasePlanForm> {
  final String label = 'House Hold Case Plan Form';
  List<FormSection> formSections;
  Map borderColors = Map();

  bool isSaving = false;
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      formSections = [];
      for (FormSection formSection in OvcServicesCasePlan.getFormSections()) {
        borderColors[formSection.id] = formSection.borderColor;
        formSection.borderColor = Colors.transparent;
        formSections.add(formSection);
      }
      isFormReady = true;
    });
  }

  onInputValueChange(String formSectionId, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(formSectionId, value);
  }

  bool isAllDomainGoalAndGapFilled(Map dataObject) {
    bool isAllDomainFilled = true;
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String domainType in dataObject.keys.toList()) {
      Map domainDataObject = dataObject[domainType];
      if (domainDataObject['gaps'].length > 0 &&
          (domainDataObject[casePlanFirstGoal] == null ||
              '${domainDataObject[casePlanFirstGoal]}'.trim() == '')) {
        isAllDomainFilled = false;
      }
    }
    return isAllDomainFilled;
  }

  Future savingDomainsAndGaps(
    Map dataObject,
    OvcHouseHold currentOvcHouseHold,
  ) async {
    String casePlanFirstGoal = OvcCasePlanConstant.casePlanFirstGoal;
    for (String domainType in dataObject.keys.toList()) {
      Map domainDataObject = dataObject[domainType];
      if (domainDataObject['gaps'].length > 0 &&
          (domainDataObject[casePlanFirstGoal] != null ||
              '${domainDataObject[casePlanFirstGoal]}'.trim() != '')) {
        try {
          List<String> hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanDomainType
          ];
          List<FormSection> domainFormSections = formSections
              .where((FormSection formSection) => formSection.id == domainType)
              .toList();
          List<FormSection> domainGapFormSections =
              OvcHouseholdServicesCasePlanGaps.getFormSections()
                  .where(
                      (FormSection formSection) => formSection.id == domainType)
                  .toList();
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            OvcHouseHoldCasePlanConstant.program,
            OvcHouseHoldCasePlanConstant.casePlanProgramStage,
            currentOvcHouseHold.orgUnit,
            domainFormSections,
            domainDataObject,
            domainDataObject['eventDate'],
            currentOvcHouseHold.id,
            domainDataObject['eventId'],
            hiddenFields,
          );
          hiddenFields = [
            OvcCasePlanConstant.casePlanToGapLinkage,
            OvcCasePlanConstant.casePlanGapToFollowinUpLinkage
          ];
          for (Map domainGapDataObject in domainDataObject['gaps']) {
            await TrackedEntityInstanceUtil
                .savingTrackedEntityInstanceEventData(
              OvcHouseHoldCasePlanConstant.program,
              OvcHouseHoldCasePlanConstant.casePlanGapProgramStage,
              currentOvcHouseHold.orgUnit,
              domainGapFormSections,
              domainGapDataObject,
              domainGapDataObject['eventDate'],
              currentOvcHouseHold.id,
              domainGapDataObject['eventId'],
              hiddenFields,
            );
          }
        } catch (e) {}
      }
    }
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    OvcHouseHold currentOvcHouseHold,
  ) async {
    bool isAllDomainFilled = isAllDomainGoalAndGapFilled(dataObject);
    if (isAllDomainFilled) {
      setState(() {
        isSaving = true;
      });
      await savingDomainsAndGaps(dataObject, currentOvcHouseHold);
      Provider.of<ServiveEventDataState>(context, listen: false)
          .resetServiceEventDataState(currentOvcHouseHold.id);
      Timer(Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
          setState(() {
            isSaving = false;
          });
          AppUtil.showToastMessage(
              message: 'Form has been saved successfully',
              position: ToastGravity.TOP);
          Navigator.pop(context);
        }
      });
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least first goal for all domain with gaps',
          position: ToastGravity.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            child: Consumer<OvcHouseHoldCurrentSelectionState>(
              builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                OvcHouseHold currentOvcHouseHold =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHold;
                return Consumer<ServiceFormState>(
                  builder: (context, serviceFormState, child) {
                    Map dataObject = serviceFormState.formState;
                    return Container(
                      child: !isFormReady
                          ? Container(
                              child: CircularProcessLoader(
                                color: Colors.blueGrey,
                              ),
                            )
                          : Column(
                              children: [
                                OvcHouseHoldInfoTopHeader(
                                  currentOvcHouseHold: currentOvcHouseHold,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10.0,
                                    left: 13.0,
                                    right: 13.0,
                                  ),
                                  child: Column(
                                    children: formSections
                                        .map(
                                          (FormSection formSection) =>
                                              CasePlanFormContainer(
                                            shouldAddCasePlanGap:
                                                widget.shouldAddCasePlanGap,
                                            shouldEditCaseGapFollowUps: widget
                                                .shouldEditCaseGapFollowUps,
                                            shouldViewCaseGapFollowUp: widget
                                                .shouldViewCaseGapFollowUp,
                                            formSectionColor:
                                                borderColors[formSection.id],
                                            formSection: formSection,
                                            dataObject:
                                                dataObject[formSection.id],
                                            isEditableMode:
                                                serviceFormState.isEditableMode,
                                            isCasePlanForHouseHold: true,
                                            onInputValueChange: (
                                              dynamic value,
                                            ) =>
                                                onInputValueChange(
                                                    formSection.id, value),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Visibility(
                                  visible: serviceFormState.isEditableMode,
                                  child: OvcEnrollmentFormSaveButton(
                                    label: isSaving ? 'Saving ...' : 'Save',
                                    labelColor: Colors.white,
                                    buttonColor: Color(0xFF4B9F46),
                                    fontSize: 15.0,
                                    onPressButton: () => onSaveForm(
                                        context,
                                        serviceFormState.formState,
                                        currentOvcHouseHold),
                                  ),
                                )
                              ],
                            ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
