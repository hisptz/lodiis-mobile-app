import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class InterventionBottomNavigationBarContainer extends StatelessWidget {
  const InterventionBottomNavigationBarContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IntervetionCardState>(
      builder: (context, intervetionCardState, child) {
        InterventionCard activeInterventionProgram =
            intervetionCardState.currentIntervetionProgram;
        return InterventionBottomNavigationBar(
            activeInterventionProgram: activeInterventionProgram);
      },
    );
  }
}
