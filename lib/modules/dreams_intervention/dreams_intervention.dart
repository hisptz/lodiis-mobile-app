import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app-state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app-state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_enrollment_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_exit_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_records_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_referral_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_services_page.dart';
import 'package:provider/provider.dart';

class DreamsIntervention extends StatelessWidget {
  const DreamsIntervention({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // state controllers
    IntervetionCardState intervetionCardState =
        Provider.of<IntervetionCardState>(context);
    InterventionBottomNavigationState interventionBottomNavigationState =
        Provider.of<InterventionBottomNavigationState>(context);

    // state observers
    InterventionCard activeInterventionProgram =
        intervetionCardState.currentIntervetionProgram;
    InterventionBottomNavigation currentInterventionBottomNavigation =
        interventionBottomNavigationState.currentInterventionBottomNavigation;

    void onClickHome() {
      print('on onClickHome');
    }

    void onSearch() {
      print('on onSearch');
    }

    void onAddHouseHold() {
      print('on onAddHouseHold');
    }

    void onOpenMoreMenu() {
      print('on onOpenMoreMenu');
    }

    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: InterventionAppBar(
            activeInterventionProgram: activeInterventionProgram,
            onClickHome: onClickHome,
            onSearch: onSearch,
            onAddHouseHold: onAddHouseHold,
            onOpenMoreMenu: onOpenMoreMenu,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration:
                  BoxDecoration(color: activeInterventionProgram.background),
            ),
            Container(
              child: currentInterventionBottomNavigation.id == 'services'
                  ? DreamsServicesPage()
                  : currentInterventionBottomNavigation.id == 'referral'
                      ? DreamsReferralPage()
                      : currentInterventionBottomNavigation.id == 'enrollment'
                          ? DreamsEnrollmentPage()
                          : currentInterventionBottomNavigation.id == 'exit'
                              ? DreamsExitPage()
                              : currentInterventionBottomNavigation.id ==
                                      'records'
                                  ? DreamsRecordsPage()
                                  : RoutePageNotFound(
                                      pageTitle:
                                          currentInterventionBottomNavigation
                                              .id,
                                    ),
            ),
          ],
        ),
        bottomNavigationBar: InterventionBottomNavigationBar(
            activeInterventionProgram: activeInterventionProgram),
      ),
    ));
  }
}
