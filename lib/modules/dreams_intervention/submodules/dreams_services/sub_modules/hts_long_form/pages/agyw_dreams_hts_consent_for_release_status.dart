import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/client_information.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/consent_for_release_of_status.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/hts_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/hts_register.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/pages/agyw_dreams_hts_tb_screening.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class AgywDreamsHTSConsentForReleaseStatus extends StatefulWidget {
  const AgywDreamsHTSConsentForReleaseStatus({Key? key}) : super(key: key);

  @override
  State<AgywDreamsHTSConsentForReleaseStatus> createState() =>
      _AgywDreamsHTSConsentForReleaseStatusState();
}

class _AgywDreamsHTSConsentForReleaseStatusState
    extends State<AgywDreamsHTSConsentForReleaseStatus> {
  final String label = 'Consent for Release of Status';
  List<FormSection>? formSections;
  late List<FormSection> htsRegisterFormSections;
  List<FormSection> htsFormSections = [];
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = ConsentForReleaseOfStatus.getFormSections();
    htsRegisterFormSections = HTSRegister.getFormSections();
    htsFormSections.addAll(formSections!);
    htsFormSections.addAll(ClientInformation.getFormSections());
    htsFormSections.addAll(HTSConsent.getFormSections());
    Timer(const Duration(seconds: 1), () {
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
      BuildContext context, Map dataObject, AgywDream? agywDream) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      setState(() {
        isSaving = true;
      });
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      dataObject[AgywDreamsHTSLongFormConstant.htsToIndexLinkage] =
          dataObject[AgywDreamsHTSLongFormConstant.htsToIndexLinkage] ??
              AppUtil.getUid();
      String htsToTBLinkageValue =
          dataObject[AgywDreamsHTSLongFormConstant.htsToTBLinkage] ??
              AppUtil.getUid();
      dataObject[AgywDreamsHTSLongFormConstant.htsToTBLinkage] =
          htsToTBLinkageValue;
      String htsToHtsRegister =
          dataObject[AgywDreamsHTSLongFormConstant.htsToHtsRegisterLinkage] ??
              AppUtil.getUid();
      dataObject[AgywDreamsHTSLongFormConstant.htsToHtsRegisterLinkage] =
          htsToHtsRegister;
      List<String> hiddenFields = [
        AgywDreamsHTSLongFormConstant.htsToIndexLinkage,
        AgywDreamsHTSLongFormConstant.htsToTBLinkage,
        AgywDreamsHTSLongFormConstant.htsToHtsRegisterLinkage
      ];
      String orgUnit = dataObject['location'] ?? agywDream!.orgUnit;
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          AgywDreamsHTSLongFormConstant.program,
          AgywDreamsHTSLongFormConstant.programStage,
          orgUnit,
          htsFormSections,
          dataObject,
          eventDate,
          agywDream!.id,
          eventId,
          hiddenFields,
          skippedFields: [AgywDreamsHTSLongFormConstant.bmiKey],
        );
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          AgywDreamsHTSLongFormConstant.program,
          AgywDreamsHTSLongFormConstant.htsRegisterProgramStage,
          orgUnit,
          htsRegisterFormSections,
          dataObject,
          eventDate,
          agywDream.id,
          eventId,
          hiddenFields,
          skippedFields: [AgywDreamsHTSLongFormConstant.bmiKey],
        );
        if (dataObject[AgywDreamsHTSLongFormConstant.hivResultStatus] ==
            'Positive') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgywDreamsHTSTBForm(
                htsToTBLinkageValue:
                    dataObject[AgywDreamsHTSLongFormConstant.htsToTBLinkage],
              ),
            ),
          );
        } else {
          Provider.of<ServiceEventDataState>(context, listen: false)
              .resetServiceEventDataState(agywDream.id);
          Timer(const Duration(seconds: 1), () {
            setState(() {
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
            });
          });
        }
      } catch (e) {
        Timer(const Duration(seconds: 1), () {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            builder: (context, languageState, child) =>
                Consumer<DreamsBeneficiarySelectionState>(
              builder: (context, nonAgywState, child) {
                AgywDream? agywDream = nonAgywState.currentAgywDream;
                return Consumer<ServiceFormState>(
                  builder: (context, serviceFormState, child) {
                    return Column(
                      children: [
                        DreamsBeneficiaryTopHeader(
                          agywDream: agywDream,
                        ),
                        !isFormReady
                            ? const CircularProcessLoader(
                                color: Colors.blueGrey,
                              )
                            : Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 10.0,
                                      left: 13.0,
                                      right: 13.0,
                                    ),
                                    child: EntryFormContainer(
                                      formSections: formSections,
                                      mandatoryFieldObject: const {},
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
                                          ? languageState.isSesothoLanguage
                                              ? 'E ntse e boloka'
                                              : 'Saving ...'
                                          : 'Save and Continue',
                                      labelColor: Colors.white,
                                      buttonColor: const Color(0xFF258DCC),
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
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: const InterventionBottomNavigationBarContainer());
  }
}
