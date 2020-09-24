import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollement_none_participation_constant.dart';
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
  final List<OvcEnrollmentNoneParticipationConstant> noneParticipationContants =
      OvcEnrollmentNoneParticipationConstant.getNoneParticipationConstant();
  final List<String> mandatoryFields =
      OvcEnrollmentNoneParticipation.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  final String program = OvcEnrollmentNoneParticipationConstant.program;
  final String programStage =
      OvcEnrollmentNoneParticipationConstant.programStage;
  final String eventId = AppUtil.getUid();

  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
    });
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      // gettting input fields
      List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
      for (OvcEnrollmentNoneParticipationConstant noneParticipationContant
          in noneParticipationContants) {
        String dataElement = noneParticipationContant.dataElement;
        String attribute = noneParticipationContant.attribute;
        inputFieldIds.add(dataElement);
        if (dataObject.keys.toList().indexOf(attribute) != -1) {
          dataObject[dataElement] = dataObject[attribute];
        }
      }
      Events eventData = FormUtil.getEventPayload(
          eventId,
          program,
          programStage,
          dataObject['location'],
          inputFieldIds,
          dataObject,
          null,
          null);
      await FormUtil.savingEvent(eventData);
      if (Navigator.canPop(context)) {
        setState(() {
          isSaving = false;
        });
        AppUtil.showToastMessage(
            message: 'Form has been saved successfully',
            position: ToastGravity.TOP);
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
    }
  }

  void autoFillInputFields(String id, dynamic value) {
    if (id == 'jVSwC6Ln95H') {
      int age = AppUtil.getAgeInYear(value);
      Provider.of<EnrollmentFormState>(context, listen: false)
          .setFormFieldState('mZs1YsN56cR', age.toString());
    }
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    autoFillInputFields(id, value);
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
                  child: Consumer<EnrollmentFormState>(
                      builder: (context, enrollmentFormState, child) => Column(
                            children: [
                              Container(
                                child: EntryFormContainer(
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  dataObject: enrollmentFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                ),
                              ),
                              OvcEnrollmentFormSaveButton(
                                label: isSaving ? 'Saving...' : 'save',
                                labelColor: Colors.white,
                                buttonColor: Color(0xFF4B9F46),
                                fontSize: 15.0,
                                onPressButton: () => isSaving
                                    ? null
                                    : onSaveAndContinue(
                                        context, enrollmentFormState.formState),
                              )
                            ],
                          ))),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
