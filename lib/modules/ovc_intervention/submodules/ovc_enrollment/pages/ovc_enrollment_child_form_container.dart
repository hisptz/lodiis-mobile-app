import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/user_account_reference.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/add_child_confirmation.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/components/enrolled_children_list.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/models/ovc_enrollment_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/skip_logics/ovc_child_enrollment_skip_logic.dart';
import 'package:provider/provider.dart';

class OvcEnrollmentChildFormContainer extends StatefulWidget {
  const OvcEnrollmentChildFormContainer({Key? key}) : super(key: key);

  @override
  State<OvcEnrollmentChildFormContainer> createState() =>
      _OvcEnrollmentChildFormContainerState();
}

class _OvcEnrollmentChildFormContainerState
    extends State<OvcEnrollmentChildFormContainer> {
  List<FormSection> formSections = [];
  final List<Map> childrenMapObjects = [];
  List unFilledMandatoryFields = [];
  Map childrenMapObject = {};
  Map hiddenFields = {};
  Map hiddenSections = {};
  Map hiddenInputFieldOptions = {};
  bool _isFormready = false;
  final List<String> mandatoryFields = OvcEnrollmentChild.getMandatoryField();
  final Map mandatoryFieldObject = {};

  @override
  void initState() {
    super.initState();
    _assignChildrenOnAutoSaving();
    _resetSkipLogicAndFormStateObjects();
    _setFormState();
    _evaluateSkipLogics();
  }

  _resetSkipLogicAndFormStateObjects() {
    unFilledMandatoryFields = [];
    childrenMapObject.clear();
    hiddenFields.clear();
    hiddenSections.clear();
    hiddenInputFieldOptions.clear();
  }

  _evaluateSkipLogics() {
    //TODO add support for getting caregiver additional data tp be autopopulated
    Timer(
      const Duration(milliseconds: 200),
      () {
        Map resultReponse = OvcChildEnrollmentSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          childrenMapObject,
          shouldSetEnrollmentState: false,
        );
        hiddenFields = resultReponse['hiddenFields'] ?? {};
        hiddenSections = resultReponse['hiddenSections'] ?? {};
        hiddenInputFieldOptions =
            resultReponse['hiddenInputFieldOptions'] ?? {};
        Map assignedFields = resultReponse['assignedFields'] ?? {};
        for (String key in assignedFields.keys) {
          childrenMapObject[key] = assignedFields[key];
        }
        for (String key in hiddenFields.keys) {
          childrenMapObject[key] = null;
        }
        setState(() {});
      },
    );
  }

  _setFormState() {
    for (String id in mandatoryFields) {
      mandatoryFieldObject[id] = true;
    }
    formSections = OvcEnrollmentChild.getFormSections();
    _isFormready = true;
    setState(() {});
  }

  void _assignChildrenOnAutoSaving() {
    try {
      Map dataObject =
          Provider.of<EnrollmentFormState>(context, listen: false).formState;
      for (Map chilMapObject in dataObject["children"]) {
        childrenMapObjects.add(chilMapObject);
      }
    } catch (e) {
      //
    }
  }

  bool _isADuplicateChildObject(Map childrenMapObject) {
    bool isDuplicate = false;
    for (var child in childrenMapObjects) {
      if (child['WTZ7GLTrE8Q'] == childrenMapObject['WTZ7GLTrE8Q']) {
        isDuplicate = true;
      }
    }
    return isDuplicate;
  }

  void onInputValueChange(String id, dynamic value) {
    childrenMapObject[id] = value;
    setState(() {});
    _evaluateSkipLogics();
  }

  void onSaveAndContinue(BuildContext context) async {
    unFilledMandatoryFields = [];
    setState(() {});
    // bool hadAllMandatoryFilled = AppUtil.hasAllMandatoryFieldsFilled(
    //   mandatoryFields,
    //   childrenMapObject,
    //   hiddenFields: hiddenFields,
    // );
    bool hadAllMandatoryFilled = true;
    if (hadAllMandatoryFilled) {
      bool isDuplicatedChild = _isADuplicateChildObject(childrenMapObject);
      String childName = childrenMapObject['WTZ7GLTrE8Q'] ?? '';
      if (isDuplicatedChild) {
        AppUtil.showToastMessage(
          message: 'Child with  name $childName have already been added',
          position: ToastGravity.TOP,
        );
      } else {
        Widget modal = AddChildConfirmation(name: childName);
        bool shouldAddAnotherChild =
            await AppUtil.showPopUpModal(context, modal, false);
        if (shouldAddAnotherChild) {
          await _onUpdatingChildrenMapObjectsState(
              context, {...childrenMapObject});
          Timer(const Duration(milliseconds: 100), () {
            _resetSkipLogicAndFormStateObjects();
            setState(() {});
          });
        } else {
          //TODO save the data andredirect to home page
          //TODO clear form state
          await _onUpdatingChildrenMapObjectsState(
            context,
            {...childrenMapObject},
            shouldSaveForm: true,
          );
        }
        debugPrint("$childrenMapObjects");
      }
    } else {
      unFilledMandatoryFields = AppUtil.getUnFilledMandatoryFields(
          mandatoryFields, childrenMapObject);
      setState(() {});
      AppUtil.showToastMessage(
        message: 'Please fill all mandatory field',
        position: ToastGravity.TOP,
      );
    }
  }

  Future _onUpdatingChildrenMapObjectsState(
    BuildContext context,
    Map dataObject, {
    bool shouldSaveForm = false,
  }) async {
    CurrentUser? user = await UserService().getCurrentUser();
    dataObject['PN92g65TkVI'] = 'Active';
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
    dataObject['fullName'] =
        '${dataObject['WTZ7GLTrE8Q']} ${dataObject['rSP9c21JsfC']}';
    childrenMapObjects.add(dataObject);
    if (shouldSaveForm) {
      //TODO handling other operaton for saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<LanguageTranslationState>(
      builder: (context, languageTranslationState, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65.0),
            child: Consumer<InterventionCardState>(
              builder: (context, interventionCardState, child) {
                InterventionCard activeInterventionProgram =
                    interventionCardState.currentInterventionProgram;
                return SubPageAppBar(
                  label: languageTranslationState.isSesothoLanguage
                      ? 'Foromo ea ngoliso ea ngoana'
                      : 'Child Registration form',
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
              child: !_isFormready
                  ? const Center(
                      child: CircularProcessLoader(color: Colors.blueGrey),
                    )
                  : Column(
                      children: [
                        childrenMapObjects.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12.0,
                                ),
                                child: EnrolledChildrenList(
                                  childrenList: childrenMapObjects.map((child) {
                                    String fullName = child['fullName'] ?? '';
                                    return fullName;
                                  }).toList(),
                                ),
                              )
                            : Container(),
                        EntryFormContainer(
                          formSections: formSections,
                          hiddenFields: hiddenFields,
                          hiddenSections: hiddenSections,
                          hiddenInputFieldOptions: hiddenInputFieldOptions,
                          mandatoryFieldObject: mandatoryFieldObject,
                          dataObject: childrenMapObject,
                          onInputValueChange: onInputValueChange,
                          unFilledMandatoryFields: unFilledMandatoryFields,
                        ),
                        EntryFormSaveButton(
                          label: languageTranslationState.isSesothoLanguage
                              ? 'Boloka ebe u fetela pele'
                              : 'Save and Continue',
                          labelColor: Colors.white,
                          buttonColor: const Color(0xFF4B9F46),
                          fontSize: 15.0,
                          onPressButton: () => onSaveAndContinue(context),
                        ),
                      ],
                    ),
            ),
          ),
          bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
        );
      },
    ));
  }
}
