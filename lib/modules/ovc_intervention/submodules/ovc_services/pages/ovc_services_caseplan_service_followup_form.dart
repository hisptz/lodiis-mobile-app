import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_child_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/models/ovc_services_caseplan_service_followup.dart';
import 'package:provider/provider.dart';

class OvcServicesCasePlanServiceFollowupForm extends StatefulWidget {
  const OvcServicesCasePlanServiceFollowupForm({Key key}) : super(key: key);

  @override
  _OvcServicesCasePlanServiceFollowupFormState createState() =>
      _OvcServicesCasePlanServiceFollowupFormState();
}

class _OvcServicesCasePlanServiceFollowupFormState
    extends State<OvcServicesCasePlanServiceFollowupForm> {
  final List<FormSection> formSections =
      OvcServicesCasePlanServiceFollowup.getFormSections();
  final String label = 'Case Plan service follow up';

  void onSaveAndContinue(BuildContext context) {
    // handling appropriate actions
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OvcEnrollmentChildForm(),
        ));
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  margin:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
                  child: Column(
                    children: [
                      Container(
                        child: Consumer<EnrollmentFormState>(
                          builder: (context, enrollmentFormState, child) =>
                              EntryFormContainer(
                            formSections: formSections,
                            dataObject: enrollmentFormState.formState,
                            mandatoryFieldObject: Map(),
                            onInputValueChange: onInputValueChange,
                          ),
                        ),
                      ),
                      OvcEnrollmentFormSaveButton(
                        label: 'Save and Continue',
                        labelColor: Colors.white,
                        buttonColor: Color(0xFF4B9F46),
                        fontSize: 15.0,
                        onPressButton: () => onSaveAndContinue(context),
                      )
                    ],
                  )),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
