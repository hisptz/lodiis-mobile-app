import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class InterventionBottomNavigationBar extends StatelessWidget {
  const InterventionBottomNavigationBar({
    Key key,
    @required this.activeInterventionProgram,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;

  @override
  Widget build(BuildContext context) {
    List<InterventionBottomNavigation> interventionBottomNavigations =
        InterventionBottomNavigation.getInterventionNavigationButtons(
            activeInterventionProgram);

    return Consumer<InterventionBottomNavigationState>(
      builder: (context, interventionBottomNavigationState, child) {
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
              onTap: () {
                Provider.of<InterventionBottomNavigationState>(context,
                        listen: false)
                    .setCurrentInterventionBottomNavigationIndex(index);
              },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                    color: currentIndex == index
                        ? activeInterventionProgram.primmaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 9),
                          child: SvgPicture.asset(
                            interventionBottomNavigation.svgIcon,
                            color: currentInterventionBottomNavigation !=
                                        null &&
                                    currentInterventionBottomNavigation.id ==
                                        interventionBottomNavigation.id
                                ? Colors.white
                                : Color(0xFF737373),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(interventionBottomNavigation.name,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: currentInterventionBottomNavigation !=
                                            null &&
                                        currentInterventionBottomNavigation
                                                .id ==
                                            interventionBottomNavigation.id
                                    ? Colors.white
                                    : Color(0xFF737373))),
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
  }
}
