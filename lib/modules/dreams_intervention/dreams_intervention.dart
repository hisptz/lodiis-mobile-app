import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/intervention_app_bar.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/app-state/intervention_card_state/intervention_card_state.dart';

class DreamsIntervention extends StatelessWidget {
  const DreamsIntervention({Key key}) : super(key: key);

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
      body: SafeArea(
          child: Container(
        child: Text(
            'Dreams intervention - ${activeInterventionProgram.name ?? ''}'),
      )),
    );
  }
}
