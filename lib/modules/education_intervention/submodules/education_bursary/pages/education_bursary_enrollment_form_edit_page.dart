import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/constants/bursary_routes_constant.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/models/education_bursary_enrollment_form.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/services/education_bursary_enrollment_service.dart';
import 'package:kb_mobile_app/modules/education_intervention/submodules/education_bursary/skip_logics/education_bursary_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class EducationBursaryEnrollmentEditFormPage extends StatefulWidget {
  const EducationBursaryEnrollmentEditFormPage({Key? key}) : super(key: key);

  @override
  State<EducationBursaryEnrollmentEditFormPage> createState() =>
      _EducationBursaryEnrollmentEditFormPageState();
}

class _EducationBursaryEnrollmentEditFormPageState
    extends State<EducationBursaryEnrollmentEditFormPage> {
  final String label = "Bursary Enrollment Form";

  final List<String> mandatoryFields =
      EducationBursaryEnrollmentForm.getMandatoryField();

  final Map mandatoryFieldObject = Map();
  List<FormSection>? formSections;
  bool isSaving = false;
  bool isFormReady = false;
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      for (String id in mandatoryFields) {
        mandatoryFieldObject[id] = true;
      }
      formSections = EducationBursaryEnrollmentForm.getFormSections();
      isFormReady = true;
      evaluateSkipLogics();
    });
  }

  void onUpdateFormAutoSaveState(BuildContext context) async {
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String beneficiaryId = dataObject['trackedEntityInstance'] ?? "";
    String id =
        "${BursaryRoutesConstant.enrollmentEditPageModule}_$beneficiaryId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: BursaryRoutesConstant.enrollmentEditPageModule,
      nextPageModule: BursaryRoutesConstant.enrollmentEditNextPageModule,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    onUpdateFormAutoSaveState(context);
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await EducationBursaryEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections!,
          dataObject,
        );
      },
    );
  }

  void clearFormAutoSaveState(BuildContext context) async {
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String beneficiaryId = dataObject['trackedEntityInstance'] ?? "";
    String formAutoSaveId =
        "${BursaryRoutesConstant.enrollmentEditPageModule}_$beneficiaryId";
    print('formAutoSaveId $formAutoSaveId');
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onSave(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      CurrentUser? user = await (UserService().getCurrentUser());
      dataObject['klLkGxy328c'] =
          dataObject['klLkGxy328c'] ?? user!.implementingPartner;
      dataObject['DdnlE8kmIkT'] = dataObject['DdnlE8kmIkT'] ?? user!.username;
      if (user!.subImplementingPartner != '') {
        dataObject['fQInK8s2RNR'] =
            dataObject['fQInK8s2RNR'] ?? user.subImplementingPartner;
      }
      String trackedEntityInstance =
          dataObject['trackedEntityInstance'] ?? AppUtil.getUid();
      String? orgUnit = dataObject['location'];
      String? enrollment = dataObject['enrollment'];
      String? enrollmentDate = dataObject['enrollmentDate'];
      String? incidentDate = dataObject['incidentDate'];
      List<String> hiddenFields = [
        'klLkGxy328c',
        'DdnlE8kmIkT',
        'fQInK8s2RNR',
      ];
      try {
        await EducationBursaryEnrollmentService().savingBeneficiaryEnrollment(
          dataObject,
          trackedEntityInstance,
          orgUnit,
          enrollment,
          enrollmentDate,
          incidentDate,
          hiddenFields,
        );
        clearFormAutoSaveState(context);
        Timer(Duration(seconds: 1), () {
          if (Navigator.canPop(context)) {
            setState(() {
              isSaving = false;
            });
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        });
      } catch (e) {
        setState(() {
          isSaving = false;
        });
        AppUtil.showToastMessage(
            message: e.toString(), position: ToastGravity.BOTTOM);
      }
    } else {
      setState(() {
        unFilledMandatoryFields =
            AppUtil.getUnFilledMandatoryFields(mandatoryFields, dataObject);
      });
      AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP);
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
                                  isEditableMode:
                                      enrollmentFormState.isEditableMode,
                                  hiddenFields:
                                      enrollmentFormState.hiddenFields,
                                  hiddenSections:
                                      enrollmentFormState.hiddenSections,
                                  formSections: formSections,
                                  mandatoryFieldObject: mandatoryFieldObject,
                                  hiddenInputFieldOptions: enrollmentFormState
                                      .hiddenInputFieldOptions,
                                  dataObject: enrollmentFormState.formState,
                                  onInputValueChange: onInputValueChange,
                                  unFilledMandatoryFields:
                                      unFilledMandatoryFields,
                                ),
                              ),
                              Container(
                                child: Visibility(
                                  visible: enrollmentFormState.isEditableMode,
                                  child: EntryFormSaveButton(
                                    label: isSaving
                                        ? 'Saving ...'
                                        : currentLanguage == 'lesotho'
                                            ? 'Boloka'
                                            : 'Save',
                                    labelColor: Colors.white,
                                    buttonColor: Color(0xFF009688),
                                    fontSize: 15.0,
                                    onPressButton: () => onSave(
                                      context,
                                      enrollmentFormState.formState,
                                    ),
                                  ),
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