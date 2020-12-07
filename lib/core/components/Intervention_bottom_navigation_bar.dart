import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
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
    if (Navigator.canPop(context)) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<InterventionBottomNavigation> interventionBottomNavigations =
        InterventionBottomNavigation.getInterventionNavigationButtons(
            activeInterventionProgram);
    return Consumer<InterventionBottomNavigationState>(
      builder: (context, interventionBottomNavigationState, child) {
        return Consumer<CurrentUserState>(
          builder: (context, currentUserState, child) {
            if (!currentUserState.canManageReferral) {
              interventionBottomNavigations = interventionBottomNavigations
                  .where((nav) => nav.id != 'referral')
                  .toList();
            }
            if (!currentUserState.canManageNoneAgyw) {
              interventionBottomNavigations = interventionBottomNavigations
                  .where((nav) => nav.id != 'noneAgyw')
                  .toList();
            }
            int currentIndex = interventionBottomNavigationState
                .currentInterventionBottomNavigationIndex;
            InterventionBottomNavigation currentInterventionBottomNavigation =
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
                return InkWell(
                  onTap: () =>
                      onTap(context, index, interventionBottomNavigation.id),
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
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 9.0,
                              ),
                              child: SvgPicture.asset(
                                interventionBottomNavigation.svgIcon,
                                color: currentInterventionBottomNavigation !=
                                            null &&
                                        currentInterventionBottomNavigation
                                                .id ==
                                            interventionBottomNavigation.id
                                    ? Colors.white
                                    : Color(0xFF737373),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              currentLanguage == 'lesotho' &&
                                      interventionBottomNavigation
                                              .translatedName !=
                                          null
                                  ? interventionBottomNavigation.translatedName
                                  : interventionBottomNavigation.name,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: currentInterventionBottomNavigation !=
                                            null &&
                                        currentInterventionBottomNavigation
                                                .id ==
                                            interventionBottomNavigation.id
                                    ? Colors.white
                                    : Color(0xFF737373),
                              ),
                            ),
                          )
                        ],
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
  }
}
