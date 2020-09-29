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
import 'package:kb_mobile_app/models/input_field.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_consent.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_house_hold.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentHouseHoldViewForm extends StatefulWidget {
  const OvcEnrollmentHouseHoldViewForm({Key key}) : super(key: key);

  @override
  _OvcEnrollmentHouseHoldViewFormState createState() =>
      _OvcEnrollmentHouseHoldViewFormState();
}

class _OvcEnrollmentHouseHoldViewFormState
    extends State<OvcEnrollmentHouseHoldViewForm> {
  List<FormSection> formSections;
  List<FormSection> enrollmentFormSections;
  List<FormSection> consentFormSections;
  final String label = 'House Hold form';

  bool isFormReady = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      consentFormSections = OvcEnrollmentConsent.getFormSections();
      formSections = consentFormSections.map((FormSection consentFormSection) {
        consentFormSection.name = 'Consent Form';
        List<InputField> inputFields = consentFormSection.inputFields
            .where((InputField inputField) => inputField.id != 'location')
            .toList();
        consentFormSection.inputFields = inputFields;
        return consentFormSection;
      }).toList();
      enrollmentFormSections = OvcEnrollmentHouseHold.getFormSections();
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
