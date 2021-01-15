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
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/dreams_enrollment_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_enrollment/pages/agyw_dreams_consent.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_referral/dream_referral_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/dreams_services/dreams_services_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/none_agyw_page.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/none_agyw/pages/non_agyw_dreams_hts_consent_form.dart';
import 'package:provider/provider.dart';

class DreamsIntervention extends StatefulWidget {
  const DreamsIntervention({Key key}) : super(key: key);

  @override
  _DreamsInterventionState createState() => _DreamsInterventionState();
}

class _DreamsInterventionState extends State<DreamsIntervention> {
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

  void onAddNoneAgywBeneficiary(BuildContext context) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return NonAgywDreamsHTSConsentForm();
      },
    ));
  }

  void onAddAgywBeneficiary(BuildContext context) {
    Provider.of<EnrollmentFormState>(context, listen: false).resetFormState();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return AgywDreamsConsentForm();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<IntervetionCardState>(
        builder: (context, intervetionCardState, child) {
          InterventionCard activeInterventionProgram =
              intervetionCardState.currentIntervetionProgram;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: InterventionAppBar(
                activeInterventionProgram: activeInterventionProgram,
                onClickHome: onClickHome,
                onAddAgywBeneficiary: () => onAddAgywBeneficiary(context),
                onAddNoneAgywBeneficiary: () =>
                    onAddNoneAgywBeneficiary(context),
                onOpenMoreMenu: () =>
                    onOpenMoreMenu(context, activeInterventionProgram),
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
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: activeInterventionProgram.background),
                          ),
                          Consumer<InterventionBottomNavigationState>(
                            builder: (context,
                                interventionBottomNavigationState, child) {
                              InterventionBottomNavigation
                                  currentInterventionBottomNavigation =
                                  interventionBottomNavigationState
                                      .getCurrentInterventionBottomNavigation(
                                          activeInterventionProgram);
                              return Container(
                                child: currentInterventionBottomNavigation.id ==
                                        'services'
                                    ? DreamsServicesPage()
                                    : currentInterventionBottomNavigation.id ==
                                            'referral'
                                        ? DreamsReferralPage()
                                        : currentInterventionBottomNavigation
                                                    .id ==
                                                'enrollment'
                                            ? DreamsEnrollmentPage()
                                            : currentInterventionBottomNavigation
                                                        .id ==
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
                      ),
                    ),
            ),
            bottomNavigationBar: InterventionBottomNavigationBarContainer(),
          );
        },
      ),
    );
  }
}
