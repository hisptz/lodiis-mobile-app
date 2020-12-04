import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/route_page_not_found.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/dreams_intervention.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/Intervention_selection_list.dart';
import 'package:kb_mobile_app/modules/intervention_selection/components/intervention_selection_button.dart';
import 'package:kb_mobile_app/modules/intervention_selection/utils/intervention_selection_helper.dart';
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
  List<InterventionCard> interventionPrograms = [];
  bool isLoading = true;
  IntervetionCardState intervetionCardState;
  CurrentUserState currentUserState;

  @override
  void initState() {
    super.initState();
    intervetionCardState =
        Provider.of<IntervetionCardState>(context, listen: false);
    currentUserState = Provider.of<CurrentUserState>(context, listen: false);
    Timer(Duration(seconds: 1), () {
      checkingForAutoSelectionOfIntervention(currentUserState);
    });
  }

  void checkingForAutoSelectionOfIntervention(
    CurrentUserState currentUserState,
  ) {
    interventionPrograms =
        InterventionSelectionHelper.getInterventionSelections(
      widget.interventionPrograms,
      currentUserState,
    );
    if (interventionPrograms.length == 1) {
      onSelectingInterventionProgram(interventionPrograms[0]);
      setState(() {});
      onInterventionButtonClick();
    }
    isLoading = false;
    setState(() {});
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
      intervetionCardState
          .setCurrentInterventionProgram(activeInterventionProgram);
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
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 50),
            child: Consumer<CurrentUserState>(
              builder: (context, currentUserState, child) {
                String locations = currentUserState.currentUserLocations;
                return Consumer<LanguageTranslationState>(
                  builder: (context, languageTranslationState, child) {
                    String currentLanguage =
                        languageTranslationState.currentLanguage;
                    return Container(
                      child: Visibility(
                        visible: locations != '',
                        child: RichText(
                          text: TextSpan(
                            text: currentLanguage == 'lesotho'
                                ? 'Sebaka : '
                                : 'Location : ',
                            style: TextStyle().copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFAFAFA)),
                            children: [
                              TextSpan(
                                text: locations,
                                style: TextStyle().copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFFFAFAFA)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            child: isLoading
                ? Container(
                    child: Center(
                      child: CircularProcessLoader(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    child: Column(
                    children: [
                      Container(
                        child: InterventionSelectionList(
                          interventionPrograms: interventionPrograms,
                          onIntervetionSelection:
                              onSelectingInterventionProgram,
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
                            onInterventionButtonClick();
                          })
                    ],
                  )),
          ),
        ],
      )),
    ); //;
  }
}
