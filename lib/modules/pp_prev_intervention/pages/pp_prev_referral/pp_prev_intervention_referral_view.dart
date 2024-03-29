import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/pp_prev_intervention_state/pp_prev_intervention_current_selection_state.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/components/pp_prev_referral/pp_prev_referral_card_container.dart';
import 'package:kb_mobile_app/modules/pp_prev_intervention/constants/pp_prev_intervention_constant.dart';
import 'package:provider/provider.dart';

class PpPrevInterventionReferralView extends StatelessWidget {
  const PpPrevInterventionReferralView({
    Key? key,
    required this.eventData,
    required this.referralIndex,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;

  final String label = 'View Pp Prev Referral';

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
      body: Consumer<InterventionCardState>(
        builder: (context, interventionCardState, child) {
          InterventionCard activeInterventionProgram =
              interventionCardState.currentInterventionProgram;
          return Consumer<PpPrevInterventionCurrentSelectionState>(
            builder: (context, pPrevBeneficiarySelectionState, child) {
              var ppPrevBeneficiary =
                  pPrevBeneficiarySelectionState.currentPpPrev;
              return Container(
                decoration: BoxDecoration(
                  color: activeInterventionProgram.background,
                ),
                child: Column(
                  children: [
                    PpPrevBeneficiaryTopHeader(
                      ppPrevBeneficiary: ppPrevBeneficiary!,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 13.0,
                      ),
                      child: PpPrevReferralCardContainer(
                        referralIndex: referralIndex,
                        titleColor:
                            PpPrevInterventionConstant.referralCardTitleColor,
                        labelColor: PpPrevInterventionConstant.labelColor,
                        valueColor:
                            PpPrevInterventionConstant.referralCardValueColor,
                        themeColor: PpPrevInterventionConstant.inputColor,
                        referralEventData: eventData,
                        referralOutcomeProgramStage: PpPrevInterventionConstant
                            .referralOutcomeProgramStage,
                        referralOutcomeLinkage:
                            PpPrevInterventionConstant.referralOutcomeLinkage,
                        beneficiary: ppPrevBeneficiary,
                        enrollmentOuAccessible:
                            ppPrevBeneficiary.enrollmentOuAccessible!,
                        referralProgram: PpPrevInterventionConstant.program,
                        canEdit: false,
                        isOnView: true,
                        onManage: () {},
                        onView: () => {},
                        onEditReferral: () {},
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
