import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_intervention_list_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
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
    Key? key,
    required this.interventionPrograms,
    required this.onInterventionSelection,
    required this.numberOfAgywDreamsBeneficiaries,
    required this.numberOfNoneAgywDreamsBeneficiaries,
    required this.numberOfHouseholds,
    required this.numberOfOvcs,
    required this.numberOfOgac,
  }) : super(key: key);

  final List<InterventionCard> interventionPrograms;
  final Function(InterventionCard) onInterventionSelection;
  final int numberOfNoneAgywDreamsBeneficiaries;
  final int numberOfAgywDreamsBeneficiaries;
  final int numberOfHouseholds;
  final int numberOfOvcs;
  final int numberOfOgac;

  @override
  _InterventionSelectionContainerState createState() =>
      _InterventionSelectionContainerState();
}

class _InterventionSelectionContainerState
    extends State<InterventionSelectionContainer> {
  bool isInterventionSelected = false;
  InterventionCard? activeInterventionProgram;
  List<InterventionCard> interventionPrograms = [];
  bool isLoading = true;
  late InterventionCardState interventionCardState;
  late CurrentUserState currentUserState;

  @override
  void initState() {
    super.initState();
    interventionCardState =
        Provider.of<InterventionCardState>(context, listen: false);
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
    widget.onInterventionSelection(currentInterventionProgram);
    activeInterventionProgram = currentInterventionProgram;
    setState(() {
      isInterventionSelected = true;
    });
  }

  void onInterventionButtonClick() {
    if (activeInterventionProgram != null &&
        activeInterventionProgram!.id!.isNotEmpty) {
      if (activeInterventionProgram!.id == 'dreams') {
        List<String> teiWithIncomingReferral =
            Provider.of<ReferralNotificationState>(context, listen: false)
                .beneficiariesWithIncomingReferrals;
        Provider.of<DreamsInterventionListState>(context, listen: false)
            .setTeiWithIncomingReferral(
                teiWithIncomingReferral: teiWithIncomingReferral);
      }
      interventionCardState
          .setCurrentInterventionProgram(activeInterventionProgram!);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => activeInterventionProgram!.id == 'ovc'
                  ? OvcIntervention()
                  : activeInterventionProgram!.id == 'dreams'
                      ? DreamsIntervention()
                      : activeInterventionProgram!.id == 'ogac'
                          ? OgacIntervention()
                          : RoutePageNotFound(
                              pageTitle:
                                  '${activeInterventionProgram!.name} is not found',
                              color: activeInterventionProgram!.primaryColor)));
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
                    String? currentLanguage =
                        languageTranslationState.currentLanguage;
                    return Center(
                      child: Container(
                        child: Visibility(
                          visible: locations != '',
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: currentLanguage == 'lesotho'
                                  ? 'Sebaka : '
                                  : 'Location : ',
                              style: TextStyle().copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFAFAFA),
                              ),
                              children: [
                                TextSpan(
                                  text: locations,
                                  style: TextStyle().copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFFFAFAFA),
                                  ),
                                ),
                              ],
                            ),
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
                          onInterventionSelection:
                              onSelectingInterventionProgram,
                          numberOfAgywDreamsBeneficiaries:
                              widget.numberOfAgywDreamsBeneficiaries,
                          numberOfNoneAgywDreamsBeneficiaries:
                              widget.numberOfNoneAgywDreamsBeneficiaries,
                          numberOfHouseholds: widget.numberOfHouseholds,
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
