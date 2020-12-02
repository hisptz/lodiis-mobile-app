import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/enrollment_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/ovc_enrollment_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_enrollment/pages/ovc_enrollment_consent_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_records/ovc_records_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/ovc_services_page.dart';
import 'package:provider/provider.dart';

class OvcIntervention extends StatefulWidget {
  const OvcIntervention({Key key}) : super(key: key);

  @override
  _OvcInterventionState createState() => _OvcInterventionState();
}

class _OvcInterventionState extends State<OvcIntervention> {
  final bool disableSelectionOfActiveIntervention = true;
  bool isViewReady = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isViewReady = true;
      });
    });
  }

  void onOpenMoreMenu(
    BuildContext context,
    InterventionCard activeInterventionProgram,
  ) async {
    AppBarUtil.onOpenMoreMenu(
      context,
      activeInterventionProgram,
      disableSelectionOfActiveIntervention,
    );
  }

  void onClickHome() {
    // print('on onClickHome');
  }

  void onAddHouseHold(BuildContext context) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return OvcEnrollmentConsetForm();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return InterventionAppBar(
                activeInterventionProgram: activeInterventionProgram,
                onClickHome: onClickHome,
                onAddHouseHold: () => onAddHouseHold(context),
                onOpenMoreMenu: () =>
                    onOpenMoreMenu(context, activeInterventionProgram),
              );
            },
          ),
        ),
        body: Container(
          child: !isViewReady
              ? Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: CircularProcessLoader(
                    color: Colors.blueGrey,
                  ),
                )
              : Container(
                  child: Consumer<IntervetionCardState>(
                      builder: (context, intervetionCardState, child) {
                    InterventionCard activeInterventionProgram =
                        intervetionCardState.currentIntervetionProgram;
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: activeInterventionProgram.background),
                        ),
                        Consumer<InterventionBottomNavigationState>(
                          builder: (context, interventionBottomNavigationState,
                              child) {
                            InterventionBottomNavigation
                                currentInterventionBottomNavigation =
                                interventionBottomNavigationState
                                    .getCurrentInterventionBottomNavigation(
                                        activeInterventionProgram);
                            return Container(
                              child: currentInterventionBottomNavigation.id ==
                                      'services'
                                  ? OvcServicesPage()
                                  : currentInterventionBottomNavigation.id ==
                                          'referral'
                                      ? OvcReferralPage()
                                      : currentInterventionBottomNavigation
                                                  .id ==
                                              'enrollment'
                                          ? OvcEnrollmentPage()
                                          : currentInterventionBottomNavigation
                                                      .id ==
                                                  'exit'
                                              ? OvcExitPage()
                                              : currentInterventionBottomNavigation
                                                          .id ==
                                                      'records'
                                                  ? OvcRecordsPage()
                                                  : RoutePageNotFound(
                                                      pageTitle:
                                                          currentInterventionBottomNavigation
                                                              .id,
                                                    ),
                            );
                          },
                        ),
                      ],
                    );
                  }),
                ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer(),
      ),
    ));
  }
}
