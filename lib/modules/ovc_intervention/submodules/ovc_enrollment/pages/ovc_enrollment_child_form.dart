import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
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
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/add_child_confirmation.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/enrolled_children_list.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/constants/ovc_enrollment_child_form_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_household_form.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentChildForm extends StatefulWidget {
  const OvcEnrollmentChildForm({Key? key}) : super(key: key);

  @override
  _OvcEnrollmentChildFormState createState() => _OvcEnrollmentChildFormState();
}

class _OvcEnrollmentChildFormState extends State<OvcEnrollmentChildForm> {
  final List<FormSection> formSections = OvcEnrollmentChild.getFormSections();
  final String label = 'Child vulnerability form';
  final List<Map?> childMapObjects = [];
  bool isLoading = true;
  Map? childMapObject;
  final List<String> mandatoryFields = OvcEnrollmentChild.getMandatoryField();
  final Map mandatoryFieldObject = {};

  Map hiddenFields = {};
  Map hiddenSections = {};
  Map hiddenInputFieldOptions = {};
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    for (String id in mandatoryFields) {
      mandatoryFieldObject[id] = true;
    }
    assignChildrenOnAutoSaving();
    setState(() {});
    resetMapObject(childMapObject);
  }

  void assignChildrenOnAutoSaving() {
    try {
      Map dataObject =
          Provider.of<EnrollmentFormState>(context, listen: false).formState;
      for (Map childObj in dataObject["children"]) {
        childMapObjects.add(childObj);
      }
    } catch (e) {
      //
    }
  }

  void resetMapObject(Map? map) {
    setState(() {
      if (map != null) {
        if (!isADuplicateChildObject(map)) {
          map['fullName'] = '${map['WTZ7GLTrE8Q']} ${map['rSP9c21JsfC']}';
          childMapObjects.add(map);
          Provider.of<EnrollmentFormState>(context, listen: false)
              .setFormFieldState('children', childMapObjects);
          onUpdateFormAutoSaveState(context);
        }
      }
      childMapObject = {};
      isLoading = false;
      evaluateSkipLogics();
    });
  }

  evaluateSkipLogics() async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    Map dataObject =
        Provider.of<EnrollmentFormState>(context, listen: false).formState;
    for (String inputFieldId in inputFieldIds) {
      String value = '${childMapObject![inputFieldId]}';
      if (inputFieldId == 'qZP982qpSPS') {
        int age = AppUtil.getAgeInYear(value);
        assignInputFieldValue('ls9hlz2tyol', age.toString());
        if (age > 2) {
          hiddenFields['GMcljM7jbNG'] = true;
        }
      }
      if (inputFieldId == 'iS9mAp3jDaU') {
        if (value == 'Biological mother' || value == 'Biological father') {
          assignInputFieldValue('UeF4OvjIIEK', 'false');
          hiddenFields['nOgf8LKXS4k'] = true;
        }
      }
      if (inputFieldId == 'nOgf8LKXS4k') {
        Map hiddenOptions = {};
        String relationShipToCaregiver = '${childMapObject!['iS9mAp3jDaU']}';
        if (relationShipToCaregiver == 'Biological mother') {
          hiddenOptions['Single Orphan(Mother)'] = true;
          hiddenOptions['Double Orphan'] = true;
        } else if (relationShipToCaregiver == 'Biological father') {
          hiddenOptions['Single Orphan(Father)'] = true;
          hiddenOptions['Double Orphan'] = true;
        }
        hiddenInputFieldOptions[inputFieldId] = hiddenOptions;
      }
      if (inputFieldId == 'UeF4OvjIIEK' &&
          (value.isEmpty || value.trim() != 'true')) {
        hiddenFields['nOgf8LKXS4k'] = true;
      }
      if (inputFieldId == 'wmKqYZML8GA' &&
          (value.isEmpty || value.trim() == 'true')) {
        hiddenFields['GMcljM7jbNG'] = true;
      }
      if (inputFieldId == 'Gkjp5XZD70V' &&
          (value.isEmpty || value.trim() != 'true')) {
        hiddenFields['Sa0KVprHUr7'] = true;
        hiddenFields['XZh0Uew9Xk0'] = true;
        hiddenFields['wtrZQadTkOL'] = true;
        hiddenFields['Mc3k3bSwXNe'] = true;
        hiddenFields['CePNVGSnj00'] = true;
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'Mc3k3bSwXNe' &&
          (value.isEmpty || value.trim() != 'true')) {
        hiddenFields['CePNVGSnj00'] = true;
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'CePNVGSnj00' &&
          (value.isEmpty || value.trim() != 'Other')) {
        hiddenFields['GM2mJDlGZin'] = true;
      }
      if (inputFieldId == 'Sa0KVprHUr7' && value != 'Date') {
        hiddenFields['XZh0Uew9Xk0'] = true;
      }
      if (inputFieldId == 'omUPOnb4JVp' && value != 'true') {
        hiddenFields['WsmWkkFBiT6'] = true;
      }
      if (inputFieldId == 'YR7Xxk14qoP' && value != 'true') {
        hiddenFields['YR7Xxk14qoP_checkbox'] = true;
      }
      if (inputFieldId == 'tNdoR0jYr7R') {
        if (dataObject['tNdoR0jYr7R'] == '') {
          hiddenFields['tNdoR0jYr7R'] = true;
        } else {
          assignInputFieldValue('tNdoR0jYr7R', dataObject['tNdoR0jYr7R']);
        }
      }
    }
    assignPrimaryVulnerability(childMapObject);
    for (String sectionId in hiddenSections.keys) {
      List<FormSection> allFormSections =
          FormUtil.getFlattenFormSections(formSections);
      List<String> hiddenSectionInputFieldIds = FormUtil.getFormFieldIds(
          allFormSections
              .where((formSection) => formSection.id == sectionId)
              .toList());
      for (String inputFieldId in hiddenSectionInputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    setState(() {});
  }

  resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(inputFieldId, null);
      }
    }
  }

  assignInputFieldValue(
    String inputFieldId,
    String? value,
  ) {
    childMapObject![inputFieldId] = value;
  }

  assignPrimaryVulnerability(Map? dataObject) {
    List<String> vulnerabilities = [
      'wmKqYZML8GA',
      'GMcljM7jbNG',
      'br1xvwAQ6el',
      'ZKMhrjWoXnD',
      'Gkjp5XZD70V',
      'UeF4OvjIIEK',
      'YR7Xxk14qoP'
    ];
    List<String> primaryVulnerabilitiesOptions = [
      'Child living with HIV',
      'HIV exposed infants',
      'Child of a sex worker (FSW)',
      'Child of PLHIV',
      'Child exposed/experiencing violence and abuse (Survivors of Vac)',
      'Orphan',
      'Child living with disability'
    ];
    for (var vulnerabilityKey in vulnerabilities) {
      if (dataObject![vulnerabilityKey] == true) {
        assignInputFieldValue(
            OvcEnrollmentChildConstant.primaryVulnerabilityKey,
            primaryVulnerabilitiesOptions[
                vulnerabilities.indexOf(vulnerabilityKey)]);
        break;
      } else {
        continue;
      }
    }
    if (vulnerabilities.every((element) =>
        (dataObject![element] == false || dataObject[element] == null))) {
      assignInputFieldValue(
          OvcEnrollmentChildConstant.primaryVulnerabilityKey, null);
    }
  }

  void updateOvcCount() {
    int male = 0;
    int female = 0;
    for (Map? childMapObject in childMapObjects) {
      String? sexValue = childMapObject!['vIX4GTSCX4P'];
      if (sexValue != null) {
        if (sexValue == 'Male') {
          male++;
        } else if (sexValue == 'Female') {
          female++;
        }
      }
    }
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('kQehaqmaygZ', male.toString());
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('BXUNH6LXeGA', female.toString());
  }

  void onSaveAndContinue(BuildContext context) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandatoryFieldsFilled(mandatoryFields, childMapObject!);
    if (hadAllMandatoryFilled) {
      String name = childMapObject!['WTZ7GLTrE8Q'] ?? '';
      Widget modal = AddChildConfirmation(name: name);
      bool response = await AppUtil.showPopUpModal(context, modal, false);
      if (response) {
        isLoading = true;
        updateChildMapObjectsOnState(context);
        setState(() {});
        Timer(
          const Duration(milliseconds: 500),
          () => resetMapObject(childMapObject),
        );
      } else {
        updateChildMapObjectsOnState(
          context,
          isSaveForm: true,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OvcEnrollmentHouseholdForm(),
          ),
        );
      }
    } else {
      setState(() {
        unFilledMandatoryFields = AppUtil.getUnFilledMandatoryFields(
            mandatoryFields, childMapObject!);
      });
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  void updateChildMapObjectsOnState(
    BuildContext context, {
    bool shouldAddChildObject = true,
    bool isSaveForm = false,
  }) async {
    CurrentUser? user = await (UserService().getCurrentUser());
    bool isDupliocateChild = !isADuplicateChildObject(childMapObject);
    if (isDupliocateChild) {
      childMapObject!['PN92g65TkVI'] = 'Active';
      childMapObject![UserAccountReference.implementingPartnerAttribute] =
          childMapObject![UserAccountReference.implementingPartnerAttribute] ??
              user!.implementingPartner;
      childMapObject![UserAccountReference.serviceProviderAtttribute] =
          childMapObject![UserAccountReference.serviceProviderAtttribute] ??
              user!.username;
      if (user!.subImplementingPartner != '') {
        childMapObject![UserAccountReference.subImplementingPartnerAttribute] =
            childMapObject![
                    UserAccountReference.subImplementingPartnerAttribute] ??
                user.subImplementingPartner;
      }
      childMapObject!['fullName'] =
          '${childMapObject!['WTZ7GLTrE8Q']} ${childMapObject!['rSP9c21JsfC']}';
      if (shouldAddChildObject) {
        childMapObjects.add(childMapObject);
        setState(() {});
      }
    }
    updateOvcCount();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('children', childMapObjects);
    onUpdateFormAutoSaveState(context, isSaveForm: isSaveForm);
    setState(() {});
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
      pageModule: OvcRoutesConstant.ovcChildVulnerabilityFormPage,
      nextPageModule: isSaveForm
          ? nextPageModule != ""
              ? nextPageModule
              : OvcRoutesConstant.ovcChildVulnerabilityFormNextPage
          : OvcRoutesConstant.ovcChildVulnerabilityFormPage,
      data: jsonEncode(dataObject),
    );
    await FormAutoSaveOfflineService().saveFormAutoSaveData(formAutoSave);
  }

  void onInputValueChange(String id, dynamic value) {
    childMapObject![id] = value;
    evaluateSkipLogics();
    updateChildMapObjectsOnState(context, shouldAddChildObject: false);
  }

  void onSkip(Map? childMapObject) {
    setState(() {
      if (isADuplicateChildObject(childMapObject)) {
        childMapObject!['fullName'] =
            '${childMapObject['WTZ7GLTrE8Q']} ${childMapObject['rSP9c21JsfC']}';
        childMapObjects.add(childMapObject);
      }
    });
    updateOvcCount();
    Provider.of<EnrollmentFormState>(context, listen: false)
        .setFormFieldState('children', childMapObjects);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OvcEnrollmentHouseholdForm(),
      ),
    );
  }

  bool isADuplicateChildObject(Map? map) {
    bool isDuplicate = false;
    for (var child in childMapObjects) {
      if (child!['WTZ7GLTrE8Q'] == map!['WTZ7GLTrE8Q']) {
        isDuplicate = true;
      }
    }
    return isDuplicate;
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
          body: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String? currentLanguage =
                  languageTranslationState.currentLanguage;
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 13.0,
                ),
                child: isLoading
                    ? Column(
                        children: const [
                          Center(
                            child: CircularProcessLoader(
                              color: Colors.blueGrey,
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          childMapObjects.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12.0,
                                  ),
                                  child: EnrolledChildrenList(
                                    childrenList: childMapObjects
                                        .map<String?>(
                                            (child) => child!['fullName'])
                                        .toList(),
                                  ),
                                )
                              : Container(),
                          EntryFormContainer(
                            formSections: formSections,
                            hiddenFields: hiddenFields,
                            hiddenSections: hiddenSections,
                            hiddenInputFieldOptions: hiddenInputFieldOptions,
                            mandatoryFieldObject: mandatoryFieldObject,
                            dataObject: childMapObject,
                            onInputValueChange: onInputValueChange,
                            unFilledMandatoryFields: unFilledMandatoryFields,
                          ),
                          EntryFormSaveButton(
                            label: currentLanguage == 'lesotho'
                                ? 'Boloka ebe u fetela pele'
                                : 'Save and Continue',
                            labelColor: Colors.white,
                            buttonColor: const Color(0xFF4B9F46),
                            fontSize: 15.0,
                            onPressButton: () => onSaveAndContinue(context),
                          ),
                          Visibility(
                            visible: childMapObjects.isNotEmpty,
                            child: TextButton(
                              onPressed: () => onSkip(childMapObject),
                              child: Text(
                                currentLanguage == 'lesotho' ? 'Feta' : 'Skip',
                                style: const TextStyle().copyWith(
                                  color: const Color(0xFF4B9F46),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
        bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
      ),
    );
  }
}
