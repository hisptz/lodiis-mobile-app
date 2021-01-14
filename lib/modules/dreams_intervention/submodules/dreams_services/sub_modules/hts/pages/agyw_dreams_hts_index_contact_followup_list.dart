import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/bio_data_information_about_elicited_sexual_partners.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dream_htc_add_follow_up_confirmation.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_contact_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/components/dreams_hts_index_contact_followup_list_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dream_hts_follow_up.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/models/index_contact_followup_model.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/models/index_contact_model.dart';
import 'package:provider/provider.dart';

import 'agyw_dreams_index_contact_followup.dart';

class AgywDreamsIndexFollowUpList extends StatefulWidget {
  AgywDreamsIndexFollowUpList(
      {Key key, this.indexContactEvent, this.indexInfoEvent})
      : super(key: key);
  final IndexContactModel indexContactEvent;
  final AgywDreamsIndexInfoEvent indexInfoEvent;

  @override
  _AgywDreamsIndexFollowUpListState createState() =>
      _AgywDreamsIndexFollowUpListState();
}

class _AgywDreamsIndexFollowUpListState
    extends State<AgywDreamsIndexFollowUpList> {
  final String label = 'HTS Index Follow Up';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      formSections =
          BioDataInformationAboutElicitedSexualPartners.getFormSections();
      setState(() {
        isFormReady = true;
      });
    });
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
  }

  void updateFormState(
    BuildContext context,
    bool isEditableMode,
    IndexContactModel eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.date);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.id);
      for (Map datavalue in eventData.dataValues) {
        if (datavalue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(datavalue['dataElement'], datavalue['value']);
        }
      }
    }
  }

  void onSaveForm(
      BuildContext context, Map dataObject, AgywDream agywDream) async {
    if (dataObject.keys.length > 0) {
      setState(() {
        isSaving = true;
      });
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      List<String> hiddenFields = [
        AgywDreamsHTSFOLLOWUPConstant.indexContactToElicitedPartnerLinkage
      ];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          AgywDreamsHTSFOLLOWUPConstant.program,
          AgywDreamsHTSFOLLOWUPConstant.programStage,
          agywDream.orgUnit,
          formSections,
          dataObject,
          eventDate,
          agywDream.id,
          eventId,
          hiddenFields,
        );
        Provider.of<ServiveEventDataState>(context, listen: false)
            .resetServiceEventDataState(agywDream.id);
        Timer(Duration(seconds: 1), () async {
          setState(() {});
          String currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          Widget modal = AddFollowUpConfirmation(name: "name");
          bool response = await AppUtil.showPopUpModal(context, modal, false);
          if (response) {
          } else {
            Navigator.pop(context);
          }
        });
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

  void onAddFollowUp() {
    updateFormState(context, true, null);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
        AgywDreamsHTSFOLLOWUPConstant.indexContactToElicitedPartnerLinkage,
        widget.indexContactEvent.indexContactToElicitedPartnerLinkage);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AgywDreamsIndexFollowUp(),
        ));
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
                builder: (context, dreamBeneficiarySelectionState, child) {
                  return Consumer<ServiveEventDataState>(
                    builder: (context, serviceFormState, child) {
                      AgywDream agywDream =
                          dreamBeneficiarySelectionState.currentAgywDream;
                      bool isLoading = serviceFormState.isLoading;
                      Map<String, List<Events>> eventListByProgramStage =
                          serviceFormState.eventListByProgramStage;
                      List<Events> indexContactFollowUpEvents =
                          TrackedEntityInstanceUtil
                              .getAllEventListFromServiceDataState(
                                  eventListByProgramStage,
                                  [AgywDreamsHTSFOLLOWUPConstant.programStage]);

                      List<IndexContactFollowUpModel> followUpList =
                          indexContactFollowUpEvents
                              .map((e) =>
                                  IndexContactFollowUpModel().fromTeiModel(e))
                              .toList()
                              .where((element) =>
                                  element
                                      .indexContactToElicitedPartnerLinkage ==
                                  widget.indexContactEvent
                                      .indexContactToElicitedPartnerLinkage)
                              .toList();

                      int eventNo = followUpList.length + 1;
                      return Column(
                        children: [
                          DreamBenefeciaryTopHeader(
                            agywDream: agywDream,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DreamsHTSIndexContactCard(
                              event: widget.indexContactEvent,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 13.0,
                            ),
                            child: Column(
                              children: followUpList.map(
                                  (IndexContactFollowUpModel
                                      indexContactFollowUp) {
                                eventNo--;
                                return DreamsHTSIndexContactFollowUpListCard(
                                  indexContactFollowUpModel:
                                      indexContactFollowUp,
                                  followUpNo: eventNo,
                                  isEditable: indexContactFollowUp == followUpList.first,
                                );
                              }).toList(),
                            ),
                          ),
                          EntryFormSaveButton(
                              label: 'ADD FOLLOW UP',
                              labelColor: Colors.white,
                              buttonColor: Color(0xFF1F8ECE),
                              fontSize: 15.0,
                              onPressButton: onAddFollowUp)
                        ],
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
