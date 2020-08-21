import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app-state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class InterventionBottomNavigationBar extends StatefulWidget {
  const InterventionBottomNavigationBar({
    Key key,
    @required this.activeInterventionProgram,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;

  @override
  _InterventionBottomNavigationBarState createState() =>
      _InterventionBottomNavigationBarState();
}

class _InterventionBottomNavigationBarState
    extends State<InterventionBottomNavigationBar> {
  List<InterventionBottomNavigation> interventionBottomNavigations =
      InterventionBottomNavigation.getInterventionNavigationButtons();

  @override
  Widget build(BuildContext context) {
    // state controllers
    InterventionBottomNavigationState interventionBottomNavigationState =
        Provider.of<InterventionBottomNavigationState>(context);

    // state observers
    int currentIndex = interventionBottomNavigationState
        .currentInterventionBottomNavigationIndex;
    InterventionBottomNavigation currentInterventionBottomNavigation =
        interventionBottomNavigationState.currentInterventionBottomNavigation;
    return BottomNavigationBar(
        onTap: (index) {
          interventionBottomNavigationState
              .setCuurrentInterventionBottomNavigationIndex(index);
        },
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Color(0xFF737373),
        selectedItemColor: widget.activeInterventionProgram.primmaryColor,
        currentIndex: currentIndex,
        selectedFontSize: 15.0,
        unselectedFontSize: 13.0,
        items: interventionBottomNavigations
            .map((
              InterventionBottomNavigation interventionBottomNavigation,
            ) =>
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: SvgPicture.asset(
                        interventionBottomNavigation.svgIcon,
                        color: currentInterventionBottomNavigation != null &&
                                currentInterventionBottomNavigation.id ==
                                    interventionBottomNavigation.id
                            ? widget.activeInterventionProgram.primmaryColor
                            : Color(0xFF737373),
                      ),
                    ),
                    title: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        interventionBottomNavigation.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )))
            .toList());
  }
}
