class OvcChildServiceHomeConstant {
  String? id;
  String? title;
  String? translatedTitle;
  String? icon;
  bool? groupByDate;
  List<String>? programStages;

  OvcChildServiceHomeConstant({
    this.id,
    this.title,
    this.translatedTitle,
    this.icon,
    this.programStages,
    this.groupByDate,
  }) {
    this.programStages = this.programStages ?? [];
    this.groupByDate = this.groupByDate ?? false;
  }

  static List<OvcChildServiceHomeConstant> getOvcChildServiceHomeConstant() {
    return [
      OvcChildServiceHomeConstant(
          id: 'assessment',
          title: 'Assessment',
          icon: 'assets/icons/child_assessment_ovc_icon.svg',
          programStages: ['Pb1Gb4Aky92', 'GPg1J1xIHT6', 'RJTRRO0wg8H']),
      OvcChildServiceHomeConstant(
          id: 'casePlan',
          title: 'Case Plan',
          icon: 'assets/icons/child_case_plan_ovc_icon.svg',
          groupByDate: true,
          programStages: ['ZHjrdThi7Bz']),
      OvcChildServiceHomeConstant(
        id: 'services',
        title: 'Services',
        translatedTitle: 'Litsebeletso',
        icon: 'assets/icons/child_service_ovc_icon.svg',
        groupByDate: true,
        programStages: ['ZHjrdThi7Bz'],
      ),
      OvcChildServiceHomeConstant(
        id: 'monitor',
        title: 'Monitor',
        groupByDate: false,
        icon: 'assets/icons/child_monitor_ovc_icon.svg',
        programStages: ['dVdlJNtNLIQ', 'ZHjrdThi7Bz'],
      )
    ];
  }
}
