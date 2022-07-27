import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_separator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_card_body.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_card_button.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_card_edit_icon.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_outcome_container.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/referral_event.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class BeneficiaryRefereralCardContainer extends StatefulWidget {
  const BeneficiaryRefereralCardContainer({
    Key? key,
    required this.referralIndex,
    required this.themeColor,
    required this.titleColor,
    required this.labelColor,
    required this.valueColor,
    required this.isIncomingReferral,
    required this.referralEventData,
    required this.beneficiary,
    required this.enrollmentOuAccessible,
    required this.referralProgram,
    required this.referralOutcomeProgramStage,
    required this.referralOutcomeFollowingUpProgramStage,
    required this.referralOutcomeLinkage,
    required this.referralOutcomeFollowingUplinkage,
    this.isOvcIntervention = false,
    this.isHouseHoldReferral = false,
    this.isOnViewOrManage = false,
    this.isOnReferralManage = false,
    this.prefixReferralTitle = 'Referral',
    required this.onManage,
    required this.onView,
  }) : super(key: key);

  final Events referralEventData;
  final bool enrollmentOuAccessible;
  final TrackedEntityInstance beneficiary;
  final String referralProgram;
  final String referralOutcomeProgramStage;
  final String referralOutcomeFollowingUpProgramStage;
  final String referralOutcomeLinkage;
  final String referralOutcomeFollowingUplinkage;
  final bool isIncomingReferral;
  final bool isOnReferralManage;
  final String prefixReferralTitle;
  final Color themeColor;
  final Color titleColor;
  final Color labelColor;
  final Color valueColor;
  final int referralIndex;
  final bool isOnViewOrManage;
  final bool isHouseHoldReferral;
  final bool isOvcIntervention;

  final VoidCallback onView;
  final VoidCallback onManage;

  @override
  State<BeneficiaryRefereralCardContainer> createState() =>
      _BeneficiaryRefereralCardContainerState();
}

class _BeneficiaryRefereralCardContainerState
    extends State<BeneficiaryRefereralCardContainer> {
  bool _isLoading = true;
  late ReferralEvent referralEvent;

  @override
  void initState() {
    super.initState();
    setReferralEventDataModel();
  }

  void setReferralEventDataModel() async {
    referralEvent =
        await ReferralEvent().fromTeiModel(widget.referralEventData);
    _isLoading = false;
    Timer(const Duration(milliseconds: 100), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      child: _isLoading
          ? Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: const CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            )
          : MaterialCard(
              body: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          child: Text(
                            '${widget.prefixReferralTitle} ${widget.referralIndex}',
                            style: const TextStyle().copyWith(
                              color: widget.titleColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      BeneficiaryReferralCardEditIcon(
                        referralEvent: referralEvent,
                        referralOutcomeProgramStage:
                            widget.referralOutcomeProgramStage,
                        referralOutcomeLinkage: widget.referralOutcomeLinkage,
                        referralOutcomeFollowingUplinkage:
                            widget.referralOutcomeFollowingUplinkage,
                        isOnEditMode:
                            referralEvent.eventData!.enrollmentOuAccessible! &&
                                widget.isOnReferralManage,
                        color: widget.themeColor,
                      )
                    ],
                  ),
                  LineSeparator(
                    color: widget.themeColor.withOpacity(0.2),
                    height: 2.0,
                  ),
                  BeneficiaryRefereralCardBody(
                    referralEvent: referralEvent,
                    labelColor: widget.labelColor,
                    valueColor: widget.valueColor,
                    isIncomingReferral: widget.isIncomingReferral,
                  ),
                  Visibility(
                    visible: widget.isOnViewOrManage,
                    child: BeneficiaryRefereralOutcomeContainer(
                      enrollmentOuAccessible: widget.enrollmentOuAccessible,
                      beneficiary: widget.beneficiary,
                      referralProgram: widget.referralProgram,
                      referralOutcomeProgramStage:
                          widget.referralOutcomeProgramStage,
                      referralOutcomeFollowingUpProgramStage:
                          widget.referralOutcomeFollowingUpProgramStage,
                      referralOutcomeLinkage: widget.referralOutcomeLinkage,
                      referralOutcomeFollowingUplinkage:
                          widget.referralOutcomeFollowingUplinkage,
                      referralEvent: referralEvent,
                      labelColor: widget.themeColor,
                      valueColor: widget.valueColor,
                      isIncomingReferral: widget.isIncomingReferral,
                      isHouseholdReferral: widget.isHouseHoldReferral,
                      isOvcIntervention: widget.isOvcIntervention,
                    ),
                  ),
                  Visibility(
                    visible: !widget.isOnViewOrManage,
                    child: BeneficiaryRefereralCardButton(
                      themeColor: widget.themeColor,
                      onManage: widget.onManage,
                      onView: widget.onView,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
