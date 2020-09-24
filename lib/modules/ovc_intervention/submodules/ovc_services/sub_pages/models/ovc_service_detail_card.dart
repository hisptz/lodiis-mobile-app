class OvcChildServiceDetailCard {
  String assessmentDate;
  String healthStates;
  String casePlan;
  String service;
  String serviceDate;
  String casePlanDate;
  bool showBorderColor;

  OvcChildServiceDetailCard(
      {this.assessmentDate,
      this.healthStates,
      this.casePlan,
      this.service,
      this.serviceDate,
      this.casePlanDate,
      this.showBorderColor}) {
    this.showBorderColor = false;
    
  }

  static List<OvcChildServiceDetailCard> ovcChildServiceDetailCardSeed = [
   OvcChildServiceDetailCard(assessmentDate:"12 Aug 2020",healthStates: "WellBeing",casePlanDate:"12 Aug 2020",casePlan: "Caseplan3",showBorderColor: true,service: "Service",serviceDate: "24 June 2020" ),
   OvcChildServiceDetailCard(assessmentDate:"09 Aug 2020",healthStates: "TB",casePlanDate: "09 Aug 2020",casePlan: "Caseplan2",service: "School",serviceDate: "20 June 2020"),
   OvcChildServiceDetailCard(assessmentDate:"09 Aug 2020",healthStates: "HIV",casePlanDate: "09 Aug 2020",casePlan: "Caseplan1",service: "Service",serviceDate: "16 June 2020"),
   OvcChildServiceDetailCard(assessmentDate:"04 Aug 2020",healthStates: "HIV",),
   OvcChildServiceDetailCard(assessmentDate:"01 Aug 2020",healthStates: "WellBeing",)
  ];
}
