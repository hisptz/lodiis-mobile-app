import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/dreams_service_service_form.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/constants/service_form_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/service_form/skip_logics/agyw_dreams_service_form_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsServiceForm extends StatefulWidget {
  AgywDreamsServiceForm({Key key, this.isFormEdited: false}) : super(key: key);

  final bool isFormEdited;
  @override
  _AgywDreamsServiceFormState createState() => _AgywDreamsServiceFormState();
}

class _AgywDreamsServiceFormState extends State<AgywDreamsServiceForm> {
  final String label = 'Service Form';
  final String sessionNumberInputField = 'vL6NpUA0rIU';
  final String typeOfIntervention = 'Eug4BXDFLym';
  List<FormSection> formSections;
  final List<String> mandatoryFields = DreamsServiceForm.getMandatoryField();
  final Map mandatoryFieldObject = Map();
  bool isFormReady = false;
  bool isSaving = false;
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    for (String id in mandatoryFields) {
      mandatoryFieldObject[id] = true;
    }
    formSections = DreamsServiceForm.getFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        CurrentUser currentUser =
            Provider.of<CurrentUserState>(context, listen: false).currentUser;
        dataObject['implementingPatner'] =
            '${currentUser.implementingPartner ?? ''}';
        await AgywDreamsServiceFormSkipLogic.evaluateSkipLogics(
            context, formSections, dataObject,
            isFormEdited: widget.isFormEdited);
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
    if (id == sessionNumberInputField || id == typeOfIntervention) {
      Timer(Duration(milliseconds: 200), () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        if (dataObject[sessionNumberInputField] != null) {
          bool allowedNumberOfSessions =
              AgywDreamsServiceFormSkipLogic.evaluateSkipLogicsBySession(
                  dataObject);
          if (!allowedNumberOfSessions) {
            AppUtil.showToastMessage(
                message:
                    "You have reached the maximum number of sessions for ${dataObject[typeOfIntervention]}",
                position: ToastGravity.TOP);
          }
        }
      });
    }
  }

  void onSaveForm(
      BuildContext context, Map dataObject, AgywDream agywDream) async {
    bool hadAllMandatoryFilled =
        AppUtil.hasAllMandarotyFieldsFilled(mandatoryFields, dataObject);
    if (hadAllMandatoryFilled) {
      if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
        bool shouldSaveForm =
            AgywDreamsServiceFormSkipLogic.evaluateSkipLogicsBySession(
                dataObject);
        if (shouldSaveForm) {
          bool sessionAlreadyExists = AgywDreamsServiceFormSkipLogic
              .evaluateSkipLogicBySessionReoccurrence(dataObject);
          if (sessionAlreadyExists) {
            AppUtil.showToastMessage(
                message:
                    "Sessions ${dataObject[sessionNumberInputField]} for ${dataObject[typeOfIntervention]} already exists",
                position: ToastGravity.TOP);
          } else {
            setState(() {
              isSaving = true;
            });
            String eventDate = dataObject['eventDate'];
            String eventId = dataObject['eventId'];
            dataObject.remove('implementingPatner');
            List<String> hiddenFields = [];
            List<String> skippedFields = [
              'interventionSessions',
              'eventSessions'
            ];

            try {
              await TrackedEntityInstanceUtil
                  .savingTrackedEntityInstanceEventData(
                      ServiceFormConstant.program,
                      ServiceFormConstant.programStage,
                      agywDream.orgUnit,
                      formSections,
                      dataObject,
                      eventDate,
                      agywDream.id,
                      eventId,
                      hiddenFields,
                      skippedFields: skippedFields);
              Provider.of<ServiveEventDataState>(context, listen: false)
                  .resetServiceEventDataState(agywDream.id);
              Timer(Duration(seconds: 1), () {
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
                Navigator.pop(context);
              });
            } catch (e) {
              Timer(Duration(seconds: 1), () {
                setState(() {
                  AppUtil.showToastMessage(
                      message: e.toString(), position: ToastGravity.BOTTOM);
                });
              });
            }
          }
        } else {
          AppUtil.showToastMessage(
              message:
                  "You have reached the maximum number of sessions for ${dataObject[typeOfIntervention]}",
              position: ToastGravity.TOP);
        }
      } else {
        AppUtil.showToastMessage(
            message: 'Please fill at least one form field',
            position: ToastGravity.TOP);
        Navigator.pop(context);
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
                String currentLanguage =
                    languageTranslationState.currentLanguage;
                return Consumer<DreamBenefeciarySelectionState>(
                  builder: (context, nonAgywState, child) {
                    AgywDream agywDream = nonAgywState.currentAgywDream;
                    return Consumer<ServiceFormState>(
                      builder: (context, serviceFormState, child) {
                        return Container(
                          child: Column(
                            children: [
                              DreamBenefeciaryTopHeader(
                                agywDream: agywDream,
                              ),
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
                                            hiddenFields:
                                                serviceFormState.hiddenFields,
                                            hiddenSections:
                                                serviceFormState.hiddenSections,
                                            hiddenInputFieldOptions:
                                                serviceFormState
                                                    .hiddenInputFieldOptions,
                                            formSections: formSections,
                                            mandatoryFieldObject:
                                                mandatoryFieldObject,
                                            isEditableMode:
                                                serviceFormState.isEditableMode,
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
                                                : currentLanguage == 'lesotho'
                                                    ? 'Boloka'
                                                    : 'Save',
                                            labelColor: Colors.white,
                                            buttonColor: Color(0xFF258DCC),
                                            fontSize: 15.0,
                                            onPressButton: () => onSaveForm(
                                                context,
                                                serviceFormState.formState,
                                                agywDream),
                                          ),
                                        )
                                      ],
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
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
