import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
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

  void startDataUpload(BuildContext context) async {
    Provider.of<SynchronizationState>(context, listen: false)
        .startDataUploadActivity();
  }

  void startDataDownload(BuildContext context) async {
    Provider.of<SynchronizationState>(context, listen: false)
        .startDataDownloadActivity();
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        Provider.of<SynchronizationState>(context, listen: false)
            .startCheckingStatusOfUnsyncedData();
      });
    });
  }

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
          child: Consumer<SynchronizationState>(
            builder: (context, synchronizationState, child) {
              bool isDataDownloadingActive =
                  synchronizationState.isDataDownloadingActive;
              bool isDataUploadingActive =
                  synchronizationState.isDataUploadingActive;
              bool hasUnsyncedData = synchronizationState.hasUnsyncedData;
              bool isUnsyncedCheckingActive =
                  synchronizationState.isUnsyncedCheckingActive;
              return isUnsyncedCheckingActive
                  ? Container(
                      child: CircularProcessLoader(
                        color: Colors.blueGrey,
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Text(
                              'Sync module isUnsyncedCheckingActive $isUnsyncedCheckingActive'),
                          Text(
                              'Sync module isDataDownloadingActive $isDataDownloadingActive'),
                          Text(
                              'Sync module isDataUploadingActive $isDataUploadingActive'),
                          FlatButton(
                              color: Colors.amberAccent,
                              disabledColor:
                                  Colors.amberAccent.withOpacity(0.2),
                              onPressed: isDataDownloadingActive ||
                                      isDataUploadingActive
                                  ? null
                                  : () => startDataDownload(context),
                              child: Text('dowload data')),
                          FlatButton(
                              color: Colors.amberAccent,
                              disabledColor:
                                  Colors.amberAccent.withOpacity(0.2),
                              onPressed: isDataDownloadingActive ||
                                      isDataUploadingActive ||
                                      !hasUnsyncedData
                                  ? null
                                  : () => startDataUpload(context),
                              child: Text('upload data'))
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
