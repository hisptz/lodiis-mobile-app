import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/login_form_field_seperator.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/intervention_pop_action_menu.dart';

class InterventionPopUpMenu extends StatelessWidget {
  const InterventionPopUpMenu({
    Key key,
    @required this.activeInterventionProgram,
  }) : super(key: key);

  final InterventionCard activeInterventionProgram;

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 45),
        child: Column(
          children: popUpMenus
              .map((InterventionPopActionMenu popUpMenu) => Container(
                      child: Visibility(
                    visible: popUpMenu.id != activeInterventionProgram.id,
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
                          LoginFormFieldSeperator(
                            color: Color(0xFFE0E6E0),
                            height: 1,
                          )
                        ],
                      ),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
