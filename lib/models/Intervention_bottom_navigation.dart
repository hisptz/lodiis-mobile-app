import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionBottomNavigation {
  String? id;
  String? name;
  String? translatedName;
  String? svgIcon;

  InterventionBottomNavigation({
    this.id,
    this.name,
    this.translatedName,
    this.svgIcon,
  });

  static List<InterventionBottomNavigation>
      defaultInterventionNavigationButtons = [
    InterventionBottomNavigation(
      id: 'lbse',
      name: 'LBSE',
      svgIcon: 'assets/icons/lbse-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'bursary',
      name: 'Bursary',
      svgIcon: 'assets/icons/bursary-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'enrollment',
      name: 'Enrollment',
      translatedName: 'Ngoliso',
      svgIcon: 'assets/icons/enrollment-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'services',
      name: 'Services',
      translatedName: 'Litsebeletso',
      svgIcon: 'assets/icons/services-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'referral',
      name: 'Referral',
      svgIcon: 'assets/icons/referral-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'outGoingReferral',
      name: 'Outgoing Referral',
      svgIcon: 'assets/icons/out-going-referral-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'incomingReferral',
      name: 'Incoming Referral',
      svgIcon: 'assets/icons/incoming-referral-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'exit',
      name: 'Exit',
      svgIcon: 'assets/icons/exit-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'noneAgyw',
      name: 'KB PrEP',
      svgIcon: 'assets/icons/none-agyw-navigation-icon.svg',
    ),
    InterventionBottomNavigation(
      id: 'records',
      name: 'Records',
      svgIcon: 'assets/icons/records-navigation-icon.svg',
    ),
  ];

  static List<InterventionBottomNavigation> getInterventionNavigationButtons(
    InterventionCard activeInterventionProgram,
  ) {
    List<String> supportedTabs = activeInterventionProgram.supportedTabs ?? [];
    return defaultInterventionNavigationButtons
        .where((InterventionBottomNavigation interventionBottomNavigation) {
      return supportedTabs.contains(interventionBottomNavigation.id!);
    }).toList();
  }

  @override
  String toString() {
    return '$name - $id';
  }
}
