import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_risk_assessment.dart';
import 'package:provider/provider.dart';

import 'models/agyw_enrollment_consent.dart';
import 'models/agyw_enrollment_form_section.dart';

class DreamAgywEnrollmentViewForm extends StatefulWidget {
  const DreamAgywEnrollmentViewForm({Key key}) : super(key: key);

  @override
  _DreamAgywEnrollmentViewFormState createState() =>
      _DreamAgywEnrollmentViewFormState();
}

class _DreamAgywEnrollmentViewFormState
    extends State<DreamAgywEnrollmentViewForm> {
  List<FormSection> formSections;
  List<FormSection> enrollmentFormSections;
  List<FormSection> consentFormSections;
  List<FormSection> riskAssessmentFormSections;
  final String label = 'Agyw Enrolment Form';

  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      consentFormSections = AgywEnrollmentConcent.getFormSections();
      formSections = consentFormSections.map((FormSection consentFormSection) {
        consentFormSection.name = 'Consent';
        List<InputField> inputFields = consentFormSection.inputFields
            .where((InputField inputField) => inputField.id != 'location')
            .toList();
        consentFormSection.inputFields = inputFields;
        return consentFormSection;
      }).toList();
      enrollmentFormSections = AgywEnrollmentFormSection.getFormSections();
      riskAssessmentFormSections =  AgywEnrollmentRiskAssessment.getFormSections();
      formSections.addAll(riskAssessmentFormSections);
      formSections.addAll(enrollmentFormSections);
      isFormReady = true;
    });
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
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
                child: Container(
                  child: !isFormReady
                      ? Column(
                          children: [
                            Center(
                              child: CircularProcessLoader(
                                color: Colors.blueGrey,
                              ),
                            )
                          ],
                        )
                      : Container(
                          child: Consumer<EnrollmentFormState>(
                            builder: (context, enrollmentFormState, child) =>
                                Column(
                              children: [
                                Container(
                                  child: EntryFormContainer(
                                    formSections: formSections,
                                    mandatoryFieldObject: Map(),
                                    isEditableMode:
                                        enrollmentFormState.isEditableMode,
                                    dataObject: enrollmentFormState.formState,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
