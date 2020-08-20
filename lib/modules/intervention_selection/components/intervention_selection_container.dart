import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/dreams_intervention.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_list.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/ovc_intervention.dart';

class InterventionSelectionContainer extends StatefulWidget {
  const InterventionSelectionContainer(
      {Key key,
      @required this.interventionPrograms,
      this.onIntervetionSelection})
      : super(key: key);

  final List<InterventionCard> interventionPrograms;
  final Function(InterventionCard) onIntervetionSelection;

  @override
  _InterventionSelectionContainerState createState() =>
      _InterventionSelectionContainerState();
}

class _InterventionSelectionContainerState
    extends State<InterventionSelectionContainer> {
  InterventionCard activeInterventionProgram;
  bool isInterventionSelected = false;

  void onSelectingInterventionProgram(InterventionCard interventionProgram) {
    widget.onIntervetionSelection(interventionProgram);
    activeInterventionProgram = interventionProgram;
    setState(() {
      isInterventionSelected = true;
    });
  }

  void onInterventionButtonClick() {
    if (activeInterventionProgram != null &&
        activeInterventionProgram.id.isNotEmpty) {
      // set current card selected and route to specific intervention
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => activeInterventionProgram.id == 'ovc'
                  ? OvcIntervention()
                  : activeInterventionProgram.id == 'dreams'
                      ? DreamsIntervention()
                      : RoutePageNotFound(
                          pageTitle:
                              '${activeInterventionProgram.name} is not found',
                          color: activeInterventionProgram.primmaryColor)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 50),
          child: Text(
            'Select Interventions',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFAFAFA)),
          ),
        ),
        Container(
          child: InterventionSelectionList(
            interventionPrograms: widget.interventionPrograms,
            onIntervetionSelection: onSelectingInterventionProgram,
          ),
        ),
        InterventionSelectionButton(
            isInterventionSelected: isInterventionSelected,
            onInterventionButtonClick: onInterventionButtonClick)
      ],
    )); //;
  }
}
