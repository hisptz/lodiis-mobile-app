class InterventionBottomNavigation {
  String id;
  String name;
  String svgIcon;

  InterventionBottomNavigation(
      {this.id = '', this.name = '', this.svgIcon = ''});

  static List<InterventionBottomNavigation> getInterventionNavigationButtons() {
    return [
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
    ];
  }

  @override
  String toString() {
    return '$name - $id';
  }
}
