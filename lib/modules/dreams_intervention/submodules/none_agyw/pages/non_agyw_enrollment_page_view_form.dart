import 'dart:async';

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
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/skip_logics/none_agyw_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';
import '../models/non_agyw_enrollment_client_intake.dart';
import '../models/non_agyw_enrollment_prep_screening.dart';

class DreamNonAgywEnrollmentViewForm extends StatefulWidget {
  const DreamNonAgywEnrollmentViewForm({Key key}) : super(key: key);

  @override
  _DreamNonAgywEnrollmentViewFormState createState() =>
      _DreamNonAgywEnrollmentViewFormState();
}

class _DreamNonAgywEnrollmentViewFormState
    extends State<DreamNonAgywEnrollmentViewForm> {
  List<FormSection> formSections;
  List<FormSection> enrollmentClientIntakeFormSections;
  List<FormSection> prepScreeningFormSections;
  final String label = 'Non Agyw Enrolment Form';
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      prepScreeningFormSections =
          NonAgywEnrollmentFormSection.getFormSections();
      formSections =
          prepScreeningFormSections.map((FormSection consentFormSection) {
        consentFormSection.name = 'HTS Client Intake Record';
        List<InputField> inputFields = consentFormSection.inputFields
            .where((InputField inputField) => inputField.id != 'location')
            .toList();
        consentFormSection.inputFields = inputFields;
        return consentFormSection;
      }).toList();
      enrollmentClientIntakeFormSections =
          NonAgywEnrollmentPrepScreening.getFormSections();
      formSections.addAll(enrollmentClientIntakeFormSections);
      isFormReady = true;
      evaluateSkipLogics();
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await NoneAgywEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
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
                                    hiddenFields:
                                        enrollmentFormState.hiddenFields,
                                    hiddenSections:
                                        enrollmentFormState.hiddenSections,
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
