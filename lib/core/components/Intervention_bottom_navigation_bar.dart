import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/referral_nofitication_state/referral_nofitication_state.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class InterventionBottomNavigationBar extends StatelessWidget {
  const InterventionBottomNavigationBar({
    Key key,
    @required this.activeInterventionProgram,
    @required this.currentLanguage,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;
  final String currentLanguage;

  void onTap(BuildContext context, int index, String id) {
    Provider.of<InterventionBottomNavigationState>(context, listen: false)
        .setCurrentInterventionBottomNavigationStatus(index, id);
    if (activeInterventionProgram.id == 'dreams') {
      if (id == 'incomingReferral') {
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .setReferralStatus(isIncomingReferral: true);
      } else {
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .setReferralStatus(isIncomingReferral: false);
      }
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
    return Consumer<IntervetionCardState>(
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
                if (interventionCardState.currentIntervetionProgram.id !=
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
                                ? activeInterventionProgram.primmaryColor
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
                                        activeInterventionProgram.primmaryColor,
                                    hasIndicatorValue: interventionCardState
                                            .currentIntervetionProgram.id ==
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
                                            ? "KB Prep"
                                            : interventionBottomNavigation
                                                .translatedName
                                        : isCurrentUserKbDreamPartner &&
                                                interventionBottomNavigation
                                                        .id ==
                                                    "noneAgyw"
                                            ? "KB Prep"
                                            : interventionCardState
                                                            .currentIntervetionProgram
                                                            .id !=
                                                        'dreams' &&
                                                    interventionBottomNavigation
                                                            .id ==
                                                        "referral"
                                                ? 'Referral'
                                                : interventionBottomNavigation
                                                    .name,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: currentInterventionBottomNavigation !=
                                                  null &&
                                              currentInterventionBottomNavigation
                                                      .id ==
                                                  interventionBottomNavigation
                                                      .id
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
      {Key key,
      @required this.currentInterventionBottomNavigation,
      @required this.interventionBottomNavigation,
      @required this.inactiveColor,
      @required this.hasIndicatorValue})
      : super(key: key);

  final InterventionBottomNavigation currentInterventionBottomNavigation;
  final InterventionBottomNavigation interventionBottomNavigation;
  final Color inactiveColor;
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
              interventionBottomNavigation.svgIcon,
              color: currentInterventionBottomNavigation != null &&
                      currentInterventionBottomNavigation.id ==
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
                      return Text(
                        "9+",
                        style: TextStyle().copyWith(
                          color: currentInterventionBottomNavigation != null &&
                                  currentInterventionBottomNavigation.id ==
                                      interventionBottomNavigation.id
                              ? Colors.white
                              : inactiveColor,
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
