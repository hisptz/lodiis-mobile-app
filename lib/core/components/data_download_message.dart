import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:provider/provider.dart';

class DataDownloadMessage extends StatefulWidget {
  @override
  _DataDownloadMessageState createState() => _DataDownloadMessageState();
}

class _DataDownloadMessageState extends State<DataDownloadMessage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      checkForAvailableBeneficiaryDataFromServer();
    });
  }

  void checkForAvailableBeneficiaryDataFromServer() {
    Timer(
        Duration(milliseconds: 200),
        () => Provider.of<SynchronizationState>(context, listen: false)
            .checkingForAvaiableBeneficiaryData());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SynchronizationState>(
      builder: (context, synchronizationState, child) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
                synchronizationState.statusMessageForAvailableDataFromServer ??
                    '',
                style: TextStyle(color: Colors.white, fontSize: 14)));
      },
    );
  }
}
