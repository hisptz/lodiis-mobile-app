import 'dart:async';
import 'dart:convert';
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
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/dreams_routes_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/services/none_agyw_dreams_enrollment_service.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/models/none_agyw_enrollment_prep_screening.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/skip_logics/none_agyw_enrollment_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class NoneAgywEnrollmentPrepScreeningForm extends StatefulWidget {
  const NoneAgywEnrollmentPrepScreeningForm({Key? key}) : super(key: key);

  @override
  _NoneAgywEnrollmentPrepScreeningFormState createState() =>
      _NoneAgywEnrollmentPrepScreeningFormState();
}

class _NoneAgywEnrollmentPrepScreeningFormState
    extends State<NoneAgywEnrollmentPrepScreeningForm> {
  final List<String> mandatoryFields =
      NoneAgywEnrollmentPrepScreening.getMandatoryField();
  List<FormSection>? formSections;
  final String label = 'PrEP Screening for Substantial Risk and Eligibility';

  final Map mandatoryFieldObject = Map();
  final String trackedEntityInstance = AppUtil.getUid();
  bool isFormReady = false;
  bool isSaving = false;
  List unFilledMandatoryFields = [];

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
          formSections!,
          dataObject,
        );
      },
    );
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
  }) async {
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String beneficiaryId = "";
    String id = "${DreamsRoutesConstant.noneAgywHtsConsentPage}_$beneficiaryId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: DreamsRoutesConstant.noneAgywPrepScreeningPage,
      nextPageModule: isSaveForm
          ? DreamsRoutesConstant.noneAgywPrepScreeningNextPage
          : DreamsRoutesConstant.noneAgywPrepScreeningPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  void clearFormAutoSaveState(BuildContext context) async {
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String beneficiaryId = dataObject['trackedEntityInstance'] ?? "";
    String formAutoSaveId =
        "${DreamsRoutesConstant.noneAgywHtsConsentPage}_$beneficiaryId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    onUpdateFormAutoSaveState(context);
  }

  void onSaveAndContinue(BuildContext context, Map dataObject,
      {Map hiddenFields = const {}}) async {
    bool hadAllMandatoryFilled = AppUtil.hasAllMandatoryFieldsFilled(
        mandatoryFields, dataObject,
        hiddenFields: hiddenFields);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      CurrentUser? user = await (UserService().getCurrentUser());
      dataObject['PN92g65TkVI'] = dataObject['PN92g65TkVI'] ?? 'Active';
      dataObject['klLkGxy328c'] =
          dataObject['klLkGxy328c'] ?? user!.implementingPartner;
      dataObject['DdnlE8kmIkT'] = dataObject['DdnlE8kmIkT'] ?? user!.username;
      if (user!.subImplementingPartner != '') {
        dataObject['fQInK8s2RNR'] =
            dataObject['fQInK8s2RNR'] ?? user.subImplementingPartner;
      }
      List<String> hiddenFields = [
        BeneficiaryIdentification.beneficiaryId,
        BeneficiaryIdentification.beneficiaryIndex,
        'PN92g65TkVI',
        'klLkGxy328c',
        'fQInK8s2RNR',
        'DdnlE8kmIkT'
      ];
      String? orgUnit = dataObject['location'];
      await NoneAgywDreamsEnrollmentService().savingNonAgywBeneficiary(
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
          clearFormAutoSaveState(context);
          if (Navigator.canPop(context)) {
            setState(() {
              isSaving = false;
            });
            String? currentLanguage =
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
      setState(() {
        unFilledMandatoryFields =
            AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
      });
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
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
                      String? currentLanguage =
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
                                unFilledMandatoryFields:
                                    unFilledMandatoryFields,
                              ),
                            ),
                            EntryFormSaveButton(
                              label: isSaving
                                  ? 'Saving...'
                                  : currentLanguage == 'lesotho'
                                      ? 'Boloka ebe u fetela pele'
                                      : 'Save and Continue',
                              labelColor: Colors.white,
                              buttonColor: Color(0xFF258DCC),
                              fontSize: 15.0,
                              onPressButton: () => onSaveAndContinue(
                                  context, enrollmentFormState.formState,
                                  hiddenFields:
                                      enrollmentFormState.hiddenFields),
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
