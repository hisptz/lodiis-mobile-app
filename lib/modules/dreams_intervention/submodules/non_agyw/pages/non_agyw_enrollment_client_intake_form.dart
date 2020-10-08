import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/non_agyw/models/non_agyw_enrollment_client_intake.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';
import 'non_agyw_enrollment_prep_screening_form.dart';

class NonAgywEnrollmentFormSectionForm extends StatefulWidget {
  const NonAgywEnrollmentFormSectionForm({Key key}) : super(key: key);

  @override
  _NonAgywEnrollmentFormSectionFormState createState() =>
      _NonAgywEnrollmentFormSectionFormState();
}

class _NonAgywEnrollmentFormSectionFormState
    extends State<NonAgywEnrollmentFormSectionForm> {
  final List<String> mandatoryFields =
      NonAgywEnrollmentFormSection.getMandatoryField();
  List<FormSection> formSections;
  final Map mandatoryFieldObject = Map();
  final String label = 'HTS Client Intake';
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = NonAgywEnrollmentFormSection.getFormSections();
      isFormReady = true;
    });
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NonAgywEnrollmentPrepScreeningForm(),
          ));
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
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
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
                child: Consumer<EnrollmentFormState>(
                  builder: (context, enrollmentFormState, child) => Column(
                    children: [
                      Container(
                        child: EntryFormContainer(
                          formSections: formSections,
                          dataObject: enrollmentFormState.formState,
                          mandatoryFieldObject: mandatoryFieldObject,
                          onInputValueChange: onInputValueChange,
                        ),
                      ),
                      OvcEnrollmentFormSaveButton(
                        label: 'Save and Continue',
                        labelColor: Colors.white,
                        buttonColor: Color(0xFF258DCC),
                        fontSize: 15.0,
                        onPressButton: () => onSaveAndContinue(
                            context, enrollmentFormState.formState),
                      )
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
