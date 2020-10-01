import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_container.dart';
import 'package:provider/provider.dart';

class InterventionSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterventionSelectionState();
  }
}

class _InterventionSelectionState extends State<InterventionSelection> {
  List<InterventionCard> interventionPrograms =
      InterventionCard.getInterventions();

  Color primmaryColor = CustomColor.defaultPrimaryColor;
  bool hasDataLoaded = false;

  void onIntervetionSelection(InterventionCard interventionProgram) {
    setState(() {
      AppUtil.setStatusBarColor(interventionProgram.primmaryColor);
      primmaryColor = interventionProgram.primmaryColor;
    });
  }

  @override
  void initState() {
    super.initState();
    //@TODO Discovering all data for intervetion selections for identify intervations with data
    Timer(Duration(seconds: 2), upDataStateLoadingStatus);
  }

  upDataStateLoadingStatus() {
    Provider.of<OvcInterventionListState>(context, listen: false)
        .refreshOvcList();
    setState(() {
      hasDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(color: primmaryColor),
        ),
        Consumer<SynchtonizationState>(
            builder: (context, synchtonizationState, child) {
          bool isSynchronizationActive =
              synchtonizationState.isSynchronizationActive;
          return Container(child: Consumer<OvcInterventionListState>(
            builder: (context, ovcInterventionListState, child) {
              bool isOvcListLoading = ovcInterventionListState.isLoading;
              int numberOfHouseHolds =
                  ovcInterventionListState.numberOfHouseHolds;
              int numberOfOvcs = ovcInterventionListState.numberOfOvcs;
              return Container(
                child: Consumer<DreamsInterventionListState>(
                  builder: (context, dreamsInterventionListState, child) {
                    bool isDreamsListLoading =
                        dreamsInterventionListState.isLoading;
                    int numberOfDreamsBeneficiaries =
                        dreamsInterventionListState.numberOfDreamsBeneficiaries;
                    return Container(
                      child: isSynchronizationActive ||
                              isDreamsListLoading ||
                              isOvcListLoading
                          ? CircularProcessLoader()
                          : InterventionSelectionContainer(
                              interventionPrograms: interventionPrograms,
                              onIntervetionSelection: onIntervetionSelection,
                              numberOfDreamsBeneficiaries:
                                  numberOfDreamsBeneficiaries,
                              numberOfHouseHolds: numberOfHouseHolds,
                              numberOfOvcs: numberOfOvcs,
                            ),
                    );
                  },
                ),
              );
            },
          ));
        }),
      ],
    )));
  }
}

// Container(child: isOvcListLoaded && isDreamsListLoaded? CircularProcessLoader()
//             : InterventionSelectionContainer(
//                 interventionPrograms: interventionPrograms,
//                 onIntervetionSelection: onIntervetionSelection),)
