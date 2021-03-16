import 'dart:async';
import 'package:flutter/material.dart';
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
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/dreams_srh_client_intake.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/dreams_srh_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/srh/constants/srh_client_intake_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/srh/skip_logics/agyw_dreams_srh_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

import 'agyw_dreams_srh_register.dart';

class AgywDreamsSrhForm extends StatefulWidget {
  AgywDreamsSrhForm({Key key}) : super(key: key);

  @override
  _AgywDreamsSrhFormState createState() => _AgywDreamsSrhFormState();
}

class _AgywDreamsSrhFormState extends State<AgywDreamsSrhForm> {
  String label = 'SRH Client Intake Form';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isFormSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = DreamsSrhClientIntake.getFormSections();
    if (formInViewMode()) {
      label = '$label & Register';
      List<FormSection> srhRegisterFormSections =
          DreamsSrhRegister.getFormSections();
      srhRegisterFormSections[0].name = 'SRH REGISTER';
      formSections.addAll(srhRegisterFormSections);
    }
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
        evaluateSkipLogics();
      });
    });
  }

  void updateFormState(
    BuildContext context,
    Events eventData,
  ) {
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false).resetFormState();
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.eventDate);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.event);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await AgywDreamsSrhSkipLogic.evaluateSkipLogics(
          context,
          formSections,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  void onSaveForm(BuildContext context, Map dataObject, AgywDream agywDream,
      {@required Events srhRegisterEvent}) async {
    setState(() {
      isFormSaving = true;
    });
    Provider.of<DreamBenefeciarySelectionState>(context, listen: false)
        .setCurrentAgywDream(agywDream);

    if (dataObject[SRHConstant.srhToSrhRegisterLinkage] != null &&
        srhRegisterEvent == null) {
      if (srhRegisterEvent != null) {
        //Basically checks if the form is in edit mode
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AgywDreamsSrhRegisterForm()));
      } else {
        setState(() {
          isFormSaving = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AgywDreamsSrhRegisterForm())).then(
            (whereFrom) =>
                whereFrom == 'fromSaving' ? Navigator.pop(context) : null);
      }
    } else {
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      List<String> hiddenFields = [];
      dataObject[SRHConstant.srhToSrhRegisterLinkage] =
          dataObject[SRHConstant.srhToSrhRegisterLinkage] ?? AppUtil.getUid();
      hiddenFields.add(SRHConstant.srhToSrhRegisterLinkage);

      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          SRHConstant.program,
          SRHConstant.programStage,
          agywDream.orgUnit,
          DreamsSrhClientIntake.getFormSections(),
          dataObject,
          eventDate,
          agywDream.id,
          eventId,
          hiddenFields,
        );
        setState(() {
          isFormSaving = false;
        });

        updateFormState(context, srhRegisterEvent);
        if (srhRegisterEvent != null) {
          //Basically checks if the form is in edit mode
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AgywDreamsSrhRegisterForm()));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AgywDreamsSrhRegisterForm())).then(
              (whereFrom) =>
                  whereFrom == 'fromSaving' ? Navigator.pop(context) : null);
        }
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    Map dataObject =
        Provider.of<ServiceFormState>(context, listen: false).formState;
    bool isFormEditable =
        Provider.of<ServiceFormState>(context, listen: false).isEditableMode;
    String srhToSrhRegisterLinkage =
        dataObject[SRHConstant.srhToSrhRegisterLinkage];
    Map<String, List<Events>> eventListByProgramStage =
        Provider.of<ServiveEventDataState>(context, listen: false)
            .eventListByProgramStage;
    List<Events> srhRegisterEvents = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
            eventListByProgramStage, [SRHConstant.srhRegisterProgramStage]);

    Events srhRegisterEvent = srhRegisterEvents.firstWhere(
        (Events event) => event.dataValues.any((dataValue) =>
            dataValue['dataElement'] == SRHConstant.srhToSrhRegisterLinkage &&
            dataValue['value'] == srhToSrhRegisterLinkage),
        orElse: () => null);

    if (srhRegisterEvent != null && !isFormEditable) {
      for (Map dataValue in srhRegisterEvent.dataValues) {
        if (dataValue['dataElement'] != 'eventDate' &&
            dataValue['dataElement'] != 'eventId') {
          dataObject[dataValue['dataElement']] = dataValue['value'];
        }
      }
    }
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
          body: Container(child: Consumer<DreamBenefeciarySelectionState>(
            builder: (context, nonAgywState, child) {
              AgywDream agywDream = nonAgywState.currentAgywDream;
              return Consumer<LanguageTranslationState>(
                builder: (context, languageTranslationState, child) {
                  String currentLanguage =
                      languageTranslationState.currentLanguage;
                  return Consumer<ServiveEventDataState>(
                    builder: (context, serviceEventDataState, child) =>
                        Consumer<ServiceFormState>(
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
                                            formSections: formSections,
                                            mandatoryFieldObject: Map(),
                                            isEditableMode:
                                                serviceFormState.isEditableMode,
                                            dataObject: dataObject,
                                            onInputValueChange:
                                                onInputValueChange,
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              serviceFormState.isEditableMode,
                                          child: EntryFormSaveButton(
                                            label: isFormSaving
                                                ? currentLanguage == 'lesotho'
                                                    ? 'Saving...'
                                                    : 'Saving...'
                                                : currentLanguage == 'lesotho'
                                                    ? 'Boloka ebe u fetela pele'
                                                    : 'Save and Continue',
                                            labelColor: Colors.white,
                                            buttonColor: Color(0xFF258DCC),
                                            fontSize: 15.0,
                                            onPressButton: () => onSaveForm(
                                                context, dataObject, agywDream,
                                                srhRegisterEvent:
                                                    srhRegisterEvent),
                                          ),
                                        )
                                      ],
                                    )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          )),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }

  bool formInViewMode() {
    return !Provider.of<ServiceFormState>(context, listen: false)
        .isEditableMode;
  }
}
