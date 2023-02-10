import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kb_mobile_app/models/Intervention_bottom_navigation.dart';

class InterventionBottomNavigationIcon extends StatelessWidget {
  const InterventionBottomNavigationIcon({
    Key? key,
    required this.currentInterventionBottomNavigation,
    required this.interventionBottomNavigation,
  }) : super(key: key);

  final InterventionBottomNavigation currentInterventionBottomNavigation;
  final InterventionBottomNavigation interventionBottomNavigation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
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
    );
  }
}
