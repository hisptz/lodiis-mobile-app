import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_view_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_modal.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dream_referral.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dream_referral_followup.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/models/dream_referral_outcome.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral_followup.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/models/ovc_referral_outcome.dart';
import 'package:provider/provider.dart';

class ReferralOutComeCard extends StatefulWidget {
  const ReferralOutComeCard({
    Key key,
    @required this.eventData,
    @required this.beneficiary,
    @required this.referralFollowUpStage,
    @required this.referralToFollowUpLinkage,
    @required this.referralProgram,
    @required this.isOvcIntervention,
    this.isEditableMode = true,
  }) : super(key: key);

  final Events eventData;
  final TrackeEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;
  final bool isEditableMode;
  final bool isOvcIntervention;

  @override
  _ReferralOutComeCardState createState() => _ReferralOutComeCardState();
}

class _ReferralOutComeCardState extends State<ReferralOutComeCard> {
  bool isFormReady = false;
  bool isreferralOutComeFilled = false;
  List<FormSection> referralOutcomeFormSections;
  List<FormSection> referralOutcomeFollowUpFormSections;
  List<String> hiddenFields = [];
  Color themeColor;

  @override
  void initState() {
    super.initState();
    hiddenFields.add(widget.referralToFollowUpLinkage);
    if (widget.isOvcIntervention) {
      themeColor = const Color(0xFF4B9F46);
      referralOutcomeFormSections = OvcReferralOutCome.getFormSections();
      hiddenFields
          .addAll(FormUtil.getFormFieldIds(OvcReferral.getFormSections()));
      referralOutcomeFollowUpFormSections =
          OvcReferralFollowUp.getFormSections();
    } else {
      themeColor = const Color(0xFF1F8ECE);
      referralOutcomeFormSections = DreamReferralOutCome.getFormSections();
      hiddenFields
          .addAll(FormUtil.getFormFieldIds(DreamAddReferral.getFormSections()));
      referralOutcomeFollowUpFormSections =
          DreamReferralFollowUp.getFormSections();
    }

    Timer(Duration(seconds: 1), () {
      isreferralOutComeFilled = getReferralOutComeStatus();
      isFormReady = true;
      setState(() {});
    });
  }

  void updateFormState(BuildContext context, Events eventData) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: true);
    for (Map datavalue in eventData.dataValues) {
      if (datavalue['value'] != '') {
        Provider.of<ServiceFormState>(context, listen: false)
            .setFormFieldState(datavalue['dataElement'], datavalue['value']);
      }
    }
  }

  void onAddReferralOutCome(BuildContext context) async {
    updateFormState(context, widget.eventData);
    Widget modal = ReferralOutcomeModal(
      themeColor: themeColor,
      eventData: widget.eventData,
      referralOutcomeFormSections: referralOutcomeFormSections,
      hiddenFields: hiddenFields,
      referralToFollowUpLinkage: widget.referralToFollowUpLinkage,
    );
    await AppUtil.showPopUpModal(context, modal, true);
  }

  bool getReferralOutComeStatus() {
    bool isreferralOutcomeFilled = false;
    List<String> inputFields =
        FormUtil.getFormFieldIds(referralOutcomeFormSections);
    for (Map dataValue in widget.eventData.dataValues) {
      String dataElement = dataValue['dataElement'];
      String value = dataValue['value'];
      if (dataElement != null &&
          inputFields.indexOf(dataElement) > -1 &&
          value != null) {
        isreferralOutcomeFilled = true;
      }
    }
    return isreferralOutcomeFilled;
  }

  @override
  Widget build(BuildContext context) {
    return !isFormReady
        ? Container(
            child: CircularProcessLoader(
              color: Colors.blueGrey,
            ),
          )
        : Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Visibility(
                    visible: isreferralOutComeFilled,
                    child: ReferralOutComeViewContainer(
                      isEditableMode: widget.isEditableMode,
                      themeColor: themeColor,
                      eventData: widget.eventData,
                      beneficiary: widget.beneficiary,
                      referralOutcomeFollowUpFormSections:
                          referralOutcomeFollowUpFormSections,
                      referralFollowUpStage: widget.referralFollowUpStage,
                      referralToFollowUpLinkage:
                          widget.referralToFollowUpLinkage,
                      referralProgram: widget.referralProgram,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.isEditableMode && !isreferralOutComeFilled,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeColor.withOpacity(0.03),
                      ),
                      child: Column(
                        children: [
                          LineSeperator(
                            color: themeColor.withOpacity(0.2),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: FlatButton(
                                  onPressed: () =>
                                      this.onAddReferralOutCome(context),
                                  child: Text(
                                    'ADD OUTCOME',
                                    style: TextStyle().copyWith(
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
            ),
          );
  }
}
