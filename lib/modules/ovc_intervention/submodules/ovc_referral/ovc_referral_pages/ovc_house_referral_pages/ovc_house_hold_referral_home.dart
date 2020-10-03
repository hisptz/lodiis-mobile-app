import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_enrollment_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_top_header.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/components/ovc_referral_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/components/ovc_referral_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/constants/ovc_house_hold_referral_constant.dart';
import 'package:provider/provider.dart';
import 'pages/ovc_referral_add_house_hold_form.dart';

class OvcHouseHoldRefferalHome extends StatefulWidget {
  OvcHouseHoldRefferalHome({Key key}) : super(key: key);

  @override
  _OvcHouseHoldRefferalHomeState createState() =>
      _OvcHouseHoldRefferalHomeState();
}

class _OvcHouseHoldRefferalHomeState extends State<OvcHouseHoldRefferalHome> {
  final String label = 'House Hold Referral';

  List<String> programStageids = [OvcHouseHoldReferralConstant.referralStage];

  void onAddRefferal(BuildContext context, OvcHouseHold child) {
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OvcServiceHouseHoldAddReferralForm(ovcHouseHold: child)));
  }

  void onView(BuildContext context) {
    print('onView');
  }

  void onManage(BuildContext context) {
    print('on Manage');
  }

  final _controller = ScrollController();

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
                return Consumer<ServiveEventDataState>(
                  builder: (context, serviceFormState, child) {
                    OvcHouseHold currentOvcHouseHold =
                        ovcHouseHoldCurrentSelectionState.currentOvcHouseHold;
                    bool isLoading = serviceFormState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviceFormState.eventListByProgramStage;
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataState(
                            eventListByProgramStage, programStageids);
                    return Container(
                      child: Column(
                        children: [
                          OvcHouseHoldInfoTopHeader(
                            currentOvcHouseHold: currentOvcHouseHold,
                          ),
                          Container(
                            child: isLoading
                                ? CircularProcessLoader(
                                    color: Colors.blueGrey,
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: events.length == 0
                                            ? Text(
                                                'There is no House Hold Refferal at a moment')
                                            : ListView.builder(
                                                itemCount: events.length,
                                                scrollDirection: Axis.vertical,
                                                controller: _controller,
                                                shrinkWrap: true,
                                                itemBuilder: (
                                                  context,
                                                  int referralCardCount,
                                                ) {
                                                  Map<String, dynamic>
                                                      referralData =
                                                      (Events().toOffline(events[
                                                          referralCardCount]));
                                                  return isLoading
                                                      ? CircularProcessLoader(
                                                          color:
                                                              Colors.blueGrey)
                                                      : Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                            vertical: 5.0,
                                                            horizontal: 13.0,
                                                          ),
                                                          child: OvcReferralCard(
                                                              count:
                                                                  referralCardCount +
                                                                      1,
                                                              cardBody: OvcReferralCardBody(
                                                                  referralDetails:
                                                                      referralData),
                                                              onView: () =>
                                                                  onView(
                                                                      context),
                                                              onManage: () =>
                                                                  onManage(
                                                                      context)));
                                                }),
                                      ),
                                      OvcEnrollmentFormSaveButton(
                                          label: 'ADD REFFERAL',
                                          labelColor: Colors.white,
                                          buttonColor: Color(0xFF4B9F46),
                                          fontSize: 15.0,
                                          onPressButton: () => onAddRefferal(
                                              context, currentOvcHouseHold))
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
