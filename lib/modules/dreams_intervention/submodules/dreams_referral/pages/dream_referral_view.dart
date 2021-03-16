import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_detailed_card.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_card.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/constant/dream_agyw_referral_constant.dart';
import 'package:provider/provider.dart';

class DreamReferralView extends StatefulWidget {
  DreamReferralView({
    Key key,
    @required this.eventData,
    @required this.referralIndex,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;

  @override
  _DreamReferralViewState createState() => _DreamReferralViewState();
}

class _DreamReferralViewState extends State<DreamReferralView> {
  final String label = 'View Agyw Referral';

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
            child: Consumer<DreamBenefeciarySelectionState>(
              builder: (context, dreamCurrentSelectionState, child) {
                var currentDreamAgywBeneficiary =
                    dreamCurrentSelectionState.currentAgywDream;
                return Container(
                  child: Column(
                    children: [
                      DreamBenefeciaryTopHeader(
                          agywDream: currentDreamAgywBeneficiary),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 13.0),
                        child: Container(
                          child: MaterialCard(
                            body: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReferralDetailedCard(
                                  borderColor: Color(0xFFE9F4FA),
                                  titleColor: Color(0xFF05131B),
                                  labelColor: Color(0XFF82898D),
                                  valueColor: Color(0XFF444E54),
                                  isOvcIntervention: false,
                                  referralIndex: widget.referralIndex,
                                  eventData: widget.eventData,
                                ),
                                ReferralOutComeCard(
                                  isOvcIntervention: false,
                                  beneficiary: currentDreamAgywBeneficiary
                                      .trackeEntityInstanceData,
                                  eventData: widget.eventData,
                                  isEditableMode: false,
                                  referralProgram:
                                      DreamAgywReferralConstant.program,
                                  referralFollowUpStage:
                                      DreamAgywReferralConstant
                                          .referralFollowUpStage,
                                  referralToFollowUpLinkage:
                                      DreamAgywReferralConstant
                                          .referralToFollowUpLinkage,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
