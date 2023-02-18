import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/referrals_old/referral_outcome_view_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/core/components/referrals_old/referral_outcome_modal_old.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dreams_referral.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dreams_referral_follow_up.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dreams_referral_outcome.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral_follow_up.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral_outcome.dart';
import 'package:provider/provider.dart';

class ReferralOutComeCard extends StatefulWidget {
  const ReferralOutComeCard({
    Key? key,
    required this.eventData,
    required this.beneficiary,
    required this.referralFollowUpStage,
    required this.referralToFollowUpLinkage,
    required this.referralProgram,
    required this.isOvcIntervention,
    required this.isIncomingReferral,
    this.isEditableMode = true,
    this.isHouseholdReferral = false,
  }) : super(key: key);

  final Events eventData;
  final TrackedEntityInstance? beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;
  final bool isEditableMode;
  final bool isOvcIntervention;
  final bool isHouseholdReferral;
  final bool isIncomingReferral;

  @override
  State<ReferralOutComeCard> createState() => _ReferralOutComeCardState();
}

class _ReferralOutComeCardState extends State<ReferralOutComeCard> {
  bool isFormReady = false;
  bool isReferralOutComeFilled = false;
  List<FormSection>? referralOutcomeFormSections;
  List<FormSection>? referralOutcomeFollowUpFormSections;
  List<String> referralOutcomeMandatoryFields = [];
  List<String> hiddenFields = [];
  Color? themeColor;

  @override
  void initState() {
    super.initState();
    hiddenFields.add(widget.referralToFollowUpLinkage);
    if (widget.isOvcIntervention) {
      themeColor = const Color(0xFF4B9F46);
      referralOutcomeFormSections = OvcReferralOutCome.getFormSections(
        firstDate: widget.eventData.eventDate!,
      );
      referralOutcomeMandatoryFields
          .addAll(OvcReferralOutCome.getMandatoryFields());
      hiddenFields
          .addAll(FormUtil.getFormFieldIds(OvcReferral.getFormSections()));
      referralOutcomeFollowUpFormSections = OvcReferralFollowUp.getFormSections(
        firstDate: widget.eventData.eventDate!,
      );
    } else {
      themeColor = const Color(0xFF1F8ECE);
      referralOutcomeFormSections = DreamsReferralOutCome.getFormSections(
        firstDate: widget.eventData.eventDate!,
      );
      referralOutcomeMandatoryFields
          .addAll(DreamsReferralOutCome.getMandatoryFields());
      hiddenFields
          .addAll(FormUtil.getFormFieldIds(DreamsReferral.getFormSections()));
      referralOutcomeFollowUpFormSections =
          DreamsReferralFollowUp.getFormSections(
              firstDate: widget.eventData.eventDate!);
    }

    Timer(const Duration(seconds: 1), () {
      isReferralOutComeFilled = getReferralOutComeStatus();
      isFormReady = true;
      setState(() {});
    });
  }

  void updateFormState(BuildContext context, Events eventData) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    for (Map dataValue in eventData.dataValues) {
      if (dataValue['value'] != '') {
        Provider.of<ServiceFormState>(context, listen: false)
            .setFormFieldState(dataValue['dataElement'], dataValue['value']);
      }
    }
  }

  void onAddReferralOutCome(BuildContext context) async {
    updateFormState(context, widget.eventData);
    Widget modal = ReferralOutcomeModalOld(
      themeColor: themeColor,
      eventData: widget.eventData,
      referralOutcomeFormSections: referralOutcomeFormSections,
      referralOutcomeMandatoryFields: referralOutcomeMandatoryFields,
      hiddenFields: hiddenFields,
      referralToFollowUpLinkage: widget.referralToFollowUpLinkage,
    );
    await AppUtil.showPopUpModal(context, modal, true);
  }

  bool getReferralOutComeStatus() {
    bool isReferralOutComeFilled = false;
    List<String> inputFields =
        FormUtil.getFormFieldIds(referralOutcomeFormSections!);
    for (Map dataValue in widget.eventData.dataValues) {
      String? dataElement = dataValue['dataElement'];
      String? value = dataValue['value'];
      if (dataElement != null &&
          inputFields.contains(dataElement) &&
          value != null) {
        isReferralOutComeFilled = true;
      }
    }
    return isReferralOutComeFilled;
  }

  @override
  Widget build(BuildContext context) {
    return !isFormReady
        ? const CircularProcessLoader(
            color: Colors.blueGrey,
          )
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Visibility(
                  visible: isReferralOutComeFilled,
                  child: ReferralOutComeViewContainer(
                    isEditableMode: widget.isEditableMode,
                    themeColor: themeColor,
                    eventData: widget.eventData,
                    beneficiary: widget.beneficiary,
                    referralOutcomeFollowUpFormSections:
                        referralOutcomeFollowUpFormSections,
                    referralFollowUpStage: widget.referralFollowUpStage,
                    referralToFollowUpLinkage: widget.referralToFollowUpLinkage,
                    referralProgram: widget.referralProgram,
                    onEditReferralOutCome: () => onAddReferralOutCome(context),
                  ),
                ),
              ),
              Visibility(
                visible: widget.isEditableMode &&
                    (widget.isIncomingReferral || widget.isOvcIntervention) &&
                    !isReferralOutComeFilled &&
                    widget.eventData.enrollmentOuAccessible!,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeColor!.withOpacity(0.03),
                    ),
                    child: Column(
                      children: [
                        LineSeparator(
                          color: themeColor!.withOpacity(0.2),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => onAddReferralOutCome(context),
                                child: Text(
                                  'ADD OUTCOME',
                                  style: const TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                    color: themeColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
