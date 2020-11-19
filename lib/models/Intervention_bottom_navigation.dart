import 'package:kb_mobile_app/models/intervention_card.dart';

class InterventionBottomNavigation {
  String id;
  String name;
  String translatedName;
  String svgIcon;

  InterventionBottomNavigation({
    this.id,
    this.name,
    this.translatedName,
    this.svgIcon,
  });

  static List<InterventionBottomNavigation>
      defaultInterventionNavigationButtons = [
    InterventionBottomNavigation(
        id: 'services',
        name: 'Services',
        svgIcon: 'assets/icons/services-navigation-icon.svg'),
    InterventionBottomNavigation(
        id: 'referral',
        name: 'Referral',
        svgIcon: 'assets/icons/referral-navigation-icon.svg'),
    InterventionBottomNavigation(
        id: 'enrollment',
        name: 'Enrollment',
        svgIcon: 'assets/icons/enrollment-navigation-icon.svg'),
    InterventionBottomNavigation(
        id: 'exit',
        name: 'Exit',
        svgIcon: 'assets/icons/exit-navigation-icon.svg'),
    InterventionBottomNavigation(
        id: 'records',
        name: 'Records',
        svgIcon: 'assets/icons/records-navigation-icon.svg'),
    InterventionBottomNavigation(
        id: 'noneAgyw',
        name: 'None AGYW',
        svgIcon: 'assets/icons/none-agyw-navigation-icon.svg'),
  ];

  static List<InterventionBottomNavigation> getInterventionNavigationButtons(
      InterventionCard activeInterventionProgram) {
    return defaultInterventionNavigationButtons
        .where((InterventionBottomNavigation interventionBottomNavigation) {
      return interventionBottomNavigation.id == 'records' ||
              interventionBottomNavigation.id == 'exit'
          ? activeInterventionProgram.id == 'ovc'
          : interventionBottomNavigation.id == 'noneAgyw'
              ? activeInterventionProgram.id == 'dreams'
              : true;
    }).toList();
  }

  @override
  String toString() {
    return '$name - $id';
  }
}
