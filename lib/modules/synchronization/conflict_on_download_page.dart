import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/synchronization/components/data_download_conflict_page_header.dart';
import 'package:provider/provider.dart';

class ConflictOnDownloadPage extends StatefulWidget {
  ConflictOnDownloadPage({Key key}) : super(key: key);
  @override
  _ConflictOnDownloadPageState createState() => _ConflictOnDownloadPageState();
}

class _ConflictOnDownloadPageState extends State<ConflictOnDownloadPage> {
  final String label = 'Download Conflicts';

  void onAcceptConflict(TrackedEntityInstance trackedEntityInstance) async {
    await FormUtil.savingTrackedEntityInstance(trackedEntityInstance);
  }

  void onDiscardConflict() {
    // print("accept offline data");
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
      body: SubPageBody(body: Consumer<SynchronizationState>(
        builder: (context, synchronizationState, child) {
          List<String> conflictPageNames = [
            "Service Data Conflicts",
            "Profile Data Conflicts"
          ];

          return Column(
            children: conflictPageNames.map((conflictPage) {
              return ExpansionTile(
                  title: Text(
                    "$conflictPage",
                    style: TextStyle(color: Colors.black),
                  ),
                  children: [
                    DataDownloadConflictPageHeader(),
                    Column(
                      children: conflictPage == "Service Data Conflicts"
                          ? synchronizationState.trackedInstance1
                              .map((trackedInstance) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        trackedInstance['label'],
                                        style: TextStyle().copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        trackedInstance['offline'],
                                        style: TextStyle().copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        trackedInstance['online'],
                                        style: TextStyle().copyWith(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () => onAcceptConflict(
                                                trackedInstance[
                                                    'trackedEntityInstance']),
                                            child: Container(
                                              height: 25,
                                              width: 320,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Center(
                                                child: Text("accept",
                                                    style: TextStyle(
                                                        fontSize: 11)),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => onDiscardConflict(),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              height: 25,
                                              width: 320,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Center(
                                                child: Text("discard",
                                                    style: TextStyle(
                                                        fontSize: 11)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList()
                          : synchronizationState.events_1
                              .map((trackedInstance) {
                              return Text("events ");
                            }).toList(),
                    )
                  ]);
            }).toList(),
          );
        },
      )),
    );
  }
}
