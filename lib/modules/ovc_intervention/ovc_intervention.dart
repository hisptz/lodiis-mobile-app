import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app-state/intervention_card/intervention_card_state.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class OvcIntervention extends StatelessWidget {
  const OvcIntervention({Key key}) : super(key: key);

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
        child: Text('Ovc intervetion - ${activeInterventionProgram.name}'),
      )),
    );
  }
}
