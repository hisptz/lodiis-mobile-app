import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:kb_mobile_app/modules/synchronization/constants/synchronization_actions_constants.dart';
import 'package:provider/provider.dart';

class SynchronizationProgress extends StatefulWidget {
  const SynchronizationProgress(
      {Key key,
      this.syncAction,
      this.hasUnsyncedData,
      this.overallSyncProgress,
      this.eventsSyncProgress,
      this.profileSyncProgress,
      this.overallUploadProgress,
      this.overallDownloadProgress})
      : super(key: key);

  final String syncAction;
  final bool hasUnsyncedData;
  final double eventsSyncProgress;
  final double profileSyncProgress;
  final double overallUploadProgress;
  final double overallDownloadProgress;
  final double overallSyncProgress;

  @override
  _SynchronizationProgressState createState() =>
      _SynchronizationProgressState();
}

class _SynchronizationProgressState extends State<SynchronizationProgress> {
  @override
  Widget build(BuildContext context) {
    String title = 'Sync Progress';
    return Container(
      child: MaterialCard(
          body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(title,
                  style: TextStyle().copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            LineSeperator(color: Colors.blueGrey.withOpacity(0.2)),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Text(
                  'Starting ${widget.syncAction == SynchronizationActionsConstants().download ? "Download" : widget.syncAction == SynchronizationActionsConstants().upload ? "Upload" : "Synchronization"}. Please wait, this might take a while.',
                  textAlign: TextAlign.center,
                  style: TextStyle().copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Text('Overall Progress'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Provider.of<IntervetionCardState>(context,
                                    listen: false)
                                .currentIntervetionProgram
                                .primmaryColor),
                        minHeight: 10.0,
                        value: widget.overallSyncProgress ?? 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: widget.syncAction ==
                  SynchronizationActionsConstants().downloadAndUpload,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text('Data Download'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Provider.of<IntervetionCardState>(context,
                                      listen: false)
                                  .currentIntervetionProgram
                                  .primmaryColor),
                          minHeight: 10.0,
                          value: widget.overallDownloadProgress ?? 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.syncAction ==
                      SynchronizationActionsConstants().downloadAndUpload &&
                  widget.hasUnsyncedData,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text('Data upload'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Provider.of<IntervetionCardState>(context,
                                      listen: false)
                                  .currentIntervetionProgram
                                  .primmaryColor),
                          minHeight: 10.0,
                          value: widget.overallUploadProgress ?? 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.syncAction !=
                  SynchronizationActionsConstants().downloadAndUpload,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text('Profile Data'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Provider.of<IntervetionCardState>(context,
                                      listen: false)
                                  .currentIntervetionProgram
                                  .primmaryColor),
                          minHeight: 10.0,
                          value: widget.profileSyncProgress ?? 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.syncAction !=
                  SynchronizationActionsConstants().downloadAndUpload,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text('Service Data'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Provider.of<IntervetionCardState>(context,
                                      listen: false)
                                  .currentIntervetionProgram
                                  .primmaryColor),
                          minHeight: 10.0,
                          value: widget.eventsSyncProgress ?? 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
