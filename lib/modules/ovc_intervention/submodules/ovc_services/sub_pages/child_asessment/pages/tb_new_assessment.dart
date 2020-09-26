import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_tbscreening.dart';
import 'package:provider/provider.dart';

class OvcServiceTBAssessment extends StatefulWidget {
  @override
  _OvcServiceTBAssessmentState createState() => _OvcServiceTBAssessmentState();
}

class _OvcServiceTBAssessmentState extends State<OvcServiceTBAssessment> {
  final String label = "Child TB Assessemnt";
  final List<FormSection> formSections =
      OvcServicesTbscreening.getFormSections();

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    OvcHouseHoldChild currentOvcHouseHoldChild,
  ) {
    if (dataObject.keys.length > 0) {
      AppUtil.showToastMessage(
          message: 'Ready to save the form', position: ToastGravity.TOP);
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least one form field',
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
            margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
            child: Consumer<OvcHouseHoldCurrentSelectionState>(
              builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                OvcHouseHoldChild currentOvcHouseHoldChild =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHoldChild;
                return Consumer<ServiceFormState>(
                  builder: (context, serviceFormState, child) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            child: EntryFormContainer(
                              formSections: formSections,
                              mandatoryFieldObject: Map(),
                              dataObject: serviceFormState.formState,
                              onInputValueChange: onInputValueChange,
                            ),
                          ),
                          OvcEnrollmentFormSaveButton(
                            label: 'Save',
                            labelColor: Colors.white,
                            buttonColor: Color(0xFF4B9F46),
                            fontSize: 15.0,
                            onPressButton: () => onSaveForm(
                                context,
                                serviceFormState.formState,
                                currentOvcHouseHoldChild),
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
