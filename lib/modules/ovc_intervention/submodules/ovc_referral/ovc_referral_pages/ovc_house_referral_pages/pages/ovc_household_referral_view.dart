import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_household_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_bottom_navigation/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_household.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_household_top_header.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_detailed_card.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/constants/ovc_household_referral_constant.dart';
import 'package:provider/provider.dart';

class OvcHouseholdReferralView extends StatefulWidget {
  OvcHouseholdReferralView({
    Key? key,
    required this.eventData,
    required this.referralIndex,
    required this.isIncommingReferral,
  }) : super(key: key);

  final Events eventData;
  final int referralIndex;
  final bool isIncommingReferral;

  @override
  _OvcHouseholdReferralViewState createState() =>
      _OvcHouseholdReferralViewState();
}

class _OvcHouseholdReferralViewState extends State<OvcHouseholdReferralView> {
  final String label = 'View Household Referral';

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
            child: Consumer<OvcHouseholdCurrentSelectionState>(
              builder: (context, ovcHouseholdCurrentSelectionState, child) {
                OvcHousehold currentOvcHousehold =
                    ovcHouseholdCurrentSelectionState.currentOvcHousehold!;
                return Container(
                  child: Column(
                    children: [
                      OvcHouseholdInfoTopHeader(
                        currentOvcHousehold: currentOvcHousehold,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 13.0),
                        child: MaterialCard(
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReferralDetailedCard(
                                borderColor: Color(0xFFEDF5EC),
                                titleColor: Color(0xFF1B3518),
                                labelColor: Color(0XFF92A791),
                                valueColor: Color(0XFF536852),
                                referralIndex: widget.referralIndex,
                                eventData: widget.eventData,
                                isIncommingReferral: widget.isIncommingReferral,
                              ),
                              ReferralOutComeCard(
                                isOvcIntervention: true,
                                beneficiary: currentOvcHousehold.teiData,
                                eventData: widget.eventData,
                                isEditableMode: false,
                                referralProgram:
                                    OvcHouseholdReferralConstant.program,
                                referralFollowUpStage:
                                    OvcHouseholdReferralConstant
                                        .referralFollowUpStage,
                                referralToFollowUpLinkage:
                                    OvcHouseholdReferralConstant
                                        .referralToFollowUpLinkage,
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
