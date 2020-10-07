import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/material_card.dart';

class DataDowmloadContainer extends StatelessWidget {
  const DataDowmloadContainer({
    Key key,
    @required this.isDataDownloadingActive,
    @required this.isDataUploadingActive,
    this.onStartDataDownload,
  }) : super(key: key);

  final bool isDataDownloadingActive;
  final bool isDataUploadingActive;
  final Function onStartDataDownload;

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
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 5.0),
              //   child: Visibility(
              //     visible: isDataDownloadingActive,
              //     child: Text('List of progress'),
              //   ),
              // ),
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
