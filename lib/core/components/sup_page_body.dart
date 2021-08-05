import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class SubPageBody extends StatelessWidget {
  const SubPageBody({Key key, @required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Consumer<InterventionCardState>(
      builder: (context, interventionCardState, child) {
        InterventionCard activeInterventionProgram =
            interventionCardState.currentInterventionProgram;
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration:
                  BoxDecoration(color: activeInterventionProgram.background),
            ),
            SingleChildScrollView(
              child: body,
            )
          ],
        );
      },
    );
  }
}
