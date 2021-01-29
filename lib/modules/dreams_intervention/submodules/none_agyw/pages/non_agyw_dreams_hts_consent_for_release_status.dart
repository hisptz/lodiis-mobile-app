import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/hts_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/hts_register.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/constant/non_agyw_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/non_agyw_hts_consent_for_release_of_status.dart';
import 'package:provider/provider.dart';

import 'none_agyw_enrollment_client_intake_form.dart';

class NonAgywDreamsHTSConsentForReleaseStatus extends StatefulWidget {
  NonAgywDreamsHTSConsentForReleaseStatus({Key key}) : super(key: key);

  @override
  _NonAgywDreamsHTSConsentForReleaseStatusState createState() =>
      _NonAgywDreamsHTSConsentForReleaseStatusState();
}

class _NonAgywDreamsHTSConsentForReleaseStatusState
    extends State<NonAgywDreamsHTSConsentForReleaseStatus> {
  final String label = 'Consent for Release of Status';
  List<FormSection> formSections;
  List<FormSection> allFormSections = [];
  bool isFormReady = false;
  bool isSaving = false;
  final String trackedEntityInstance = AppUtil.getUid();

  @override
  void initState() {
    super.initState();
    formSections = NonAgywHTSConsentForReleaseOfStatus.getFormSections();
    allFormSections.addAll(formSections);
    allFormSections.addAll(HTSRegister.getFormSections());
    allFormSections.addAll(ClientInformation.getFormSections());
    allFormSections.addAll(HTSConsent.getFormSections());
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

  void onSaveForm(BuildContext context, Map dataObject) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      try {
        if (dataObject[NonAgywDreamsHTSConstant.hivResultStatus] ==
            'Negative') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoneAgywEnrollmentClientInTakeForm()));
        } else {
          setState(() {
            isSaving = true;
          });
          CurrentUser user = await UserService().getCurrentUser();
          dataObject['PN92g65TkVI'] = dataObject['PN92g65TkVI'] ?? 'Active';
          dataObject['klLkGxy328c'] =
              dataObject['klLkGxy328c'] ?? user.implementingPartner;
          List<String> hiddenFields = [
            BeneficiaryIdentification.beneficiaryId,
            BeneficiaryIdentification.beneficiaryIndex,
            'PN92g65TkVI',
            'klLkGxy328c',
          ];
          String orgUnit = dataObject['location'];
          await NoneAgywDreamEnrollmentService().savingNonAgwyBeneficiary(
            dataObject,
            trackedEntityInstance,
            orgUnit,
            null,
            null,
            null,
            hiddenFields,
          );
          Provider.of<DreamsInterventionListState>(context, listen: false)
              .onNonAgywBeneficiaryAdd();
          Timer(
            Duration(seconds: 1),
            () {
              if (Navigator.canPop(context)) {
                setState(() {
                  isSaving = false;
                });
                String currentLanguage = Provider.of<LanguageTranslationState>(
                        context,
                        listen: false)
                    .currentLanguage;
                AppUtil.showToastMessage(
                  message: currentLanguage == 'lesotho'
                      ? 'Fomo e bolokeile'
                      : 'Form has been saved successfully',
                  position: ToastGravity.TOP,
                );
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
          );
        }
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least one form field',
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
                                      context, enrollmentFormState.formState),
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
