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
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dream_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/none_agyw_enrollment_prep_screening.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/skip_logics/none_agyw_enrollment_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class NoneAgywEnrollmentPrepScreeningForm extends StatefulWidget {
  const NoneAgywEnrollmentPrepScreeningForm({Key key}) : super(key: key);

  @override
  _NoneAgywEnrollmentPrepScreeningFormState createState() =>
      _NoneAgywEnrollmentPrepScreeningFormState();
}

class _NoneAgywEnrollmentPrepScreeningFormState
    extends State<NoneAgywEnrollmentPrepScreeningForm> {
  final List<String> mandatoryFields =
      NoneAgywEnrollmentPrepScreening.getMandatoryField();
  List<FormSection> formSections;
  final String label = 'PrEP Screening';

  final Map mandatoryFieldObject = Map();
  final String trackedEntityInstance = AppUtil.getUid();
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = NoneAgywEnrollmentPrepScreening.getFormSections();
      isFormReady = true;
      evaluateSkipLogics();
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await NoneAgywEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
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
        'klLkGxy328c'
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
            String currentLanguage =
                Provider.of<LanguageTranslationState>(context, listen: false)
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
    } else {
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
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
          body: !isFormReady
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
                  margin: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 13.0,
                  ),
                  child: Consumer<LanguageTranslationState>(
                    builder: (context, languageTranslationState, child) {
                      String currentLanguage =
                          languageTranslationState.currentLanguage;
                      return Consumer<EnrollmentFormState>(
                        builder: (context, enrollmentFormState, child) =>
                            Column(
                          children: [
                            Container(
                              child: EntryFormContainer(
                                hiddenFields: enrollmentFormState.hiddenFields,
                                hiddenSections:
                                    enrollmentFormState.hiddenSections,
                                formSections: formSections,
                                dataObject: enrollmentFormState.formState,
                                mandatoryFieldObject: mandatoryFieldObject,
                                onInputValueChange: onInputValueChange,
                              ),
                            ),
                            EntryFormSaveButton(
                              label: currentLanguage == 'lesotho'
                                  ? 'Boloka ebe u fetela pele'
                                  : 'Save and Continue',
                              labelColor: Colors.white,
                              buttonColor: Color(0xFF258DCC),
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
        bottomNavigationBar: InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
