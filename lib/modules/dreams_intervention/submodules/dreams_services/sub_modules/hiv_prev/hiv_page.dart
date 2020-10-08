import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dream_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:provider/provider.dart';

class DreamHIVPrepPage extends StatefulWidget {
  DreamHIVPrepPage({Key key}) : super(key: key);

  @override
  _DreamHIVPrepPageState createState() => _DreamHIVPrepPageState();
}

class _DreamHIVPrepPageState extends State<DreamHIVPrepPage> {
  final String label = 'HIV PREP Service';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(child: Consumer<DreamBenefeciarySelectionState>(
            builder: (context, dreamBenefeciarySelectionState, child) {
              AgywDream agywDream =
                  dreamBenefeciarySelectionState.currentAgywDream;
              return Column(
                children: [
                  //header on the page
                  DreamBenefeciaryTopHeader(agywDream: agywDream),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 250),
                      child: Center(child: Text("HIV PREP FORM CONTAINER")))
                ],
              );
            },
          )),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
