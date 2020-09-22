class OvcServiceChildModel {
  String iconPath;
  String title;
  int serviceNumber;

  OvcServiceChildModel({this.iconPath, this.serviceNumber, this.title});

  static List<OvcServiceChildModel> serviceChildList = [
    OvcServiceChildModel(
        iconPath: "assets/icons/child_assessment_ovc_icon.svg",
        serviceNumber: 5,
        title: "Asessment"),
    OvcServiceChildModel(
        iconPath: "assets/icons/child_case_plan_ovc_icon.svg",
        serviceNumber: 8,
        title: "Case plan"),
    OvcServiceChildModel(
        iconPath: "assets/icons/child_monitor_ovc_icon.svg",
        serviceNumber: 25,
        title: "Monitor"),
    OvcServiceChildModel(
        iconPath: "assets/icons/child_service_ovc_icon.svg",
        serviceNumber: 5,
        title: "Service"),
  ];

  @override
  String toString() {
    return ("title: $title");
  }
}
