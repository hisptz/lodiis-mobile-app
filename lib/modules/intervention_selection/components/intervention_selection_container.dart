import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/dreams_intervention.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_list.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_button.dart';
import 'package:kb_mobile_app/modules/ogac_intervention/ogac_intervention.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/ovc_intervention.dart';
import 'package:provider/provider.dart';

class InterventionSelectionContainer extends StatefulWidget {
  const InterventionSelectionContainer({
    Key key,
    @required this.interventionPrograms,
    @required this.onIntervetionSelection,
    @required this.numberOfAgywDreamsBeneficiaries,
    @required this.numberOfNoneAgywDreamsBeneficiaries,
    @required this.numberOfHouseHolds,
    @required this.numberOfOvcs,
    @required this.numberOfOgac,
  }) : super(key: key);

  final List<InterventionCard> interventionPrograms;
  final Function(InterventionCard) onIntervetionSelection;
  final int numberOfNoneAgywDreamsBeneficiaries;
  final int numberOfAgywDreamsBeneficiaries;
  final int numberOfHouseHolds;
  final int numberOfOvcs;
  final int numberOfOgac;

  @override
  _InterventionSelectionContainerState createState() =>
      _InterventionSelectionContainerState();
}

class _InterventionSelectionContainerState
    extends State<InterventionSelectionContainer> {
  bool isInterventionSelected = false;
  InterventionCard activeInterventionProgram;

  @override
  void initState() {
    //@TODO add logics for auto select intervention in case of one intevention
    super.initState();
    // checking get intervention based on access - write helper functions for this and do below in case of single interventions
    // select intervrntion
    // cliclk button
  }

  void onSelectingInterventionProgram(
      InterventionCard currentInterventionProgram) {
    widget.onIntervetionSelection(currentInterventionProgram);
    activeInterventionProgram = currentInterventionProgram;
    setState(() {
      isInterventionSelected = true;
    });
  }

  void onInterventionButtonClick() {
    if (activeInterventionProgram != null &&
        activeInterventionProgram.id.isNotEmpty) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => activeInterventionProgram.id == 'ovc'
                  ? OvcIntervention()
                  : activeInterventionProgram.id == 'dreams'
                      ? DreamsIntervention()
                      : activeInterventionProgram.id == 'ogac'
                          ? OgacIntervention()
                          : RoutePageNotFound(
                              pageTitle:
                                  '${activeInterventionProgram.name} is not found',
                              color: activeInterventionProgram.primmaryColor)));
    }
  }

  @override
  Widget build(BuildContext context) {
    IntervetionCardState intervetionCardState =
        Provider.of<IntervetionCardState>(context, listen: false);
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 50),
            child: Consumer<CurrentUserState>(
              builder: (context, currentUserState, child) {
                String locations = currentUserState.currentUserLocations;
                return Container(
                  child: Text(
                    'Locations : $locations',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFFAFAFA)),
                  ),
                );
              },
            ),
          ),
          Container(
            child: InterventionSelectionList(
              interventionPrograms: widget.interventionPrograms,
              onIntervetionSelection: onSelectingInterventionProgram,
              numberOfAgywDreamsBeneficiaries:
                  widget.numberOfAgywDreamsBeneficiaries,
              numberOfNoneAgywDreamsBeneficiaries:
                  widget.numberOfNoneAgywDreamsBeneficiaries,
              numberOfHouseHolds: widget.numberOfHouseHolds,
              numberOfOvcs: widget.numberOfOvcs,
              numberOfOgac: widget.numberOfOgac,
            ),
          ),
          InterventionSelectionButton(
              isInterventionSelected: isInterventionSelected,
              onInterventionButtonClick: () {
                intervetionCardState
                    .setCurrentInterventionProgram(activeInterventionProgram);
                onInterventionButtonClick();
              })
        ],
      )),
    ); //;
  }
}
