import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class Synchronization extends StatefulWidget {
  Synchronization({Key key}) : super(key: key);

  @override
  _SynchronizationState createState() => _SynchronizationState();
}

class _SynchronizationState extends State<Synchronization> {
  final String label = 'Data Synchronization';

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
      body: SubPageBody(
        body: Container(
          child: Text('Sync module'),
        ),
      ),
    );
  }
}
