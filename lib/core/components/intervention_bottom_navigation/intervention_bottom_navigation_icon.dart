import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(
              vertical: 9.0,
            ),
            child: SvgPicture.asset(
              interventionBottomNavigation.svgIcon!,
              color: currentInterventionBottomNavigation.id ==
                      interventionBottomNavigation.id
                  ? Colors.white
                  : Color(0xFF737373),
            ),
          ),
          Container(
            child: Positioned(
              right: 0,
              top: 0,
              child: Visibility(
                visible: hasIndicatorValue &&
                    (interventionBottomNavigation.id == "outGoingReferral" ||
                        interventionBottomNavigation.id == "incomingReferral"),
                child: Container(
                  child: Consumer<ReferralNotificationState>(
                    builder: (context, referralNotificationState, child) {
                      String incomingReferralsResolved =
                          referralNotificationState
                              .incomingReferralsResolvedIndicator;
                      String incomingReferralToResolve =
                          referralNotificationState
                              .incomingReferralToResolveIndicator;
                      return ClipOval(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.0,
                            horizontal: 5.0,
                          ),
                          color: (interventionBottomNavigation.id ==
                                          "outGoingReferral" &&
                                      incomingReferralsResolved != "") ||
                                  (interventionBottomNavigation.id ==
                                          "incomingReferral" &&
                                      incomingReferralToResolve != "")
                              ? inactiveColor!.withOpacity(0.5)
                              : inactiveColor!.withOpacity(0.0),
                          child: Text(
                            interventionBottomNavigation.id ==
                                    "outGoingReferral"
                                ? incomingReferralsResolved
                                : incomingReferralToResolve,
                            style: TextStyle().copyWith(
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
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
