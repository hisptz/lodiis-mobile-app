import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/implementing_partner_referral_service_state/implementing_partner_referral_service_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/constants/service_implementing_partner.dart';
import 'package:kb_mobile_app/core/services/referral_notification_service.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/referral_event_notification.dart';
import 'package:kb_mobile_app/models/referral_notification.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/constant/dreams_agyw_referral_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dreams_referral.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/skip_logics/dreams_agyw_referral_skip_logic.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:provider/provider.dart';

class DreamsAgywAddReferralForm extends StatefulWidget {
  DreamsAgywAddReferralForm({Key key, this.currentUser}) : super(key: key);

  final CurrentUser currentUser;

  @override
  _DreamsAgywAddReferralFormState createState() =>
      _DreamsAgywAddReferralFormState();
}

class _DreamsAgywAddReferralFormState extends State<DreamsAgywAddReferralForm> {
  final String label = 'Dream Referral Form';
  final Map mandatoryFieldObject = Map();
  final List<String> mandatoryFields = DreamsReferral.getMandatoryFields();
  List unFilledMandatoryFields = [];
  List<FormSection> formSections;
  bool isFormReady = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    formSections = DreamsReferral.getFormSections();
    Timer(Duration(seconds: 1), () {
      setState(() {
        for (String id in mandatoryFields) {
          mandatoryFieldObject[id] = true;
        }
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
        await DreamsAgywReferralSkipLogic.evaluateSkipLogics(
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
    AgywDream currentAgywDream, {
    Map hiddenFieldsObject = const {},
  }) async {
    if (FormUtil.geFormFilledStatus(dataObject, formSections)) {
      bool hadAllMandatoryFilled = AppUtil.hasAllMandatoryFieldsFilled(
          mandatoryFields, dataObject,
          hiddenFields: hiddenFieldsObject);

      if (hadAllMandatoryFilled) {
        setState(() {
          isSaving = true;
        });
        String eventDate = dataObject['eventDate'];
        String eventId = dataObject['eventId'];
        dataObject.remove('village');
        dataObject.remove('phoneNumber');
        dataObject[DreamsAgywReferralConstant.referralToFollowUpLinkage] =
            dataObject[DreamsAgywReferralConstant.referralToFollowUpLinkage] ??
                AppUtil.getUid();
        List<String> hiddenFields = [
          DreamsAgywReferralConstant.referralToFollowUpLinkage
        ];
        try {
          if (eventId == null) {
            // Assign data element
            CurrentUser user = await UserService().getCurrentUser();
            dataObject[ServiceImplementingPartner()
                .implementingPartnerDataElement] = dataObject[
                    ServiceImplementingPartner()
                        .implementingPartnerDataElement] ??
                user.implementingPartner;
            eventId = AppUtil.getUid();
            String currentImplementingPartner =
                Provider.of<ReferralNotificationState>(context, listen: false)
                    .currentImplementingPartner;
            await updateReferralNotification(
              eventId,
              dataObject,
              currentAgywDream,
              currentImplementingPartner,
            );
          }
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
              DreamsAgywReferralConstant.program,
              DreamsAgywReferralConstant.programStage,
              currentAgywDream.orgUnit,
              formSections,
              dataObject,
              eventDate,
              currentAgywDream.id,
              eventId,
              hiddenFields,
              skippedFields: ['village', 'phoneNumber']);
          Provider.of<ServiceEventDataState>(context, listen: false)
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
        setState(() {
          unFilledMandatoryFields = AppUtil.getUnFilledMandatoryFields(
              mandatoryFields, dataObject,
              hiddenFields: hiddenFieldsObject);
        });
        AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP,
        );
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
    String currentImplementingPartner,
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
          fromImplementingPartner: currentImplementingPartner,
          nameSpaceKey: nameSpaceKey,
        )
      ],
    );
    await ReferralNotificationService()
        .savingReferralNotificationToOfflineDb([referralNotification]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
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
        body: Container(
          child: Consumer<LanguageTranslationState>(
            builder: (context, languageTranslationState, child) {
              String currentLanguage = languageTranslationState.currentLanguage;
              return Consumer<DreamsBeneficiarySelectionState>(
                builder:
                    (context, dreamBeneficiaryCurrentSelectionState, child) {
                  AgywDream currentAgywDream =
                      dreamBeneficiaryCurrentSelectionState.currentAgywDream;
                  return Consumer<ServiceFormState>(
                    builder: (context, serviceFormState, child) {
                      return Container(
                        child: Column(
                          children: [
                            DreamsBeneficiaryTopHeader(
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
                                            hiddenFieldsObject:
                                                serviceFormState.hiddenFields),
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
