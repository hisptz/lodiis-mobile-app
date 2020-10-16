import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';

class DataDowmloadContainer extends StatelessWidget {
  const DataDowmloadContainer({
    Key key,
    @required this.isDataDownloadingActive,
    @required this.isDataUploadingActive,
    @required this.dataDownloadProcesses,
    this.onStartDataDownload,
  }) : super(key: key);

  final bool isDataDownloadingActive;
  final bool isDataUploadingActive;
  final Function onStartDataDownload;
  final List<String> dataDownloadProcesses;

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
                    children: dataDownloadProcesses
                        .map((String process) => Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                process,
                                style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal),
                              ),
                            ))
                        .toList(),
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
