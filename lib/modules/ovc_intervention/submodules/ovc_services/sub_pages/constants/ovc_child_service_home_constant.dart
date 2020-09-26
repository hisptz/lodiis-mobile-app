class OvcChildServiceHomeContant {
  String id;
  String title;
  String icon;

  OvcChildServiceHomeContant({this.id, this.title, this.icon});

  static List<OvcChildServiceHomeContant> getOvcChildServiceHomeContant() {
    return [
      OvcChildServiceHomeContant(
          id: 'assessment',
          title: 'Assessment',
          icon: 'assets/icons/child_assessment_ovc_icon.svg'),
      OvcChildServiceHomeContant(
          id: 'casePlan',
          title: 'Case Plan',
          icon: 'assets/icons/child_case_plan_ovc_icon.svg'),
      OvcChildServiceHomeContant(
          id: 'services',
          title: 'Services',
          icon: 'assets/icons/child_service_ovc_icon.svg'),
      OvcChildServiceHomeContant(
          id: 'monitor',
          title: 'Monitor',
          icon: 'assets/icons/child_monitor_ovc_icon.svg'),
    ];
  }
}
