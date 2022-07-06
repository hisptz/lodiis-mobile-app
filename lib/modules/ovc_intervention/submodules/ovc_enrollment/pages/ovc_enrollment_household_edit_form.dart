import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/beneficiary_identification.dart';
import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_household_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollement_basic_info.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/skip_logics/ovc_household_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentHouseholdEditForm extends StatefulWidget {
  const OvcEnrollmentHouseholdEditForm({Key? key}) : super(key: key);

  @override
  _OvcEnrollmentHouseholdEditFormState createState() =>
      _OvcEnrollmentHouseholdEditFormState();
}

class _OvcEnrollmentHouseholdEditFormState
    extends State<OvcEnrollmentHouseholdEditForm> {
  List<FormSection>? formSections;
  late List<FormSection> enrollmentFormSections;
  final String label = 'Household vulnerability and prioritization form';
  final Map mandatoryFieldObject = {};
  final List<String> mandatoryFields =
      OvcEnrollmentBasicInfo.getMandatoryField();
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
      enrollmentFormSections = OvcEnrollmentHousehold.getFormSections();
      List<String> skippedInputs = [
        'location',
        'kQehaqmaygZ',
        'BXUNH6LXeGA',
        'ls9hlz2tyol'
      ];
      formSections = [enrollmentFormSections[0]];
      formSections = FormUtil.getFormSectionWithReadOnlyStatus(
        formSections!,
        false,
        skippedInputs,
      );
      isFormReady = true;
      evaluateSkipLogics();
    });
  }

  evaluateSkipLogics() {
    Timer(
      const Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<EnrollmentFormState>(context, listen: false).formState;
        await OvcHouseholdEnrollmentSkipLogic.evaluateSkipLogics(
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
        "${OvcRoutesConstant.ovcEnrollmentHouseholdEditFormPage}_$beneficiaryId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
  }

  void onUpdateFormAutoSaveState(
    BuildContext context, {
    bool isSaveForm = false,
    String nextPageModule = "",
  }) async {
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    String beneficiaryId = dataObject['trackedEntityInstance'] ?? "";
    String id =
        "${OvcRoutesConstant.ovcEnrollmentHouseholdEditFormPage}_$beneficiaryId";
    FormAutoSave formAutoSave = FormAutoSave(
      id: id,
      beneficiaryId: beneficiaryId,
      pageModule: OvcRoutesConstant.ovcEnrollmentHouseholdEditFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : OvcRoutesConstant.ovcEnrollmentHouseholdEditFormNextPage
          : OvcRoutesConstant.ovcEnrollmentHouseholdEditFormPage,
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

  void onSaveForm(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      String? trackedEntityInstance = dataObject['trackedEntityInstance'];
      String? orgUnit = dataObject['orgUnit'];
      String? enrollment = dataObject['enrollment'];
      String? enrollmentDate = dataObject['enrollmentDate'];
      String? incidentDate = dataObject['incidentDate'];
      List<String> hiddenFields = [
        BeneficiaryIdentification.beneficiaryId,
        BeneficiaryIdentification.beneficiaryIndex,
        'PN92g65TkVI',
        UserAccountReference.implementingPartnerAttribute,
        UserAccountReference.serviceProviderAtttribute,
        UserAccountReference.subImplementingPartnerAttribute
      ];
      CurrentUser? user = await UserService().getCurrentUser();
      dataObject[UserAccountReference.implementingPartnerAttribute] =
          dataObject[UserAccountReference.implementingPartnerAttribute] ??
              user!.implementingPartner;
      dataObject[UserAccountReference.serviceProviderAtttribute] =
          dataObject[UserAccountReference.serviceProviderAtttribute] ??
              user!.username;
      if (user!.subImplementingPartner != '') {
        dataObject[UserAccountReference.subImplementingPartnerAttribute] =
            dataObject[UserAccountReference.subImplementingPartnerAttribute] ??
                user.subImplementingPartner;
      }
      await OvcEnrollmentHouseholdService().savingHouseholdForm(
        dataObject,
        trackedEntityInstance,
        orgUnit,
        enrollment,
        enrollmentDate,
        incidentDate,
        false,
        hiddenFields,
      );
      Provider.of<OvcInterventionListState>(context, listen: false)
          .refreshOvcList();
      clearFormAutoSaveState(context);
      Timer(const Duration(seconds: 1), () {
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
      });
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
          preferredSize: const Size.fromHeight(65.0),
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
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 13.0,
            ),
            child: Container(
              child: !isFormReady
                  ? Column(
                      children: const [
                        Center(
                          child: CircularProcessLoader(
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    )
                  : Consumer<EnrollmentFormState>(
                      builder: (context, enrollmentFormState, child) => Column(
                        children: [
                          EntryFormContainer(
                            formSections: formSections,
                            mandatoryFieldObject: mandatoryFieldObject,
                            hiddenFields: enrollmentFormState.hiddenFields,
                            hiddenSections: enrollmentFormState.hiddenSections,
                            isEditableMode: enrollmentFormState.isEditableMode,
                            dataObject: enrollmentFormState.formState,
                            onInputValueChange: onInputValueChange,
                            unFilledMandatoryFields: unFilledMandatoryFields,
                          ),
                          EntryFormSaveButton(
                            label: isSaving
                                ? 'Saving Household ...'
                                : 'Save Household',
                            labelColor: Colors.white,
                            buttonColor: const Color(0xFF4B9F46),
                            fontSize: 15.0,
                            onPressButton: () => isSaving
                                ? null
                                : onSaveForm(
                                    context,
                                    enrollmentFormState.formState,
                                  ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ),
        bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
