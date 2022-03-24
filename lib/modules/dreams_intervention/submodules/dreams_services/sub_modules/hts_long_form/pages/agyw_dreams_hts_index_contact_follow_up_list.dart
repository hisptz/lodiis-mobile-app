import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/agyw_dreams_index_info_event.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/models/bio_data_information_about_elicited_sexual_partners.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_add_follow_up_confirmation.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_contact_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/components/dreams_hts_index_contact_follow_up_list_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/constants/agyw_dreams_hts_follow_up_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact_follow_up.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts_long_form/models/index_contact.dart';
import 'package:provider/provider.dart';

import 'agyw_dreams_index_contact_followup.dart';

class AgywDreamsHTSIndexFollowUpList extends StatefulWidget {
  const AgywDreamsHTSIndexFollowUpList(
      {Key? key, this.indexContactEvent, this.indexInfoEvent})
      : super(key: key);
  final IndexContact? indexContactEvent;
  final AgywDreamsIndexInfoEvent? indexInfoEvent;

  @override
  _AgywDreamsHTSIndexFollowUpListState createState() =>
      _AgywDreamsHTSIndexFollowUpListState();
}

class _AgywDreamsHTSIndexFollowUpListState
    extends State<AgywDreamsHTSIndexFollowUpList> {
  final String label = 'HTS Index Follow Up';
  List<FormSection>? formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
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
    IndexContact? eventData,
  ) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (eventData != null) {
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventDate', eventData.date);
      Provider.of<ServiceFormState>(context, listen: false)
          .setFormFieldState('eventId', eventData.id);
      for (Map dataValue in eventData.dataValues) {
        if (dataValue['value'] != '') {
          Provider.of<ServiceFormState>(context, listen: false)
              .setFormFieldState(dataValue['dataElement'], dataValue['value']);
        }
      }
    }
  }

  void onSaveForm(
      BuildContext context, Map dataObject, AgywDream agywDream) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      setState(() {
        isSaving = true;
      });
      String? eventDate = dataObject['eventDate'];
      String? eventId = dataObject['eventId'];
      List<String> hiddenFields = [
        AgywDreamsHTSFollowUpConstant.indexContactToElicitedPartnerLinkage
      ];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          AgywDreamsHTSFollowUpConstant.program,
          AgywDreamsHTSFollowUpConstant.programStage,
          agywDream.orgUnit,
          formSections!,
          dataObject,
          eventDate,
          agywDream.id,
          eventId,
          hiddenFields,
        );
        Provider.of<ServiceEventDataState>(context, listen: false)
            .resetServiceEventDataState(agywDream.id);
        Timer(const Duration(seconds: 1), () async {
          setState(() {});
          String? currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
                  .currentLanguage;
          AppUtil.showToastMessage(
            message: currentLanguage == 'lesotho'
                ? 'Fomo e bolokeile'
                : 'Form has been saved successfully',
            position: ToastGravity.TOP,
          );
          Widget modal = const DreamsHTSAddFollowUpConfirmation(name: "name");
          bool response = await AppUtil.showPopUpModal(context, modal, false);
          if (response) {
          } else {
            Navigator.pop(context);
          }
        });
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
        position: ToastGravity.TOP,
      );
    }
  }

  void onAddFollowUp() {
    updateFormState(context, true, null);
    Provider.of<ServiceFormState>(context, listen: false).setFormFieldState(
        AgywDreamsHTSFollowUpConstant.indexContactToElicitedPartnerLinkage,
        widget.indexContactEvent!.indexContactToElicitedPartnerLinkage);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgywDreamsIndexFollowUp(),
      ),
    );
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
          builder: (context, languageTranslationState, child) {
            return Consumer<DreamsBeneficiarySelectionState>(
              builder: (context, dreamBeneficiarySelectionState, child) {
                return Consumer<ServiceEventDataState>(
                  builder: (context, serviceEventDataState, child) {
                    AgywDream? agywDream =
                        dreamBeneficiarySelectionState.currentAgywDream;
                    Map<String?, List<Events>> eventListByProgramStage =
                        serviceEventDataState.eventListByProgramStage;
                    List<Events> indexContactFollowUpEvents =
                        TrackedEntityInstanceUtil
                            .getAllEventListFromServiceDataStateByProgramStages(
                                eventListByProgramStage,
                                [AgywDreamsHTSFollowUpConstant.programStage]);
                    List<IndexContactFollowUp> followUpList =
                        indexContactFollowUpEvents
                            .map((e) => IndexContactFollowUp().fromTeiModel(e))
                            .toList()
                            .where((element) =>
                                element.indexContactToElicitedPartnerLinkage ==
                                widget.indexContactEvent!
                                    .indexContactToElicitedPartnerLinkage)
                            .toList();

                    int eventNo = followUpList.length + 1;
                    return Column(
                      children: [
                        DreamsBeneficiaryTopHeader(
                          agywDream: agywDream,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DreamsHTSIndexContactCard(
                            event: widget.indexContactEvent,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 13.0,
                          ),
                          child: Column(
                            children: followUpList.map((
                              IndexContactFollowUp indexContactFollowUp,
                            ) {
                              eventNo--;
                              return DreamsHTSIndexContactFollowUpListCard(
                                indexContactFollowUpModel: indexContactFollowUp,
                                followUpNo: eventNo,
                                isEditable:
                                    indexContactFollowUp == followUpList.first,
                              );
                            }).toList(),
                          ),
                        ),
                        EntryFormSaveButton(
                          label: 'ADD FOLLOW UP',
                          labelColor: Colors.white,
                          buttonColor: const Color(0xFF1F8ECE),
                          fontSize: 15.0,
                          onPressButton: onAddFollowUp,
                        )
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
