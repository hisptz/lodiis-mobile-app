import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:provider/provider.dart';

class ConflictOnDownloadPage extends StatefulWidget {
  ConflictOnDownloadPage({Key key}) : super(key: key);
  @override
  _ConflictOnDownloadPageState createState() => _ConflictOnDownloadPageState();
}

class _ConflictOnDownloadPageState extends State<ConflictOnDownloadPage> {
  final String label = 'Download Conflicts';

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
              disableSelectionOfActiveIntervention: false,
            );
          },
        ),
      ),
      body: SubPageBody(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
            child: Center(
              child: Text("Download Conflicts"),
            )),
      ),
    );
  }
}
