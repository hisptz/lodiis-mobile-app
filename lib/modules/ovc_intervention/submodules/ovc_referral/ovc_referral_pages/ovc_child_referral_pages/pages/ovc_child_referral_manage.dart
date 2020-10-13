import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outocme_card_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_detailed_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_child_referral_pages/constants/ovc_child_referral_constant.dart';
import 'package:provider/provider.dart';

class OvcChildReferralManage extends StatefulWidget {
  OvcChildReferralManage({
    Key key,
    @required this.eventData,
    @required this.referralIndex,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;

  @override
  _OvcChildReferralManageState createState() => _OvcChildReferralManageState();
}

class _OvcChildReferralManageState extends State<OvcChildReferralManage> {
  final String label = 'Manage Child referral';

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
            child: Consumer<OvcHouseHoldCurrentSelectionState>(
              builder: (context, ovcHouseHoldCurrentSelectionState, child) {
                OvcHouseHoldChild currentOvcHouseHoldChild =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHoldChild;
                return Container(
                  child: Column(
                    children: [
                      OvcChildInfoTopHeader(),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 13.0),
                        child: Container(
                          child: MaterialCard(
                            body: Column(
                              children: [
                                ReferralDetailedCard(
                                  borderColor: Color(0xFFEDF5EC),
                                  titleColor: Color(0xFF1B3518),
                                  labelColor: Color(0XFF92A791),
                                  valueColor: Color(0XFF536852),
                                  referralIndex: widget.referralIndex,
                                  eventData: widget.eventData,
                                ),
                                ReferralOutComeCardContainer(
                                  currentEventId: widget.eventData.event,
                                  currentProgramStage:
                                      widget.eventData.programStage,
                                  beneficiary: currentOvcHouseHoldChild.teiData,
                                  referralFollowUpStage:
                                      OvcChildReferralConstant
                                          .referralFollowUpStage,
                                  referralToFollowUpLinkage:
                                      OvcChildReferralConstant
                                          .referralToFollowUpLinkage,
                                  referralProgram:
                                      OvcChildReferralConstant.program,
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
