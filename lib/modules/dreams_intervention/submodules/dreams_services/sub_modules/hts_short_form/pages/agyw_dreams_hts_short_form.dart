import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/agyw_dreams_short_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_short_form/constants/agyw_dreams_hts_short_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_short_form/skip_logics/agyw_dreams_hts_short_form_skip_logics.dart';
import 'package:provider/provider.dart';

class AgywDreamsHTSShortForm extends StatefulWidget {
  AgywDreamsHTSShortForm({Key key}) : super(key: key);

  @override
  _AgywDreamsHTSShortFormState createState() => _AgywDreamsHTSShortFormState();
}

class _AgywDreamsHTSShortFormState extends State<AgywDreamsHTSShortForm> {
  final String label = "HTS Form";
  List<FormSection> formSections;
  List<String> mandatoryFields = AgywDreamsShortForm.getMandatoryFields() ?? [];
  bool isFormReady = false;
  bool isSaving = false;
  Map mandatoryFieldObject;
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    formSections = AgywDreamsShortForm.getFormSections();
    mandatoryFieldObject = Map();
    mandatoryFields.forEach((field) => mandatoryFieldObject[field] = true);
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  void onSaveForm(
      BuildContext context, Map dataObject, AgywDream agywDream) async {
    String eventDate = dataObject['eventDate'];
    String eventId = dataObject['eventId'];
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      setState(() {
        isSaving = true;
      });
      Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
          .setCurrentAgywDream(agywDream);
      await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
        AgywDreamsHTSShortFormConstant.program,
        AgywDreamsHTSShortFormConstant.programStage,
        agywDream.orgUnit,
        formSections,
        dataObject,
        eventDate,
        agywDream.id,
        eventId,
        [], //Hidden fields
        skippedFields: [],
      );
      Provider.of<ServiveEventDataState>(context, listen: false)
          .resetServiceEventDataState(agywDream.id);

      Timer(Duration(seconds: 1), () {
        setState(() {
          isSaving = false;
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
        });
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

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await AgywDreamSHTSShortFormSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
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
        body: Container(
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String currentLanguage = languageTranslationState.currentLanguage;
              return Consumer<DreamBenefeciarySelectionState>(
                builder: (context, dreamBenefeciarySelectionState, child) {
                  return Consumer<ServiceFormState>(
                    builder: (context, serviceFormState, child) {
                      AgywDream agywDream =
                          dreamBenefeciarySelectionState.currentAgywDream;
                      return Container(
                        child: Column(
                          children: [
                            DreamBenefeciaryTopHeader(
                              agywDream: agywDream,
                            ),
                            Container(
                              child: !isFormReady
                                  ? Container(
                                      child: CircularProcessLoader(
                                        color: Colors.blueGrey,
                                      ),
                                    )
                                  : Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 10.0,
                                              left: 13.0,
                                              right: 13.0,
                                            ),
                                            child: EntryFormContainer(
                                              formSections: formSections,
                                              mandatoryFieldObject:
                                                  mandatoryFieldObject,
                                              hiddenFields:
                                                  serviceFormState.hiddenFields,
                                              hiddenSections: serviceFormState
                                                  .hiddenSections,
                                              hiddenInputFieldOptions:
                                                  serviceFormState
                                                      .hiddenInputFieldOptions,
                                              isEditableMode: serviceFormState
                                                  .isEditableMode,
                                              dataObject:
                                                  serviceFormState.formState,
                                              onInputValueChange:
                                                  onInputValueChange,
                                              unFilledMandatoryFields:
                                                  unFilledMandatoryFields,
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                serviceFormState.isEditableMode,
                                            child: EntryFormSaveButton(
                                              label: isSaving
                                                  ? 'Saving ...'
                                                  : currentLanguage != 'lesotho'
                                                      ? 'Save'
                                                      : 'Boloka',
                                              labelColor: Colors.white,
                                              buttonColor: Color(0xFF258DCC),
                                              fontSize: 15.0,
                                              onPressButton: () => onSaveForm(
                                                context,
                                                serviceFormState.formState,
                                                agywDream,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
