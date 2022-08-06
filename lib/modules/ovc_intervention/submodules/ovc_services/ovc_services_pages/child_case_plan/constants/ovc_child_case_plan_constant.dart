import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class OvcChildCasePlanConstant {
  static const String program = 'em38qztTI8s';
  static const String casePlanProgramStage = 'ZHjrdThi7Bz';
  static const String casePlanGapProgramStage = 'gkNKXUxpyv9';
  static const String casePlanGapServiceProvisionProgramStage = 'CHFwighOquA';
  static const String casePlanGapServiceMonitoringProgramStage = 'v9Vrc5exzam';
  static const Map<String, List<String>> domainToAutopopuledCasePlanGaps = {
    "Health": [
      //Defult for events
      "eventDate",
      "eventId",
      OvcCasePlanConstant.casePlanToGapLinkage,
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
      //Tippy tap
      "DQxqyncQtwm", "P4I6rK6Xqxw", "WFKe1YpH1uK", "YJXb5rSVP0L",
      //Soackage pit
      "qTf8VSoojJ2", "ontonbgTJ8k", "AjYKLfIQPtT", "M2Aqvn027cd",
      //washmessage
      "Hvq9oisH7Gt", "ue6xLPEURqt", "vIbKIUgzBU4", "tQ3pKyJ0X9d"
    ],
    "Stable": [
      //Defult for events
      "eventDate",
      "eventId",
      OvcCasePlanConstant.casePlanToGapLinkage,
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
      //Silc
      "e6NV2ZAzFEh", "JtfKB58MvNK", "MMjndp2xsoQ", "Hdf3EtTGfAb",
      //KPlot
      "WrjNxZBVHCL", "NWBZilCPutW", "boUUP8UeWDL", "d3k97F0fS2y",
    ],
  };

  static const Map<String, List<String>>
      domainToAutopopuledCasePlanServiceProvision = {
    "Health": [
      //Defult for events
      "eventDate",
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
      //Tippy tap
      "FRWCmEerPic", "lQYnoeqfKpe", "IiIVDSKX8yk",
      //Soackage pit
      "qL9c5r7c6kK", "pUphS6E1Gu5", "k5RGRpWRbbs", "SODPuEmHEGV",
      //washmessage
      "gV77yUM8NK8",
      "aqJBZDBzh4m", "EtENRPlSnO0", "JFlnkaXlXm5"
    ],
    "Stable": [
      //Defult for events
      "eventDate",
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
      //Silc
      "xTO562B5g53", "uOMr56xoKDh", "hMdC0CMKSGn",
      //KPlot
      "lEkrLOFmLrH", "F8ALMOcc6C1", "ereN7hP7yuT", "p77CBdxxtHI"
    ],
  };

  static const Map<String, List<String>>
      domainToAutopopuledCasePlanServiceMonitoring = {
    "Health": [
      //Defult for events
      "eventDate",
      "eventId",
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
      //Tippy tap

      //Soackage pit

      //washmessage
    ],
    "Stable": [
      //Defult for events
      "eventDate",
      "eventId",
      OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
      //Silc

      //KPlot
    ],
  };
}
