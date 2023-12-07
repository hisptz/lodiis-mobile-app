import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_services/constants/ovc_case_plan_constant.dart';

class OvcChildCasePlanConstant {
  static const String program = 'em38qztTI8s';
  static const String casePlanProgramStage = 'ZHjrdThi7Bz';
  static const String casePlanGapProgramStage = 'gkNKXUxpyv9';
  static const String casePlanGapServiceProvisionProgramStage = 'CHFwighOquA';
  static const String casePlanGapServiceMonitoringProgramStage = 'v9Vrc5exzam';

  static List<String> getValidIdForAutoPopulatingServiceData({
    required Map domainConfig,
    required int age,
  }) {
    List<String> validIds = domainConfig['generic'] ?? [];
    List ageBased = domainConfig["ageBased"] ?? [];
    if (ageBased.isNotEmpty) {
      for (Map ageBasedConfig in ageBased) {
        int? minAge = ageBasedConfig['minAge'];
        int? maxAge = ageBasedConfig['maxAge'];
        if (minAge != null && maxAge != null && age >= minAge && age < maxAge) {
          List<String> ids = ageBasedConfig["ids"] ?? [];
          validIds.addAll(ids);
        }
      }
    }
    return validIds;
  }

  static const Map<String, Map> domainToAutopopuledCasePlanGaps = {
    "Health": {
      "generic": [
        //Defult for events
        "eventDate",
        OvcCasePlanConstant.casePlanToGapLinkage,
        OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
        OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
        // FOOD PREV
        "AwWKp6KmqgY", "cXCdR7BvrSM", "u8yn7sY5eOX", "Mu0LxlAOoSp",
        // FOOD PREP
        "JSQ3xP1NhuN", "k6jzyzGOu5Y", "HrCyUkuZath", "MdmCqSwcrlk",
        //FOOD SUPPORT
        "EaJTFrklMo5", "rHgxOKM91wi", "v00dsDvhCRu", "WAq2HJHXZYS",
        //TIPPY TAP
        "DQxqyncQtwm", "P4I6rK6Xqxw", "WFKe1YpH1uK", "YJXb5rSVP0L",
        // WASH MESSAGE
        "Hvq9oisH7Gt", "ue6xLPEURqt", "vIbKIUgzBU4", "tQ3pKyJ0X9d",
        //SOACKAGE PIT
        "qTf8VSoojJ2", "ontonbgTJ8k", "AjYKLfIQPtT", "M2Aqvn027cd",
      ],
      "ageBased": []
    },
    "Safe": {
      "generic": [
        //Defult for events
        "eventDate",
        OvcCasePlanConstant.casePlanToGapLinkage,
        OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
        OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
        //RTEEN/Parenting
        "WiPTQhWLVU1", "E2CWztOcx2X", "xFXc0oacTEb", "BpLk6ruSL7e"
      ],
      "ageBased": [
        {
          "minAge": 0,
          "maxAge": 5,
          "ids": [
            //P&FC
            "PoxYSqq8Hgz", "O3mOdzWYmg3", "WFscqdyjgUy", "fCDk1LxN484"
          ],
        },
      ]
    },
    "Stable": {
      "generic": [
        //Defult for events
        "eventDate",
        OvcCasePlanConstant.casePlanToGapLinkage,
        OvcCasePlanConstant.casePlanGapToServiceProvisionLinkage,
        OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
        // SILC
        "e6NV2ZAzFEh", "JtfKB58MvNK", "MMjndp2xsoQ", "Hdf3EtTGfAb",
        // K/TPLOTS
        'WrjNxZBVHCL', "NWBZilCPutW", "boUUP8UeWDL", "d3k97F0fS2y"
      ],
      "ageBased": [
        {
          "minAge": 9,
          "maxAge": 18,
          "ids": [
            // FINANCIAL EDUCATION
            "kvF996ugmMl", "OMtcDA7tcVL", "Mz24UpWclb3", "zVCkEJuy2t8",
          ],
        },
      ]
    },
  };

  static const Map<String, List<String>> domainToAutopopuledCasePlanServiceProvision = {
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

  static const Map<String, List<String>> domainToAutopopuledCasePlanServiceMonitoring = {
    "Health": [
      //Defult for events
      "eventDate",
      "eventId",
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
      //Tippy tap
      "TaSyHHXKYhF",
      //Soackage pit
      "W4UjM09aOEw",
      //washmessage
      "qezhtOHXgaK"
    ],
    "Stable": [
      //Defult for events
      "eventDate",
      "eventId",
      OvcCasePlanConstant.casePlanGapToMonitoringLinkage,
      //Silc
      "wNUBfCAg3Fq",
      //KPlot
      "legjCg7fomo",
    ],
  };
}
