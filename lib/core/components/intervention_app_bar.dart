import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/intervention_bottom_navigation_state/intervention_bottom_navigation_state.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class InterventionAppBar extends StatelessWidget {
  const InterventionAppBar(
      {Key key,
      @required this.activeInterventionProgram,
      this.onClickHome,
      this.onAddHouseHold,
      this.onSearch,
      this.onOpenMoreMenu})
      : super(key: key);

  final InterventionCard activeInterventionProgram;
  final VoidCallback onAddHouseHold;
  final VoidCallback onSearch;
  final VoidCallback onClickHome;
  final VoidCallback onOpenMoreMenu;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: activeInterventionProgram.primmaryColor,
        title: GestureDetector(
            onTap: this.onClickHome,
            child: Material(
                color: Colors.transparent,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 9.0, horizontal: 13.5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: activeInterventionProgram.svgIconColor)),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                activeInterventionProgram.svgIcon,
                                color: activeInterventionProgram.svgIconColor,
                                height: 19.2,
                                width: 19.2,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                activeInterventionProgram.shortName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
        actions: [
          Container(
            child: IconButton(icon: Icon(Icons.search), onPressed: onSearch),
          ),
          Consumer<InterventionBottomNavigationState>(
              builder: (context, interventionBottomNavigationState, child) {
            InterventionBottomNavigation currentInterventionBottomNavigation =
                interventionBottomNavigationState
                    .getCurrentInterventionBottomNavigation(
                        activeInterventionProgram);
            return Visibility(
                visible: currentInterventionBottomNavigation != null &&
                    currentInterventionBottomNavigation.id == 'enrollment',
                child: Container(
                  child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/add-house-hold.svg',
                      ),
                      onPressed: onAddHouseHold),
                ));
          }),
          Container(
            child: IconButton(
                icon: Icon(Icons.more_vert), onPressed: onOpenMoreMenu),
          )
        ]);
  }
}
