import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_card.dart';

class InterventionSelectionList extends StatefulWidget {
  InterventionSelectionList({
    Key key,
    @required this.interventionPrograms,
    this.onIntervetionSelection,
    @required this.numberOfAgywDreamsBeneficiaries,
    @required this.numberOfNoneAgywDreamsBeneficiaries,
    @required this.numberOfHouseHolds,
    @required this.numberOfOvcs,
  }) : super(key: key);

  final List<InterventionCard> interventionPrograms;
  final Function(InterventionCard) onIntervetionSelection;

  final int numberOfNoneAgywDreamsBeneficiaries;
  final int numberOfAgywDreamsBeneficiaries;
  final int numberOfHouseHolds;
  final int numberOfOvcs;

  @override
  _InterventionSelectionListState createState() =>
      _InterventionSelectionListState();
}

class _InterventionSelectionListState extends State<InterventionSelectionList> {
  String interventionProgramId = '';

  void setSelectedCard(InterventionCard interventionProgram) {
    setState(() {
      interventionProgramId = interventionProgram.id;
      widget.onIntervetionSelection(interventionProgram);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.interventionPrograms
            .map((InterventionCard interventionProgram) => GestureDetector(
                  onTap: () => setSelectedCard(interventionProgram),
                  child: InterventionSelectionCard(
                    interventionProgram: interventionProgram,
                    interventionProgramId: interventionProgramId,
                    numberOfAgywDreamsBeneficiaries:
                        widget.numberOfAgywDreamsBeneficiaries,
                    numberOfNoneAgywDreamsBeneficiaries:
                        widget.numberOfNoneAgywDreamsBeneficiaries,
                    numberOfHouseHolds: widget.numberOfHouseHolds,
                    numberOfOvcs: widget.numberOfOvcs,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
