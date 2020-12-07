import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
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
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/constants/ovc_child_referral_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/skip_logics/ovc_child_referral.dart';
import 'package:provider/provider.dart';

class OvcChildReferralAddForm extends StatefulWidget {
  OvcChildReferralAddForm({Key key}) : super(key: key);

  @override
  _OvcChildReferralAddFormState createState() =>
      _OvcChildReferralAddFormState();
}

class _OvcChildReferralAddFormState extends State<OvcChildReferralAddForm> {
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = OvcReferral.getFormSections();
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
        await OvcChildReferralSkipLogic.evaluateSkipLogics(
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
    BuildContext context,
    Map dataObject,
    OvcHouseHoldChild currentOvcHouseHoldChild,
  ) async {
    if (dataObject.keys.length > 0) {
      setState(() {
        isSaving = true;
      });
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      dataObject[OvcChildReferralConstant.referralToFollowUpLinkage] =
          dataObject[OvcChildReferralConstant.referralToFollowUpLinkage] ??
              AppUtil.getUid();
      List<String> hiddenFields = [
        OvcChildReferralConstant.referralToFollowUpLinkage
      ];
      try {
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          OvcChildReferralConstant.program,
          OvcChildReferralConstant.referralStage,
          currentOvcHouseHoldChild.orgUnit,
          formSections,
          dataObject,
          eventDate,
          currentOvcHouseHoldChild.id,
          eventId,
          hiddenFields,
        );
        Provider.of<ServiveEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentOvcHouseHoldChild.id);
        Timer(Duration(seconds: 1), () {
          setState(() {
            isSaving = false;
          });
          String currentLanguage =
              Provider.of<LanguageTranslationState>(context, listen: false)
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
              message: e.toString(),
              position: ToastGravity.BOTTOM,
            );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Consumer<LanguageTranslationState>(
          builder: (context, languageTranslationState, child) {
            String currentLanguage = languageTranslationState.currentLanguage;
            return Consumer<IntervetionCardState>(
              builder: (context, intervetionCardState, child) {
                InterventionCard activeInterventionProgram =
                    intervetionCardState.currentIntervetionProgram;
                return SubPageAppBar(
                  label: currentLanguage == 'lesotho'
                      ? 'Fomo ea Referral ea ngoana'
                      : 'Child Referral Form',
                  activeInterventionProgram: activeInterventionProgram,
                );
              },
            );
          },
        ),
      ),
      body: SubPageBody(
        body: Container(
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String currentLanguage = languageTranslationState.currentLanguage;
              return Consumer<OvcHouseHoldCurrentSelectionState>(
                builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                  OvcHouseHoldChild currentOvcHouseHoldChild =
                      ovcHouseHoldCurrentSelectionState
                          .currentOvcHouseHoldChild;
                  return Consumer<ServiceFormState>(
                    builder: (context, serviceFormState, child) {
                      return Container(
                        child: Column(
                          children: [
                            OvcChildInfoTopHeader(),
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
                                          dataObject:
                                              serviceFormState.formState,
                                          onInputValueChange:
                                              onInputValueChange,
                                        ),
                                      ),
                                      OvcEnrollmentFormSaveButton(
                                        label: isSaving
                                            ? 'Saving ...'
                                            : currentLanguage == 'lesotho'
                                                ? 'Boloka'
                                                : 'Save',
                                        labelColor: Colors.white,
                                        buttonColor: Color(0xFF4B9F46),
                                        fontSize: 15.0,
                                        onPressButton: () => onSaveForm(
                                          context,
                                          serviceFormState.formState,
                                          currentOvcHouseHoldChild,
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
