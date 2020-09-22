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
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollement_none_participation.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentNoneParticipationForm extends StatefulWidget {
  OvcEnrollmentNoneParticipationForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentNoneParticipationFormState createState() =>
      _OvcEnrollmentNoneParticipationFormState();
}

class _OvcEnrollmentNoneParticipationFormState
    extends State<OvcEnrollmentNoneParticipationForm> {
  final List<FormSection> formSections =
      OvcEnrollmentNoneParticipation.getFormSections();
  final String label = 'None Participation Form';

  void onSaveAndContinue(BuildContext context) {
    // save and go to list of enrollment;
    if (Navigator.canPop(context)) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
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
                        child: EntryFormContainer(
                          formSections: formSections,
                          onInputValueChange: onInputValueChange,
                        ),
                      ),
                      OvcEnrollmentFormSaveButton(
                        label: 'Save',
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
