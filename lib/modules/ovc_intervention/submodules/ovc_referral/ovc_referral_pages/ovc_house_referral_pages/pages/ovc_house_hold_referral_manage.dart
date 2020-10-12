import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/components/ovc_referral_detailed_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/components/ovc_referral_outcome_card.dart';
import 'package:provider/provider.dart';

class OvcHouseHoldReferralManage extends StatefulWidget {
  OvcHouseHoldReferralManage({
    Key key,
    @required this.eventData,
    @required this.referralIndex,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;

  @override
  _OvcHouseHoldReferralManageState createState() =>
      _OvcHouseHoldReferralManageState();
}

class _OvcHouseHoldReferralManageState
    extends State<OvcHouseHoldReferralManage> {
  final String label = 'Manage House Hold Referral';

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
                OvcHouseHold currentOvcHouseHold =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHold;
                return Container(
                  child: Column(
                    children: [
                      OvcHouseHoldInfoTopHeader(
                        currentOvcHouseHold: currentOvcHouseHold,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 13.0),
                        child: MaterialCard(
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OvcReferralDetailedCard(
                                borderColor: Color(0xFFEDF5EC),
                                titleColor: Color(0xFF1B3518),
                                labelColor: Color(0XFF92A791),
                                valueColor: Color(0XFF536852),
                                referralIndex: widget.referralIndex,
                                eventData: widget.eventData,
                              ),
                              OvcReferralOutComeCard(
                                beneficiary: currentOvcHouseHold.teiData,
                                eventData: widget.eventData,
                                referralProgramStages: [],
                              )
                            ],
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
