import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app-state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app-state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/core/components/intervention_pop_up_menu.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_enrollment_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_exit_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_referral_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/dreams_services_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/pages/none_agyw_page.dart';
import 'package:kb_mobile_app/modules/login/login.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/ovc_intervention.dart';
import 'package:provider/provider.dart';

class DreamsIntervention extends StatelessWidget {
  const DreamsIntervention({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // state controllers
    IntervetionCardState intervetionCardState =
        Provider.of<IntervetionCardState>(context, listen: false);
    InterventionBottomNavigationState interventionBottomNavigationState =
        Provider.of<InterventionBottomNavigationState>(context, listen: false);

    void onLogOut() async {
      await UserService().logout();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }

    void onSwitchToOvc(String id) {
      intervetionCardState.setCurrentInterventionProgramId(id);
      interventionBottomNavigationState
          .setCurrentInterventionBottomNavigationIndex(0);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OvcIntervention()));
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

    void onOpenMoreMenu(InterventionCard activeInterventionProgram) async {
      var modal = InterventionPopUpMenu(
          activeInterventionProgram: activeInterventionProgram);
      var response = await AppUtil.showPopUpModal(context, modal);
      if (response != null) {
        if (response.id == 'ovc') {
          onSwitchToOvc(response.id);
        } else if (response.id == 'logout') {
          onLogOut();
        }
      }
    }

    return SafeArea(
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
                onOpenMoreMenu: () => onOpenMoreMenu(activeInterventionProgram),
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
                        ? DreamsServicesPage()
                        : currentInterventionBottomNavigation.id == 'referral'
                            ? DreamsReferralPage()
                            : currentInterventionBottomNavigation.id ==
                                    'enrollment'
                                ? DreamsEnrollmentPage()
                                : currentInterventionBottomNavigation.id ==
                                        'exit'
                                    ? DreamsExitPage()
                                    : currentInterventionBottomNavigation.id ==
                                            'noneAgyw'
                                        ? NoneAgyw()
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
        bottomNavigationBar: Consumer<IntervetionCardState>(
          builder: (context, value, child) {
            InterventionCard activeInterventionProgram =
                intervetionCardState.currentIntervetionProgram;
            return InterventionBottomNavigationBar(
                activeInterventionProgram: activeInterventionProgram);
          },
        ),
      ),
    );
  }
}
