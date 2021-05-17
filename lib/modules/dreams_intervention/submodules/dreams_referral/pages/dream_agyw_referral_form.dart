import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/implementing_partner_referral_service_state/implementing_partner_referral_service_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/offline_db/referral_nofification/referral_nofification_offline_provider.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/referralEventNotification.dart';
import 'package:kb_mobile_app/models/referralNotification.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/constant/dream_agyw_referral_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dream_referral.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/skip_logics/dream_agyw_referral.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class DreamAgywAddReferralForm extends StatefulWidget {
  DreamAgywAddReferralForm({Key key, this.currentUser}) : super(key: key);

  final CurrentUser currentUser;

  @override
  _DreamAgywAddReferralFormState createState() =>
      _DreamAgywAddReferralFormState();
}

class _DreamAgywAddReferralFormState extends State<DreamAgywAddReferralForm> {
  final String label = 'Dream Referral Form';
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = DreamAddReferral.getFormSections();
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
        Map<String, dynamic> implementingPartnerReferralServices =
            Provider.of<ImplementingPartnerReferralServiceState>(context,
                    listen: false)
                .implementingPartnerServices;
        await DreamAgywReferralSkipLogic.evaluateSkipLogics(
            context,
            formSections,
            dataObject,
            widget.currentUser.implementingPartner ?? '',
            implementingPartnerReferralServices ?? {});
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    if (id == 'AuCryxQYmrk') {
      Provider.of<ServiceFormState>(context, listen: false)
          .removeFieldFromState('OrC9Bh2bcFz');
    } else if (id == 'LLWTHwhnch0') {
      Provider.of<ServiceFormState>(context, listen: false)
          .removeFieldFromState('rsh5Kvx6qAU');
    }
    evaluateSkipLogics();
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    AgywDream currentAgywDream,
  ) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      setState(() {
        isSaving = true;
      });
      String eventDate = dataObject['eventDate'];
      String eventId = dataObject['eventId'];
      dataObject[DreamAgywReferralConstant.referralToFollowUpLinkage] =
          dataObject[DreamAgywReferralConstant.referralToFollowUpLinkage] ??
              AppUtil.getUid();
      List<String> hiddenFields = [
        DreamAgywReferralConstant.referralToFollowUpLinkage
      ];
      try {
        if (eventId == null) {
          eventId = AppUtil.getUid();
          await updateReferralNotification(
            eventId,
            dataObject,
            currentAgywDream,
          );
        }
        await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
          DreamAgywReferralConstant.program,
          DreamAgywReferralConstant.programStage,
          currentAgywDream.orgUnit,
          formSections,
          dataObject,
          eventDate,
          currentAgywDream.id,
          eventId,
          hiddenFields,
        );
        Provider.of<ServiveEventDataState>(context, listen: false)
            .resetServiceEventDataState(currentAgywDream.id);
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
            Navigator.pop(context);
          });
        });
      } catch (error) {
        Timer(Duration(seconds: 1), () {
          setState(() {
            AppUtil.showToastMessage(
                message: error.toString(), position: ToastGravity.BOTTOM);
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

  updateReferralNotification(
    String eventId,
    Map dataObject,
    AgywDream currentAgywDream,
  ) async {
    String implementingPartner =
        dataObject[ReferralNotification.implementingPartnerFormVariable] ?? "";
    implementingPartner = implementingPartner.split("/").join("-");
    String location = dataObject[ReferralNotification.facility] ?? "";
    location = location == ""
        ? dataObject[ReferralNotification.communityCouncil] ?? ""
        : location;
    String tei = currentAgywDream.id ?? "";
    String nameSpaceKey = "${location}_$implementingPartner";
    ReferralNotification referralNotification = ReferralNotification(
      id: "${nameSpaceKey}_$tei",
      implementingPartner: implementingPartner,
      nameSpaceKey: nameSpaceKey,
      tei: tei,
      referrals: [
        ReferralEventNotification(
          id: eventId,
          tei: tei,
        )
      ],
    );
    await ReferralNotificationOfflineProvider()
        .addOrUpdateReferralNotification([referralNotification]);
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
                builder:
                    (context, dreamBeneficiaryCurrentSelectionState, child) {
                  AgywDream currentAgywDream =
                      dreamBeneficiaryCurrentSelectionState.currentAgywDream;
                  return Consumer<ServiceFormState>(
                    builder: (context, serviceFormState, child) {
                      return Container(
                        child: Column(
                          children: [
                            DreamBenefeciaryTopHeader(
                                agywDream: currentAgywDream),
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
                                          mandatoryFieldObject: Map(),
                                          isEditableMode:
                                              serviceFormState.isEditableMode,
                                          dataObject:
                                              serviceFormState.formState,
                                          onInputValueChange:
                                              onInputValueChange,
                                        ),
                                      ),
                                      EntryFormSaveButton(
                                        label: isSaving
                                            ? 'Saving ...'
                                            : currentLanguage == 'lesotho'
                                                ? 'Boloka'
                                                : 'Save',
                                        labelColor: Colors.white,
                                        buttonColor: Color(0xFF1F8ECE),
                                        fontSize: 15.0,
                                        onPressButton: () => onSaveForm(
                                          context,
                                          serviceFormState.formState,
                                          currentAgywDream,
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
