import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_card.dart';

class InterventionSelectionList extends StatefulWidget {
  InterventionSelectionList({
    Key key,
    @required this.interventionPrograms,
    this.onInterventionSelection,
    @required this.numberOfAgywDreamsBeneficiaries,
    @required this.numberOfNoneAgywDreamsBeneficiaries,
    @required this.numberOfHouseholds,
    @required this.numberOfOvcs,
    @required this.numberOfOgac,
  }) : super(key: key);

  final List<InterventionCard> interventionPrograms;
  final Function(InterventionCard) onInterventionSelection;

  final int numberOfNoneAgywDreamsBeneficiaries;
  final int numberOfAgywDreamsBeneficiaries;
  final int numberOfHouseholds;
  final int numberOfOvcs;
  final int numberOfOgac;

  @override
  _InterventionSelectionListState createState() =>
      _InterventionSelectionListState();
}

class _InterventionSelectionListState extends State<InterventionSelectionList> {
  String interventionProgramId = '';

  void setSelectedCard(InterventionCard interventionProgram) {
    setState(() {
      interventionProgramId = interventionProgram.id;
      widget.onInterventionSelection(interventionProgram);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.interventionPrograms
            .map(
              (InterventionCard interventionProgram) => GestureDetector(
                onTap: () => setSelectedCard(interventionProgram),
                child: InterventionSelectionCard(
                  interventionProgram: interventionProgram,
                  interventionProgramId: interventionProgramId,
                  numberOfAgywDreamsBeneficiaries:
                      widget.numberOfAgywDreamsBeneficiaries,
                  numberOfNoneAgywDreamsBeneficiaries:
                      widget.numberOfNoneAgywDreamsBeneficiaries,
                  numberOfHouseholds: widget.numberOfHouseholds,
                  numberOfOvcs: widget.numberOfOvcs,
                  numberOfOgac: widget.numberOfOgac,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
