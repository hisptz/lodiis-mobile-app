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

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
    });
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      // do actual saving of non particiapation form
      // if (Navigator.canPop(context)) {
      //   Navigator.popUntil(context, (route) => route.isFirst);
      // }
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
                                label: 'Save',
                                labelColor: Colors.white,
                                buttonColor: Color(0xFF4B9F46),
                                fontSize: 15.0,
                                onPressButton: () => onSaveAndContinue(
                                    context, enrollmentFormState.formState),
                              )
                            ],
                          ))),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer()));
  }
}
