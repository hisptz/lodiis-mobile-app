import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/dreams_intervention.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_list.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/ovc_intervention.dart';
import 'package:provider/provider.dart';

class InterventionSelectionContainer extends StatefulWidget {
  const InterventionSelectionContainer({
    Key key,
    @required this.interventionPrograms,
    @required this.onIntervetionSelection,
    @required this.numberOfDreamsBeneficiaries,
    @required this.numberOfHouseHolds,
    @required this.numberOfOvcs,
  }) : super(key: key);

  final List<InterventionCard> interventionPrograms;
  final Function(InterventionCard) onIntervetionSelection;
  final int numberOfDreamsBeneficiaries;
  final int numberOfHouseHolds;
  final int numberOfOvcs;

  @override
  _InterventionSelectionContainerState createState() =>
      _InterventionSelectionContainerState();
}

class _InterventionSelectionContainerState
    extends State<InterventionSelectionContainer> {
  bool isInterventionSelected = false;
  InterventionCard activeInterventionProgram;

  void onSelectingInterventionProgram(
      InterventionCard currentInterventionProgram) {
    widget.onIntervetionSelection(currentInterventionProgram);
    activeInterventionProgram = currentInterventionProgram;
    setState(() {
      isInterventionSelected = true;
    });
  }

  void onInterventionButtonClick() {
    if (activeInterventionProgram != null &&
        activeInterventionProgram.id.isNotEmpty) {
      Navigator.pushReplacement(
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
    IntervetionCardState intervetionCardState =
        Provider.of<IntervetionCardState>(context, listen: false);

    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 50),
            child: Text(
              'Select Interventions ',
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
              numberOfDreamsBeneficiaries: widget.numberOfDreamsBeneficiaries,
              numberOfHouseHolds: widget.numberOfHouseHolds,
              numberOfOvcs: widget.numberOfOvcs,
            ),
          ),
          InterventionSelectionButton(
              isInterventionSelected: isInterventionSelected,
              onInterventionButtonClick: () {
                intervetionCardState
                    .setCurrentInterventionProgram(activeInterventionProgram);
                onInterventionButtonClick();
              })
        ],
      )),
    ); //;
  }
}
