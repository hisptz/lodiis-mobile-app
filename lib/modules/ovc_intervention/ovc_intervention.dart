import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app-state/intervention_card/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class OvcIntervention extends StatelessWidget {
  const OvcIntervention({Key key}) : super(key: key);

  void onClickHome() {
    print('on hoemm');
  }

  void onSearch() {
    print('on hoemm');
  }

  void onAddHouseHold() {
    print('on hoemm');
  }

  void onOpenMoreMenu() {
    print('on hoemm');
  }

  @override
  Widget build(BuildContext context) {
    // state controllers
    IntervetionCardState intervetionCardState =
        Provider.of<IntervetionCardState>(context);
    InterventionCard activeInterventionProgram =
        intervetionCardState.currentIntervetionProgram;

    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: InterventionAppBar(
            activeInterventionProgram: activeInterventionProgram,
            onClickHome: onClickHome,
            onSearch: onSearch,
            onAddHouseHold: onAddHouseHold,
            onOpenMoreMenu: onOpenMoreMenu,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration:
                  BoxDecoration(color: activeInterventionProgram.background),
            ),
            Container(
              child: Text('container for ${activeInterventionProgram.name}'),
            )
          ],
        ),
      ),
    ));
  }
}
