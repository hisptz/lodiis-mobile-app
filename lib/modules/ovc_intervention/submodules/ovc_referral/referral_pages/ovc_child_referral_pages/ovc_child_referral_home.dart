import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/referral_pages/ovc_child_referral_pages/ovc_referral_add_child_form.dart';
import 'package:provider/provider.dart';

class OvcChildReferralHome extends StatefulWidget {
  OvcChildReferralHome({Key key}) : super(key: key);

  @override
  _OvcChildReferralHomeState createState() => _OvcChildReferralHomeState();
}

class _OvcChildReferralHomeState extends State<OvcChildReferralHome> {
  final String label = 'Child Referral';

  void onAddRefferal(BuildContext context, OvcHouseHoldChild child) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OvcServiceChildAddReferralForm(ovcHouseHoldChild: child)));
  }

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
                var currentOvcHouseHoldChild =
                    ovcHouseHoldCurrentSelectionState.currentOvcHouseHoldChild;
                return Container(
                  child: Column(
                    children: [
                      OvcChildInfoTopHeader(),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 13.0),
                        child:
                            Text('List ${currentOvcHouseHoldChild.toString()}'),
                      ),
                      OvcEnrollmentFormSaveButton(
                          label: 'ADD REFFERAL',
                          labelColor: Colors.white,
                          buttonColor: Color(0xFF4B9F46),
                          fontSize: 15.0,
                          onPressButton: () =>
                              onAddRefferal(context, currentOvcHouseHoldChild))
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
