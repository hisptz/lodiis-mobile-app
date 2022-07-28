import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/referrals/beneficiary_referral_card_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dreams_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/constants/agyw_dreams_common_constant.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/constant/dreams_agyw_referral_constant.dart';
import 'package:provider/provider.dart';

class DreamsReferralManage extends StatefulWidget {
  const DreamsReferralManage({
    Key? key,
    required this.eventData,
    required this.referralIndex,
    required this.isIncomingReferral,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;
  final bool isIncomingReferral;

  @override
  _DreamsReferralManageState createState() => _DreamsReferralManageState();
}

class _DreamsReferralManageState extends State<DreamsReferralManage> {
  final String label = 'Manage Agyw Referral';

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
                  agywDream: currentDreamsAgywBeneficiary,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 13.0,
                  ),
                  child: BeneficiaryRefereralCardContainer(
                    referralIndex: widget.referralIndex,
                    titleColor: AgywDreamsCommonConstant.referralCardTitleColor,
                    labelColor: AgywDreamsCommonConstant.referralCardLabelColor,
                    valueColor: AgywDreamsCommonConstant.referralCardValueColor,
                    themeColor: AgywDreamsCommonConstant.defaultColor,
                    beneficiary:
                        currentDreamsAgywBeneficiary.trackedEntityInstanceData!,
                    enrollmentOuAccessible:
                        currentDreamsAgywBeneficiary.enrollmentOuAccessible!,
                    referralProgram: DreamsAgywReferralConstant.program,
                    referralOutcomeProgramStage:
                        DreamsAgywReferralConstant.referralOutComeStage,
                    referralOutcomeFollowingUpProgramStage:
                        DreamsAgywReferralConstant.referralFollowUpStage,
                    referralOutcomeLinkage:
                        DreamsAgywReferralConstant.referralToOutcomeLinkage,
                    referralOutcomeFollowingUplinkage:
                        DreamsAgywReferralConstant.referralToFollowUpLinkage,
                    referralEventData: widget.eventData,
                    isIncomingReferral: widget.isIncomingReferral,
                    isOnEditMode: true,
                    isOnViewOrManage: true,
                    onManage: () {},
                    onView: () {},
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
