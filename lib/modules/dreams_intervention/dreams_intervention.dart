import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/app-state/intervention_card/intervention_card_state.dart';

class DreamsIntervention extends StatelessWidget {
  const DreamsIntervention({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // state controllers
    IntervetionCardState intervetionCardState =
        Provider.of<IntervetionCardState>(context);
    InterventionCard activeInterventionProgram =
        intervetionCardState.currentIntervetionProgram;

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Text(
            'Dreams intervention - ${activeInterventionProgram.name ?? ''}'),
      )),
    );
  }
}
