import 'dart:async';
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
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/non_agyw_hts_consent.dart';
import 'package:provider/provider.dart';
import 'non_agyw_dreams_hts_client_information.dart';

class NonAgywDreamsHTSConsentForm extends StatefulWidget {
  NonAgywDreamsHTSConsentForm({Key key, this.isComingFromPrep}) : super(key: key);

  final bool isComingFromPrep;

  @override
  _NonAgywDreamsHTSConsentFormState createState() =>
      _NonAgywDreamsHTSConsentFormState();
}

class _NonAgywDreamsHTSConsentFormState extends State<NonAgywDreamsHTSConsentForm> {
  final String label = 'HTS Consent';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;
  bool isComingFromPrep;

  @override
  void initState() {
    super.initState();
    isComingFromPrep = widget.isComingFromPrep;
    formSections = NonAgywHTSConsent.getFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
      });
    });
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  bool isConsentGiven(Map dataObject) {
    List<String> consentFields = [
      'lDBdxPHndqZ',
      'ue9kOx3UeTa',
      'lYPlsVaINE2',
      'mv3oo5ZwG6E',
      't8qcja4SqOG',
      'nL0ybbExLV5',
      'm8AsVhFfJe2'
    ];

    return !consentFields.every((field) =>
        '${dataObject[field]}' == 'false' || '${dataObject[field]}' == 'null');
  }

  void onSaveForm(BuildContext context, Map dataObject) {
    
    if (isConsentGiven(dataObject)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NonAgywDreamsHTSClientInformation()));
    } else {
      AppUtil.showToastMessage(
          message: 'Cannot proceed without consent',
          position: ToastGravity.TOP);
    }
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
                                : 'Save and Continue',
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
