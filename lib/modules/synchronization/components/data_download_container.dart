import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';
import 'package:provider/provider.dart';

class DataDownloadContainer extends StatelessWidget {
  const DataDownloadContainer(
      {Key key,
      @required this.isDataDownloadingActive,
      @required this.isDataUploadingActive,
      @required this.dataDownloadProcesses,
      this.onViewConflicts,
      this.onStartDataDownload,
      this.conflictCount,
      this.profileProgress,
      this.eventsProgress, this.overallProgress})
      : super(key: key);

  final bool isDataDownloadingActive;
  final bool isDataUploadingActive;
  final Function onStartDataDownload;
  final Function onViewConflicts;
  final List<String> dataDownloadProcesses;
  final int conflictCount;
  final double profileProgress;
  final double eventsProgress;
  final double overallProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialCard(
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Text('Online data download',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              LineSeperator(color: Colors.blueGrey.withOpacity(0.2)),
              Visibility(
                visible: dataDownloadProcesses.length > 0,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: dataDownloadProcesses.length == 0
                        ? null
                        : Border.all(color: Colors.blueGrey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                          'Starting Download. Please wait, this might take a while'),
                      Container(
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
                                  value: overallProgress ?? 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                                  value: profileProgress ?? 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('Service Data', textAlign: TextAlign.start,),
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
                                  value: eventsProgress ?? 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          dataDownloadProcesses.length > 0
                              ? dataDownloadProcesses.last
                              : '',
                          style: TextStyle().copyWith(
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: conflictCount > 0,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Conflicts Exists',
                          style: TextStyle().copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '$conflictCount',
                          style: TextStyle().copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blueGrey[100]),
                                borderRadius: BorderRadius.circular(25.0)),
                            onPressed: () => this.onViewConflicts(),
                            child: Text(
                              "view conflicts",
                              style: TextStyle().copyWith(
                                  fontSize: 11.0, color: Colors.blueGrey),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed:
                              isDataDownloadingActive || isDataUploadingActive
                                  ? null
                                  : () => this.onStartDataDownload(),
                          child: Text(
                            isDataDownloadingActive
                                ? 'Downloading data'
                                : 'Download Data',
                            style: TextStyle().copyWith(
                                fontSize: 12.0, color: Colors.blueGrey),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
