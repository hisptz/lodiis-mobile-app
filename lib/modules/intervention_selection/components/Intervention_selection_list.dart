import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_card.dart';

class InterventionSelectionList extends StatelessWidget {
  InterventionSelectionList({
    Key key,
    @required this.interventionPrograms,
  }) : super(key: key);

  final List<InterventionCard> interventionPrograms;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: interventionPrograms
            .map((InterventionCard interventionProgram) => GestureDetector(
                  onTap: () => {},
                  child: InterventionSelectionCard(
                      interventionProgram: interventionProgram),
                ))
            .toList(),
      ),
    );
  }
}
