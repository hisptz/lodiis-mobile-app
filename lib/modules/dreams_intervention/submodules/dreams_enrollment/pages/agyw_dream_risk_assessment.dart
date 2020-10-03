import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/models/agyw_enrollment_risk_assessment.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:provider/provider.dart';
import 'agyw_dream_enrollment.dart';

class AgywDreamServiceForm extends StatefulWidget {
  const AgywDreamServiceForm({Key key}) : super(key: key);
  @override
  _AgywDreamServiceFormState createState() => _AgywDreamServiceFormState();
}

class _AgywDreamServiceFormState extends State<AgywDreamServiceForm> {
  List<FormSection> formSections;
  final String label = 'Risk Assessment';
  final List<String> mandatoryFields =
      AgywEnrollmentRiskAssessment.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = AgywEnrollmentRiskAssessment.getFormSections();
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
            builder: (context) => AgywEntollmentSectionForm(),
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
                  margin:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 13.0),
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
                                        child: Consumer<EnrollmentFormState>(
                                          builder: (context,
                                                  enrollmentFormState, child) =>
                                              EntryFormContainer(
                                            formSections: formSections,
                                            mandatoryFieldObject:
                                                mandatoryFieldObject,
                                            dataObject:
                                                enrollmentFormState.formState,
                                            onInputValueChange:
                                                onInputValueChange,
                                          ),
                                        ),
                                      ),
                                      OvcEnrollmentFormSaveButton(
                                        label: 'Save and Continue',
                                        labelColor: Colors.white,
                                        buttonColor: Color(0xFF258DCC),
                                        fontSize: 15.0,
                                        onPressButton: () => onSaveAndContinue(
                                          context,
                                          enrollmentFormState.formState,
                                        ),
                                      )
                                    ],
                                  )),
                        )),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
