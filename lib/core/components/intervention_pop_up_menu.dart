import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/intervention_pop_action_menu.dart';

class InterventionPopUpMenu extends StatelessWidget {
  const InterventionPopUpMenu({
    Key key,
    @required this.activeInterventionProgram,
    @required this.disableSelectionOfActiveIntervention,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;
  final bool disableSelectionOfActiveIntervention;

  @override
  Widget build(BuildContext context) {
    List<InterventionPopActionMenu> popUpMenus =
        InterventionPopActionMenu.getDefaultInterventionPopActionMenus();
    List<InterventionCard> interventionPrograms =
        InterventionCard.getInterventions();

    popUpMenus.addAll(interventionPrograms.map((interventionProgram) {
      return new InterventionPopActionMenu(
          id: interventionProgram.id,
          name: 'Switch to ${interventionProgram.shortName}',
          color: interventionProgram.primmaryColor,
          fontWeight: FontWeight.bold);
    }));
    return Container(
      padding: EdgeInsets.only(
        left: 45,
        right: 45,
        bottom: 20,
      ),
      child: Column(
        children: popUpMenus
            .map((InterventionPopActionMenu popUpMenu) => Container(
                    child: Visibility(
                  visible: popUpMenu.id != activeInterventionProgram.id ||
                      !disableSelectionOfActiveIntervention,
                  child: GestureDetector(
                    onTap: () => {Navigator.pop(context, popUpMenu)},
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                popUpMenu.name,
                                style: TextStyle(
                                    color: popUpMenu.color,
                                    fontSize: 14.0,
                                    fontWeight: popUpMenu.fontWeight),
                              ),
                            )
                          ],
                        ),
                        LineSeperator(
                          color: Color(0xFFE0E6E0),
                          height: 1,
                        )
                      ],
                    ),
                  ),
                )))
            .toList(),
      ),
    );
  }
}
