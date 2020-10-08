import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/non_agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';

import 'models/non_agyw_enrollment_client_intake.dart';
import 'models/non_agyw_enrollment_prep_screening.dart';

class DreamNonAgywEnrollmentEditForm extends StatefulWidget {
  const DreamNonAgywEnrollmentEditForm({Key key}) : super(key: key);

  @override
  _DreamNonAgywEnrollmentEditFormState createState() =>
      _DreamNonAgywEnrollmentEditFormState();
}

class _DreamNonAgywEnrollmentEditFormState
    extends State<DreamNonAgywEnrollmentEditForm> {
  List<FormSection> formSections;
  List<FormSection> clientIntakeFormSections;
  List<FormSection> prepScreeningFormSections;

  final String label = 'NonAgyw Enrolment Form';
  final Map mandatoryFieldObject = Map();
  final List<String> mandatoryFields =
      NonAgywEnrollmentFormSection.getMandatoryField() +
          NonAgywEnrollmentPrepScreening.getMandatoryField();
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      clientIntakeFormSections = NonAgywEnrollmentFormSection.getFormSections();
      prepScreeningFormSections =
          NonAgywEnrollmentPrepScreening.getFormSections();

      List<String> skippedInputs = ['location', 'WTZ7GLTrE8Q', 'rSP9c21JsfC'];
      formSections = [
        clientIntakeFormSections[0],
        prepScreeningFormSections[0],
      ];

      formSections = FormUtil.getFormSectionWithReadOnlyStatus(
        formSections,
        false,
        skippedInputs,
      );
      isFormReady = true;
    });
  }

  void autoFillInputFields(String id, dynamic value) {
    if (id == 'qZP982qpSPS') {
      int age = AppUtil.getAgeInYear(value);
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('ls9hlz2tyol', age.toString());
    }
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    autoFillInputFields(id, value);
  }

  void onSaveForm(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      String trackedEntityInstance = dataObject['trackedEntityInstance'];
      String orgUnit = dataObject['orgUnit'];
      String enrollment = dataObject['enrollment'];
      String enrollmentDate = dataObject['enrollmentDate'];
      String incidentDate = dataObject['incidentDate'];
      List<String> hiddenFields = ['d8uBlGOpFhJ'];
      await NonAgywDreamEnrollmentService().savingNonAgwyBeneficiary(
        dataObject,
        trackedEntityInstance,
        orgUnit,
        enrollment,
        enrollmentDate,
        incidentDate,
        hiddenFields,
      );
      Provider.of<DreamsInterventionListState>(context, listen: false)
          .refreshDreamsList();
      Timer(Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
          setState(() {
            isSaving = false;
          });
          AppUtil.showToastMessage(
              message: 'Form has been saved successfully',
              position: ToastGravity.TOP);
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      });
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
    }
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
                                    mandatoryFieldObject: mandatoryFieldObject,
                                    isEditableMode:
                                        enrollmentFormState.isEditableMode,
                                    dataObject: enrollmentFormState.formState,
                                    onInputValueChange: onInputValueChange,
                                  ),
                                ),
                                OvcEnrollmentFormSaveButton(
                                  label: isSaving
                                      ? 'Saving House Hold ...'
                                      : 'Save House Hold',
                                  labelColor: Colors.white,
                                  buttonColor: Color(0xFF258DCC),
                                  fontSize: 15.0,
                                  onPressButton: () => isSaving
                                      ? null
                                      : onSaveForm(context,
                                          enrollmentFormState.formState),
                                )
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
