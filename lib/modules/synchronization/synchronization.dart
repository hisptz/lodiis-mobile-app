import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/synchronization/components/offline_data_summary.dart';
import 'package:kb_mobile_app/modules/synchronization/components/synchronization_action_form.dart';
import 'package:kb_mobile_app/modules/synchronization/components/synchronization_progress.dart';
import 'package:kb_mobile_app/modules/synchronization/conflict_on_download_page.dart';
import 'package:provider/provider.dart';

class Synchronization extends StatefulWidget {
  Synchronization({Key? key, this.synchronizationAction}) : super(key: key);
  final String? synchronizationAction;
  @override
  _SynchronizationState createState() => _SynchronizationState();
}

class _SynchronizationState extends State<Synchronization> {
  final String label = 'Data Synchronization';
  String? selectedSyncAction = '';

  void onStartDataUpload(BuildContext context) async {
    await Provider.of<SynchronizationState>(context, listen: false)
        .startDataUploadActivity();
  }

  void onViewConflicts(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return ConflictOnDownloadPage();
      },
    ));
  }

  void onStartDataDownload(BuildContext context) async {
    try {
      await Provider.of<SynchronizationState>(context, listen: false)
          .startDataDownloadActivity();
    } catch (e) {}
  }

  void initializeSynchronization(BuildContext context,
      {String? syncAction, bool isSyncActive = false}) async {
    if (!isSyncActive) {
      setState(() {
        selectedSyncAction = syncAction;
      });
      await Provider.of<SynchronizationState>(context, listen: false)
          .startSyncActivity(syncAction: syncAction);
    } else {
      AppUtil.showToastMessage(
          message: 'Synchronization is in progress',
          position: ToastGravity.BOTTOM);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        String currentSyncAction =
            Provider.of<SynchronizationState>(context, listen: false)
                .currentSyncAction;
        selectedSyncAction = currentSyncAction != ''
            ? currentSyncAction
            : widget.synchronizationAction ?? '';
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
        child: Consumer<InterventionCardState>(
          builder: (context, interventionCardState, child) {
            InterventionCard activeInterventionProgram =
                interventionCardState.currentInterventionProgram;
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
              double profileSyncProgress =
                  synchronizationState.profileSyncProgress;
              double eventsSyncProgress =
                  synchronizationState.eventsSyncProgress;
              double overallSyncProgress =
                  synchronizationState.overallSyncProgress;
              double overallDownloadProgress =
                  synchronizationState.overallDownloadProgress;
              double overallUploadProgress =
                  synchronizationState.overallUploadProgress;
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
                            child: OfflineDataSummary(
                                beneficiaryCount: beneficiaryCount,
                                beneficiaryServiceCount:
                                    beneficiaryServiceCount),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            child: SynchronizationActionForm(
                                selectedSyncAction: selectedSyncAction,
                                onInitializeSyncAction: (String? syncAction) =>
                                    initializeSynchronization(context,
                                        syncAction: syncAction,
                                        isSyncActive:
                                            (isDataDownloadingActive ||
                                                isDataUploadingActive))),
                          ),
                          Visibility(
                            visible: isDataDownloadingActive ||
                                isDataUploadingActive,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              child: SynchronizationProgress(
                                syncAction: selectedSyncAction,
                                hasUnsyncedData: hasUnsyncedData,
                                eventsSyncProgress: eventsSyncProgress,
                                profileSyncProgress: profileSyncProgress,
                                overallSyncProgress: overallSyncProgress,
                                overallDownloadProgress:
                                    overallDownloadProgress,
                                overallUploadProgress: overallUploadProgress,
                              ),
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
