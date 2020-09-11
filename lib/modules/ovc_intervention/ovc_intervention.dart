import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/core/utils/app_bar_util.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/pages/ovc_enrollment_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/pages/ovc_exit_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/pages/ovc_records_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/pages/ovc_referral_page.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/pages/ovc_services_page.dart';
import 'package:provider/provider.dart';

class OvcIntervention extends StatelessWidget {
  const OvcIntervention({Key key}) : super(key: key);
  void onOpenMoreMenu(
      BuildContext context, InterventionCard activeInterventionProgram) async {
    AppBarUtil.onOpenMoreMenu(context, activeInterventionProgram);
  }

  void onClickHome() {
    print('on onClickHome');
  }

  void onSearch() {
    print('on onSearch');
  }

  void onAddHouseHold() {
    print('on onAddHouseHold');
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
                onSearch: onSearch,
                onAddHouseHold: onAddHouseHold,
                onOpenMoreMenu: () =>
                    onOpenMoreMenu(context, activeInterventionProgram),
              );
            },
          ),
        ),
        body: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
          InterventionCard activeInterventionProgram =
              intervetionCardState.currentIntervetionProgram;

          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration:
                    BoxDecoration(color: activeInterventionProgram.background),
              ),
              Consumer<InterventionBottomNavigationState>(
                builder: (context, interventionBottomNavigationState, child) {
                  InterventionBottomNavigation
                      currentInterventionBottomNavigation =
                      interventionBottomNavigationState
                          .getCurrentInterventionBottomNavigation(
                              activeInterventionProgram);
                  return Container(
                    child: currentInterventionBottomNavigation.id == 'services'
                        ? OvcServicesPage()
                        : currentInterventionBottomNavigation.id == 'referral'
                            ? OvcReferralPage()
                            : currentInterventionBottomNavigation.id ==
                                    'enrollment'
                                ? OvcEnrollmentPage()
                                : currentInterventionBottomNavigation.id ==
                                        'exit'
                                    ? OvcExitPage()
                                    : currentInterventionBottomNavigation.id ==
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
        bottomNavigationBar: InterventionBottomNavigationBarContainer(),
      ),
    ));
  }
}
