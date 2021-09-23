import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollment_consent_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_consent.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollement_basic_info_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollement_none_participation_form.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentConsentForm extends StatefulWidget {
  const OvcEnrollmentConsentForm({Key? key}) : super(key: key);

  @override
  _OvcEnrollmentConsentFormState createState() =>
      _OvcEnrollmentConsentFormState();
}

class _OvcEnrollmentConsentFormState extends State<OvcEnrollmentConsentForm> {
  List<FormSection>? formSections;
  final String label = 'Consent Form';
  final List<String> consentFields = OvcEnrollmentConstant.getConsentFields();
  final List<String> mandatoryFields = OvcEnrollmentConsent.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool isFormReady = false;
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    setState(
      () {
        for (String id in mandatoryFields) {
          mandatoryFieldObject[id] = true;
        }
        formSections = OvcEnrollmentConsent.getFormSections();
        isFormReady = true;
      },
    );
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      bool hasConsent = dataObject['sCGr0RTmvJ7'];
      onUpdateFormAutoSaveState(
        context,
        isSaveForm: true,
        nextPageModule:
            hasConsent ? "" : OvcRoutesConstant.ovcNoneParticipationFormPage,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => hasConsent
              ? OvcEnrollmentBasicInfoForm()
              : OvcEnrollmentNoneParticipationForm(),
        ),
      );
    } else {
      unFilledMandatoryFields =
          AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
      setState(() {});
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    String beneficiaryId = "";
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String id = "${OvcRoutesConstant.ovcConcentFormPage}_$beneficiaryId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: OvcRoutesConstant.ovcConcentFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : OvcRoutesConstant.ovcConcentFormNextPage
          : OvcRoutesConstant.ovcConcentFormNextPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    onUpdateFormAutoSaveState(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<InterventionCardState>(
            builder: (context, interventionCardState, child) {
              InterventionCard activeInterventionProgram =
                  interventionCardState.currentInterventionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            margin: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 13.0,
            ),
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
                    child: Consumer<LanguageTranslationState>(
                      builder: (context, languageTranslationState, child) {
                        String? currentLanguage =
                            languageTranslationState.currentLanguage;
                        return Consumer<EnrollmentFormState>(
                          builder: (context, enrollmentFormState, child) =>
                              Column(
                            children: [
                              Container(
                                child: EntryFormContainer(
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  dataObject: enrollmentFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                  unFilledMandatoryFields:
                                      unFilledMandatoryFields,
                                ),
                              ),
                              EntryFormSaveButton(
                                label: currentLanguage == 'lesotho'
                                    ? 'Boloka ebe u fetela pele'
                                    : 'Save and Continue',
                                labelColor: Colors.white,
                                buttonColor: Color(0xFF4B9F46),
                                fontSize: 15.0,
                                onPressButton: () => onSaveAndContinue(
                                  context,
                                  enrollmentFormState.formState,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
