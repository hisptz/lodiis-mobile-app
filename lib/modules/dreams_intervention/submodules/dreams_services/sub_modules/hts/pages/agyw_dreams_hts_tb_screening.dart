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
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/constants/agyw_dreams_hts_tb_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/sub_modules/hts/skip_logics/agyw_dreams_hts_tb_screening_skip_logics.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

import '../../../models/dreams_service_tb_screening_form_info.dart';

class AgywDreamsHTSTBForm extends StatefulWidget {
  AgywDreamsHTSTBForm({
    Key key,
    this.htsToTBLinkageValue,
  }) : super(key: key);
  final String htsToTBLinkageValue;

  @override
  _AgywDreamsHTSTBFormState createState() => _AgywDreamsHTSTBFormState();
}

class _AgywDreamsHTSTBFormState extends State<AgywDreamsHTSTBForm> {
  final String label = 'TB Screening';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = DreamsServiceTBScreeningInfo.getFormSections();
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
        await AgywDreamsHTSTBScreeningSkipLogic.evaluateSkipLogics(
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

  void onSaveForm(
      BuildContext context, Map dataObject, AgywDream agywDream) async {
    // print(widget.htsToTBLinkageValue);
    if (dataObject.keys.length > 0) {
      setState(() {
        isSaving = true;
      });
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];

      dataObject[AgywDreamsHTSTBConstant.htsToTBLinkage] =
          widget.htsToTBLinkageValue;
      List<String> hiddenFields = [AgywDreamsHTSTBConstant.htsToTBLinkage];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            AgywDreamsHTSTBConstant.program,
            AgywDreamsHTSTBConstant.programStage,
            agywDream.orgUnit,
            formSections,
            dataObject,
            eventDate,
            agywDream.id,
            eventId,
            hiddenFields);
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
        body: Container(
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String currentLanguage = languageTranslationState.currentLanguage;
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
                                          hiddenSections:
                                              serviceFormState.hiddenSections,
                                          hiddenFields:
                                              serviceFormState.hiddenFields,
                                          formSections: formSections,
                                          mandatoryFieldObject: Map(),
                                          isEditableMode:
                                              serviceFormState.isEditableMode,
                                          dataObject:
                                              serviceFormState.formState,
                                          onInputValueChange:
                                              onInputValueChange,
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
                                            agywDream,
                                          ),
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
      bottomNavigationBar: InterventionBottomNavigationBarContainer(),
    );
  }
}
