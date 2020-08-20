import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/intervention.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_list.dart';

class InterventionSelectionContainer extends StatelessWidget {
  const InterventionSelectionContainer({
    Key key,
    @required this.interventionPrograms,
  }) : super(key: key);

  final List<InterventionProgram> interventionPrograms;

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
              interventionPrograms: interventionPrograms),
        ),
        Container(
          child: Text(
            'Continue',
            style: TextStyle(),
          ),
        )
      ],
    )); //;
  }
}
