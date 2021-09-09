import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class InterventionBottomNavigationBar extends StatelessWidget {
  const InterventionBottomNavigationBar({
    Key? key,
    required this.activeInterventionProgram,
    required this.currentLanguage,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;
  final String? currentLanguage;

  void onTap(BuildContext context, int index, String? id) {
    Provider.of<InterventionBottomNavigationState>(context, listen: false)
        .setCurrentInterventionBottomNavigationStatus(index, id);
    if (activeInterventionProgram.id == 'dreams') {
      if (id == 'incomingReferral') {
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .setReferralStatus(isIncomingReferral: true);
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .refreshAgywIncomingReferralDreamsList();
      } else if (id == 'noneAgyw') {
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .refreshNonAgywDreamsList();
      } else {
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .setReferralStatus(isIncomingReferral: false);
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .refreshAgywDreamsList();
      }
    } else if (activeInterventionProgram.id == 'ovc') {
      // Provider.of<OvcInterventionListState>(context, listen: false)
      //     .refreshOvcList();
    }
    if (Navigator.canPop(context)) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<InterventionBottomNavigation> interventionBottomNavigations =
        InterventionBottomNavigation.getInterventionNavigationButtons(
            activeInterventionProgram);
    return Consumer<InterventionCardState>(
      builder: (context, interventionCardState, child) {
        return Consumer<InterventionBottomNavigationState>(
          builder: (context, interventionBottomNavigationState, child) {
            return Consumer<CurrentUserState>(
              builder: (context, currentUserState, child) {
                bool isCurrentUserKbDreamPartner =
                    currentUserState.isCurrentUserKbDreamPartner;
                if (!currentUserState.canManageReferral) {
                  interventionBottomNavigations = interventionBottomNavigations
                      .where((nav) =>
                          nav.id != 'referral' || nav.id != 'incomingReferral')
                      .toList();
                }
                if (!currentUserState.canManageNoneAgyw) {
                  interventionBottomNavigations = interventionBottomNavigations
                      .where((nav) => nav.id != 'noneAgyw')
                      .toList();
                }
                if (interventionCardState.currentInterventionProgram.id !=
                    'dreams') {
                  interventionBottomNavigations = interventionBottomNavigations
                      .where((nav) => nav.id != 'incomingReferral')
                      .toList();
                }
                int currentIndex = interventionBottomNavigationState
                    .currentInterventionBottomNavigationIndex;
                InterventionBottomNavigation
                    currentInterventionBottomNavigation =
                    interventionBottomNavigationState
                        .getCurrentInterventionBottomNavigation(
                            activeInterventionProgram);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: interventionBottomNavigations.map((
                    InterventionBottomNavigation interventionBottomNavigation,
                  ) {
                    int index = interventionBottomNavigations
                        .indexOf(interventionBottomNavigation);
                    return Container(
                      width: MediaQuery.of(context).size.width /
                          interventionBottomNavigations.length,
                      child: InkWell(
                        onTap: () => onTap(
                            context, index, interventionBottomNavigation.id),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 5.0,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? activeInterventionProgram.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: SizedBox(
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  child: InterventionBottomNavigationIcon(
                                    currentInterventionBottomNavigation:
                                        currentInterventionBottomNavigation,
                                    interventionBottomNavigation:
                                        interventionBottomNavigation,
                                    inactiveColor:
                                        activeInterventionProgram.primaryColor,
                                    hasIndicatorValue: interventionCardState
                                            .currentInterventionProgram.id ==
                                        'dreams',
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    currentLanguage == 'lesotho' &&
                                            interventionBottomNavigation
                                                    .translatedName !=
                                                null
                                        ? isCurrentUserKbDreamPartner &&
                                                interventionBottomNavigation
                                                        .id ==
                                                    "noneAgyw"
                                            ? "KB PrEP"
                                            : interventionBottomNavigation
                                                .translatedName!
                                        : isCurrentUserKbDreamPartner &&
                                                interventionBottomNavigation
                                                        .id ==
                                                    "noneAgyw"
                                            ? "KB PrEP"
                                            : interventionCardState
                                                            .currentInterventionProgram
                                                            .id !=
                                                        'dreams' &&
                                                    interventionBottomNavigation
                                                            .id ==
                                                        "referral"
                                                ? 'Referral'
                                                : interventionBottomNavigation
                                                    .name!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: currentInterventionBottomNavigation
                                                  .id ==
                                              interventionBottomNavigation.id
                                          ? Colors.white
                                          : Color(0xFF737373),
                                    ),
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}

class InterventionBottomNavigationIcon extends StatelessWidget {
  const InterventionBottomNavigationIcon(
      {Key? key,
      required this.currentInterventionBottomNavigation,
      required this.interventionBottomNavigation,
      required this.inactiveColor,
      required this.hasIndicatorValue})
      : super(key: key);

  final InterventionBottomNavigation currentInterventionBottomNavigation;
  final InterventionBottomNavigation interventionBottomNavigation;
  final Color? inactiveColor;
  final bool hasIndicatorValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(
              vertical: 9.0,
            ),
            child: SvgPicture.asset(
              interventionBottomNavigation.svgIcon!,
              color: currentInterventionBottomNavigation.id ==
                      interventionBottomNavigation.id
                  ? Colors.white
                  : Color(0xFF737373),
            ),
          ),
          Container(
            child: Positioned(
              right: 0,
              top: 0,
              child: Visibility(
                visible: hasIndicatorValue &&
                    (interventionBottomNavigation.id == "referral" ||
                        interventionBottomNavigation.id == "incomingReferral"),
                child: Container(
                  child: Consumer<ReferralNotificationState>(
                    builder: (context, referralNotificationState, child) {
                      String incomingReferralsResolved =
                          referralNotificationState
                              .incomingReferralsResolvedIndicator;
                      String incomingReferralToResolve =
                          referralNotificationState
                              .incomingReferralToResolveIndicator;
                      return ClipOval(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.0,
                            horizontal: 5.0,
                          ),
                          color:
                              (interventionBottomNavigation.id == "referral" &&
                                          incomingReferralsResolved != "") ||
                                      (interventionBottomNavigation.id ==
                                              "incomingReferral" &&
                                          incomingReferralToResolve != "")
                                  ? inactiveColor!.withOpacity(0.5)
                                  : inactiveColor!.withOpacity(0.0),
                          child: Text(
                            interventionBottomNavigation.id == "referral"
                                ? incomingReferralsResolved
                                : incomingReferralToResolve,
                            style: TextStyle().copyWith(
                              fontWeight: FontWeight.bold,
                              color: currentInterventionBottomNavigation.id ==
                                      interventionBottomNavigation.id
                                  ? Colors.white
                                  : inactiveColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
