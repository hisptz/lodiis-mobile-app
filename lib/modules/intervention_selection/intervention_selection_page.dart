import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_container.dart';

class InterventionSelectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterventionSelectionState();
  }
}

class _InterventionSelectionState extends State<InterventionSelectionPage> {
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
        !hasDataLoaded
            ? CircularProcessLoader()
            : InterventionSelectionContainer(
                interventionPrograms: interventionPrograms,
                onIntervetionSelection: onIntervetionSelection)
      ],
    )));
  }
}
