import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/components/dream_beneficiary_top_header.dart';
import 'package:provider/provider.dart';

class DreamSrhPage extends StatefulWidget {
  DreamSrhPage({Key key , @required this.agywDream}) : super(key: key);
  final AgywDream agywDream;

  @override
  _DreamSrhPageState createState() => _DreamSrhPageState();
}

class _DreamSrhPageState extends State<DreamSrhPage> {
  final String label = 'SRH Service';

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
          child: Container(
            child: Column(
              children: [
                //header on the page
                DreamBenefeciaryTopHeader(
                  agywDream: widget.agywDream,
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 250),
                    child: Center(child: Text("SRH FORM CONTAINER")))
              ],
            ),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
