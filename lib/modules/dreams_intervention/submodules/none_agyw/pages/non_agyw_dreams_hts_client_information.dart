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
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/non_agyw_hts_client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/non_agyw_dreams_hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/skip_logics/non_agyw_hts_skip_logic.dart';
import 'package:provider/provider.dart';

class NonAgywDreamsHTSClientInformation extends StatefulWidget {
  NonAgywDreamsHTSClientInformation({Key key, this.isComingFromPrep})
      : super(key: key);
  final bool isComingFromPrep;

  @override
  _NonAgywDreamsHTSClientInformationState createState() =>
      _NonAgywDreamsHTSClientInformationState();
}

class _NonAgywDreamsHTSClientInformationState
    extends State<NonAgywDreamsHTSClientInformation> {
  final String label = 'Client Information';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;
  bool isComingFromPrep;

  @override
  void initState() {
    super.initState();
    isComingFromPrep = widget.isComingFromPrep;
    formSections = NonAgywHTSClientInformation.getFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await NonAgywDreamsHTCSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  void onSaveForm(BuildContext context, Map dataObject) {
    dataObject.remove(NonAgywDreamsHTSConstant.bmiKey);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NonAgywDreamsHTSRegisterForm()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          body: Container(child: Consumer<EnrollmentFormState>(
            builder: (context, enrollmentFormState, child) {
              return Container(
                child: Column(
                  children: [
                    !isFormReady
                        ? Container(
                      child: CircularProcessLoader(
                        color: Colors.blueGrey,
                      ),
                    )
                        : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 10.0,
                            left: 13.0,
                            right: 13.0,
                          ),
                          child: EntryFormContainer(
                            formSections: formSections,
                            hiddenFields:
                            enrollmentFormState.hiddenFields,
                            hiddenSections:
                            enrollmentFormState.hiddenSections,
                            mandatoryFieldObject: Map(),
                            isEditableMode:
                            enrollmentFormState.isEditableMode,
                            dataObject: enrollmentFormState.formState,
                            onInputValueChange: onInputValueChange,
                          ),
                        ),
                        Visibility(
                          visible: enrollmentFormState.isEditableMode,
                          child: EntryFormSaveButton(
                            label: isSaving
                                ? 'Saving ...'
                                : 'SAVE & CONTINUE',
                            labelColor: Colors.white,
                            buttonColor: Color(0xFF258DCC),
                            fontSize: 15.0,
                            onPressButton: () => onSaveForm(
                              context,
                              enrollmentFormState.formState,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          )),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
