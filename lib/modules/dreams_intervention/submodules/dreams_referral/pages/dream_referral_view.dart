import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/referrals_old/referral_detailed_card.dart';
import 'package:kb_mobile_app/core/components/referrals_old/referral_outcome_card.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/constant/dreams_agyw_referral_constant.dart';
import 'package:provider/provider.dart';

class DreamsReferralView extends StatefulWidget {
  const DreamsReferralView({
    Key? key,
    required this.eventData,
    required this.referralIndex,
    required this.isIncomingReferral,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;
  final bool isIncomingReferral;

  @override
  _DreamsReferralViewState createState() => _DreamsReferralViewState();
}

class _DreamsReferralViewState extends State<DreamsReferralView> {
  final String label = 'View Agyw Referral';

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
        body: Consumer<DreamsBeneficiarySelectionState>(
          builder: (context, dreamCurrentSelectionState, child) {
            var currentDreamsAgywBeneficiary =
                dreamCurrentSelectionState.currentAgywDream!;
            return Column(
              children: [
                DreamsBeneficiaryTopHeader(
                    agywDream: currentDreamsAgywBeneficiary),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 13.0),
                  child: MaterialCard(
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReferralDetailedCard(
                          borderColor: const Color(0xFFE9F4FA),
                          titleColor: const Color(0xFF05131B),
                          labelColor: const Color(0XFF82898D),
                          valueColor: const Color(0XFF444E54),
                          isOvcIntervention: false,
                          referralIndex: widget.referralIndex,
                          eventData: widget.eventData,
                          isIncomingReferral: widget.isIncomingReferral,
                        ),
                        ReferralOutComeCard(
                          isOvcIntervention: false,
                          isIncomingReferral: widget.isIncomingReferral,
                          beneficiary: currentDreamsAgywBeneficiary
                              .trackedEntityInstanceData,
                          eventData: widget.eventData,
                          isEditableMode: false,
                          referralProgram: DreamsAgywReferralConstant.program,
                          referralFollowUpStage:
                              DreamsAgywReferralConstant.referralFollowUpStage,
                          referralToFollowUpLinkage: DreamsAgywReferralConstant
                              .referralToFollowUpLinkage,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const InterventionBottomNavigationBarContainer(),
    );
  }
}
