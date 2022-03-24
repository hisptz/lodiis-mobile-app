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
import 'package:kb_mobile_app/core/services/form_auto_save_offline_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_auto_save.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/constants/ovc_routes_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_child_services.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/services/ovc_enrollment_household_service.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/skip_logics/ovc_household_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentHouseholdForm extends StatefulWidget {
  const OvcEnrollmentHouseholdForm({Key? key}) : super(key: key);

  @override
  _OvcEnrollmentHouseholdFormState createState() =>
      _OvcEnrollmentHouseholdFormState();
}

class _OvcEnrollmentHouseholdFormState
    extends State<OvcEnrollmentHouseholdForm> {
  List<FormSection>? formSections;
  final String label = 'Household information';
  final List<String> mandatoryFields =
      OvcEnrollmentHousehold.getMandatoryField();
  final Map mandatoryFieldObject = {};
  final String trackedEntityInstance = AppUtil.getUid();

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
      formSections = OvcEnrollmentHousehold.getFormSections();
      isFormReady = true;
      evaluateSkipLogics();
    });
  }

  void onSaveAndContinue(BuildContext context, Map dataObject) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      dataObject['PN92g65TkVI'] = dataObject['PN92g65TkVI'] ?? 'Active';
      List<String> hiddenFields = [
        BeneficiaryIdentification.beneficiaryId,
        BeneficiaryIdentification.beneficiaryIndex,
        'PN92g65TkVI',
        'klLkGxy328c',
        'DdnlE8kmIkT',
        'fQInK8s2RNR'
      ];
      List<Map?> childMapObjects = [];
      for (Map childObj in dataObject["children"]) {
        childMapObjects.add(childObj);
      }
      CurrentUser? user = await UserService().getCurrentUser();
      dataObject['klLkGxy328c'] =
          dataObject['klLkGxy328c'] ?? user!.implementingPartner;
      dataObject['DdnlE8kmIkT'] = dataObject['DdnlE8kmIkT'] ?? user!.username;
      if (user!.subImplementingPartner != '') {
        dataObject['fQInK8s2RNR'] =
            dataObject['fQInK8s2RNR'] ?? user.subImplementingPartner;
      }
      String? orgUnit = dataObject['location'];
      bool shouldEnroll = true;
      await OvcEnrollmentHouseholdService().savingHouseholdForm(
        dataObject,
        trackedEntityInstance,
        orgUnit,
        null,
        null,
        null,
        shouldEnroll,
        hiddenFields,
      );
      await OvcEnrollmentChildService().savingChildrenEnrollmentForms(
        trackedEntityInstance,
        orgUnit,
        childMapObjects,
        null,
        null,
        shouldEnroll,
        hiddenFields,
      );
      await Provider.of<OvcInterventionListState>(context, listen: false)
          .onHouseholdAdd();
      clearFormAutoSaveState(context);
      Timer(const Duration(seconds: 1), () {
        if (Navigator.canPop(context)) {
          isSaving = false;
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          setState(() {});
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      });
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

  void clearFormAutoSaveState(BuildContext context) async {
    String beneficiaryId = "";
    String formAutoSaveId =
        "${OvcRoutesConstant.ovcConcentFormPage}_$beneficiaryId";
    await FormAutoSaveOfflineService().deleteSavedFormAutoData(formAutoSaveId);
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
      pageModule: OvcRoutesConstant.ovcHouseholdInformationFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : OvcRoutesConstant.ovcHouseholdInformationFormNextPage
          : OvcRoutesConstant.ovcHouseholdInformationFormPage,
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
                          hiddenFields: enrollmentFormState.hiddenFields,
                          hiddenSections: enrollmentFormState.hiddenSections,
                          formSections: formSections,
                          mandatoryFieldObject: mandatoryFieldObject,
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
                              : onSaveAndContinue(
                                  context,
                                  enrollmentFormState.formState,
                                ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
        bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
