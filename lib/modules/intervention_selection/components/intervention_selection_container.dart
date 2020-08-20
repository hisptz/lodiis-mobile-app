import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_list.dart';

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
  bool isInterventionSelected = false;

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
            onIntervetionSelection: (InterventionCard interventionProgram) {
              this.widget.onIntervetionSelection(interventionProgram);
              setState(() {
                isInterventionSelected = true;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            margin: EdgeInsets.only(top: 60),
            width: double.infinity,
            child: FlatButton(
                onPressed: !isInterventionSelected ? null : () => {},
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: isInterventionSelected
                            ? Color(0xFFFAFAFA)
                            : Color(0xFF7FBA7C)),
                    borderRadius: BorderRadius.circular(12.0)),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: isInterventionSelected
                            ? Color(0xFFFAFAFA)
                            : Color(0xFF7FBA7C)),
                  ),
                )),
          ),
        )
      ],
    )); //;
  }
}
