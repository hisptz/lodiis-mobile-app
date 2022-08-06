import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/app_state/dreams_intervention_list_state/dreams_re_assessment_list_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/app_state/referral_notification_state/referral_notification_state.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';
import 'package:provider/provider.dart';

class InterventionBottomNavigationIcon extends StatelessWidget {
  const InterventionBottomNavigationIcon({
    Key? key,
    required this.currentInterventionBottomNavigation,
    required this.interventionBottomNavigation,
    required this.inactiveColor,
    required this.hasIndicatorValue,
  }) : super(key: key);

  final InterventionBottomNavigation currentInterventionBottomNavigation;
  final InterventionBottomNavigation interventionBottomNavigation;
  final Color? inactiveColor;
  final bool hasIndicatorValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.symmetric(
              vertical: 9.0,
            ),
            child: SvgPicture.asset(
              interventionBottomNavigation.svgIcon!,
              color: currentInterventionBottomNavigation.id ==
                      interventionBottomNavigation.id
                  ? Colors.white
                  : const Color(0xFF737373),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Visibility(
              visible: hasIndicatorValue &&
                  (interventionBottomNavigation.id == "outGoingReferral" ||
                      interventionBottomNavigation.id == "incomingReferral" ||
                      interventionBottomNavigation.id == "enrollment"),
              child: Consumer<InterventionCardState>(
                builder: (context, interventionCardState, child) =>
                    Consumer<DreamsRaAssessmentListState>(
                  builder: ((context, dreamsRaAssessmentListState, child) {
                    int dreamsForReAssessment =
                        dreamsRaAssessmentListState.numberOfDreamsToReAssess;
                    return Consumer<ReferralNotificationState>(
                      builder: (context, referralNotificationState, child) {
                        String incomingReferralsResolved =
                            referralNotificationState
                                .incomingReferralsResolvedIndicator;
                        String incomingReferralToResolve =
                            referralNotificationState
                                .incomingReferralToResolveIndicator;
                        String reAssessedCount = dreamsForReAssessment > 0
                            ? '$dreamsForReAssessment'
                            : '';
                        return ClipOval(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3.0,
                              horizontal: 5.0,
                            ),
                            color:
                                (interventionBottomNavigation.id ==
                                                "outGoingReferral" &&
                                            incomingReferralsResolved != "") ||
                                        (interventionBottomNavigation.id ==
                                                "incomingReferral" &&
                                            incomingReferralToResolve != "") ||
                                        (interventionBottomNavigation.id ==
                                                "enrollment" &&
                                            interventionCardState
                                                    .currentInterventionProgram
                                                    .id ==
                                                'dreams' &&
                                            dreamsForReAssessment > 0)
                                    ? inactiveColor!.withOpacity(0.5)
                                    : inactiveColor!.withOpacity(0.0),
                            child: Text(
                              interventionBottomNavigation.id ==
                                      "outGoingReferral"
                                  ? incomingReferralsResolved
                                  : interventionBottomNavigation.id ==
                                          "incomingReferral"
                                      ? incomingReferralToResolve
                                      : interventionCardState
                                                      .currentInterventionProgram
                                                      .id ==
                                                  'dreams' &&
                                              interventionBottomNavigation.id ==
                                                  "enrollment"
                                          ? reAssessedCount
                                          : '',
                              style: const TextStyle().copyWith(
                                fontWeight: FontWeight.bold,
                                color: currentInterventionBottomNavigation.id ==
                                        interventionBottomNavigation.id
                                    ? Colors.white
                                    : inactiveColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
