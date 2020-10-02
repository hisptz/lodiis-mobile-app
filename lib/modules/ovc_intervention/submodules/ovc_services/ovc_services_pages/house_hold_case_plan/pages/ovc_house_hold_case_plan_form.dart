import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_pages/components/case_plan_form_container.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldCasePlanForm extends StatefulWidget {
  OvcHouseHoldCasePlanForm({Key key}) : super(key: key);

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

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    OvcHouseHold currentOvcHouseHold,
  ) {
    print(dataObject);
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
