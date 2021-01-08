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
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/consent_for_release_of_status.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/hts_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dreams_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/pages/agyw_dreams_hts_tb_screening.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsHTSConsentForReleaseStatus extends StatefulWidget {
  AgywDreamsHTSConsentForReleaseStatus({Key key}) : super(key: key);

  @override
  _AgywDreamsHTSConsentForReleaseStatusState createState() =>
      _AgywDreamsHTSConsentForReleaseStatusState();
}

class _AgywDreamsHTSConsentForReleaseStatusState
    extends State<AgywDreamsHTSConsentForReleaseStatus> {
  final String label = 'Consent for Release of Status';
  List<FormSection> formSections;
  List<FormSection> allFormSections = [];
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = ConsentForReleaseOfStatus.getFormSections();
    allFormSections.addAll(formSections);
    allFormSections.addAll(HTSRegister.getFormSections());
    allFormSections.addAll(ClientInformation.getFormSections());
    allFormSections.addAll(HTSConsent.getFormSections());
    Timer(Duration(seconds: 1), () {
      setState(() {
        isFormReady = true;
      });
    });
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  void onSaveForm(
      BuildContext context, Map dataObject, AgywDream agywDream) async {
    if (dataObject.keys.length > 0) {
      setState(() {
        isSaving = true;
      });
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      dataObject[AgywDreamsHTSConstant.htsToIndexLinkage] =
          dataObject[AgywDreamsHTSConstant.htsToIndexLinkage] ??
              AppUtil.getUid();
      String htsToTBLinkageValue =
          dataObject[AgywDreamsHTSConstant.htsToTBLinkage] ?? AppUtil.getUid();
      dataObject[AgywDreamsHTSConstant.htsToTBLinkage] = htsToTBLinkageValue;
      List<String> hiddenFields = [
        AgywDreamsHTSConstant.htsToIndexLinkage,
        AgywDreamsHTSConstant.htsToTBLinkage
      ];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          AgywDreamsHTSConstant.program,
          AgywDreamsHTSConstant.programStage,
          agywDream.orgUnit,
          allFormSections,
          dataObject,
          eventDate,
          agywDream.id,
          eventId,
          hiddenFields,
          skippedFields: [AgywDreamsHTSConstant.bmiKey],
        );
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          AgywDreamsHTSConstant.program,
          AgywDreamsHTSConstant.htsRegisterProgramStage,
          agywDream.orgUnit,
          allFormSections,
          dataObject,
          eventDate,
          agywDream.id,
          eventId,
          hiddenFields,
          skippedFields: [AgywDreamsHTSConstant.bmiKey],
        );
        if (dataObject[AgywDreamsHTSConstant.hivResultStatus] == 'Positive') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AgywDreamsHTSTBForm(
                      htsToTBLinkageValue:
                          dataObject[AgywDreamsHTSConstant.htsToTBLinkage])));
        } else {
          Provider.of<ServiveEventDataState>(context, listen: false)
              .resetServiceEventDataState(agywDream.id);
          Timer(Duration(seconds: 1), () {
            setState(() {
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
        }
      } catch (e) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
                message: e.toString(), position: ToastGravity.BOTTOM);
          });
        });
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least one form field',
          position: ToastGravity.TOP);
      Navigator.pop(context);
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
          body: Container(child: Consumer<DreamBenefeciarySelectionState>(
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
                                      formSections: formSections,
                                      mandatoryFieldObject: Map(),
                                      isEditableMode:
                                          serviceFormState.isEditableMode,
                                      dataObject: serviceFormState.formState,
                                      onInputValueChange: onInputValueChange,
                                    ),
                                  ),
                                  Visibility(
                                    visible: serviceFormState.isEditableMode,
                                    child: EntryFormSaveButton(
                                      label: isSaving
                                          ? 'Saving ...'
                                          : 'Save and Continue',
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
          )),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
