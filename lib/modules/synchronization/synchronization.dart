import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/synchronization/components/data_download_container.dart';
import 'package:kb_mobile_app/modules/synchronization/components/data_upload_container.dart';
import 'package:provider/provider.dart';

class Synchronization extends StatefulWidget {
  Synchronization({Key key}) : super(key: key);

  @override
  _SynchronizationState createState() => _SynchronizationState();
}

class _SynchronizationState extends State<Synchronization> {
  final String label = 'Data Synchronization';

  void onStartDataUpload(BuildContext context) async {
    Provider.of<SynchronizationState>(context, listen: false)
        .startDataUploadActivity();
  }

  void onStartDataDownload(BuildContext context) async {
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
              disableSelectionOfActiveIntervention: false,
            );
          },
        ),
      ),
      body: SubPageBody(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
          child: Consumer<SynchronizationState>(
            builder: (context, synchronizationState, child) {
              bool isDataDownloadingActive =
                  synchronizationState.isDataDownloadingActive;
              bool isDataUploadingActive =
                  synchronizationState.isDataUploadingActive;
              bool hasUnsyncedData = synchronizationState.hasUnsyncedData;
              bool isUnsyncedCheckingActive =
                  synchronizationState.isUnsyncedCheckingActive;
              int beneficiaryCount = synchronizationState.beneficiaryCount;
              int beneficiaryServiceCount =
                  synchronizationState.beneficiaryServiceCount;
              return isUnsyncedCheckingActive
                  ? Container(
                      child: CircularProcessLoader(
                        color: Colors.blueGrey,
                      ),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: DataUploadContainer(
                                beneficiaryCount: beneficiaryCount,
                                beneficiaryServiceCount:
                                    beneficiaryServiceCount,
                                isDataDownloadingActive:
                                    isDataDownloadingActive,
                                isDataUploadingActive: isDataUploadingActive,
                                hasUnsyncedData: hasUnsyncedData,
                                onStartDataUpload: () =>
                                    onStartDataUpload(context)),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: DataDowmloadContainer(
                              isDataDownloadingActive: isDataDownloadingActive,
                              isDataUploadingActive: isDataUploadingActive,
                              onStartDataDownload: () =>
                                  onStartDataDownload(context),
                            ),
                          ),
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
