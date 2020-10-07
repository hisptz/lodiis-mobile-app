import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';

class DataUploadContainer extends StatelessWidget {
  const DataUploadContainer({
    Key key,
    @required this.beneficiaryCount,
    @required this.beneficiaryServiceCount,
    @required this.isDataDownloadingActive,
    @required this.isDataUploadingActive,
    @required this.hasUnsyncedData,
    @required this.dataUploadProcesses,
    this.onStartDataUpload,
  }) : super(key: key);

  final int beneficiaryCount;
  final int beneficiaryServiceCount;
  final bool isDataDownloadingActive;
  final bool isDataUploadingActive;
  final bool hasUnsyncedData;
  final Function onStartDataUpload;
  final List<String> dataUploadProcesses;

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
                child: Text('Offline data upload',
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              LineSeperator(color: Colors.blueGrey.withOpacity(0.2)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Unsynced Beneficiary',
                        style: TextStyle().copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$beneficiaryCount',
                        style: TextStyle().copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Unsynced Beneficairy's services",
                        style: TextStyle().copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$beneficiaryServiceCount',
                        style: TextStyle().copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: dataUploadProcesses.length == 0
                      ? null
                      : Border.all(color: Colors.blueGrey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: dataUploadProcesses
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: isDataDownloadingActive ||
                                  isDataUploadingActive ||
                                  !hasUnsyncedData
                              ? null
                              : () {
                                  this.onStartDataUpload();
                                },
                          child: Text(
                            isDataUploadingActive
                                ? 'Uploading data'
                                : 'Upload Data',
                            style: TextStyle().copyWith(
                                fontSize: 12.0, color: Colors.blueGrey),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
