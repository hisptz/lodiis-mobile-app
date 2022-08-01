import 'package:kb_mobile_app/models/events.dart';

class OvcCasePlanConstant {
  static const String casePlanToGapLinkage = 'ajqTV28fydL';
  static const String casePlanGapToMonitoringLinkage = 'H7BMnqZEqGN';
  static const String casePlanGapToServiceProvisionLinkage = 'tDWIRBsuwsB';
  static const String casePlanDomainType = 'vexrPNgPBYg';
  static const String casePlanFirstGoal = 'ADc3clrQRl4';
  static const String casePlanGapNeed = 'QjlTTO5KAIf';
  static const List<String> casePlanServiceProvisionResults = [
    'gwwUOs6yt6C',
    'gV77yUM8NK8',
    'qL9c5r7c6kK',
    'FRWCmEerPic',
    'xTO562B5g53',
    'lpTVK3t1Ahk',
    'kcoDiGNXWpA',
    'fgDPoYtifQI',
    'cbqS6IoSbwI',
    'lEkrLOFmLrH',
    'BYu8pI5kGXF',
    'JnqldNamliR',
    'YFgrURiwirq',
    'HzI5X2yHef6',
    'eqhzeRBMftZ',
    'ESIjwQ9S6Ic',
    'r8wPQAog7PJ',
    'UKczyQWCB0L',
    'KkqMjxjAR7g',
    'mRoO7kgpgVg',
    'GNQ3gDA2CTI',
    'gSp9bgPW52L',
    'mY7GqOTKtsQ',
    'zK7kMYpgPQn',
    'tnspdPfpuXm',
    'QnFYeBNZlbf',
    'KvLYMr8F4vg',
    'AnnOS2m6LZK',
    'kcoDiGNXWpA',
    'fgDPoYtifQI',
    'cbqS6IoSbwI',
    'RNKOtUtLT4c',
    'GImA3HB9YK5',
    'Fj2RbXsb8Yj',
    'rMtSykWZ4HB',
    'cuy4Ai7mBbA',
    'ysDSdiL7wNx',
    'vj0R7ySdigX',
    'JlRnllAlSk0',
    'UZJ9vqIabAY',
    'gfKsz88uxtg',
    'aGChpBlIzcd',
    'LcIB5EL3IjT',
    'EYhFIkTpUS3',
    'IiKUlAeSIE3',
    'hg2bpp1HqwU',
    'fvgPnlOD7e9',
    'MeMaUvt3O8j',
    'WQlWXUmYjI2',
    'Zc0M1jsbfyA',
    'TSx4O9Tf5v2',
    'QDFZ03HbjGj'
  ];
  static const List<String> casePlanServiceProvisionReasons = [
    'W5lbgijaXA6',
    'sxlVgySosg3',
    'i9icxSZ8HCf',
    'y8ToqnbVz1o',
    'AStxMCkJhi5',
    'GISFLEttRtU',
    'itTgPQ0OrMU',
    'wZLjymsKsuj',
    'Jxlug5I3kdu',
    'YSsfKXdIRLG',
    'aDOvfQ1wdIX',
    'pSkl6ibruvU',
    'kBivIQr6mrW',
    'g2X9vUL2d9m',
    'eXh6Gag1uwp',
    'xdI5atw8DC4',
    'TN5r1EFmHWz',
    'xECpX8Vt1rT',
    'Z6VwHVRIh48',
    'TNmg7uRUWgC',
    'KpUgwivl5Cr',
    'EB3JPVqMdb4',
    'IFggJCXLYPD',
    'EPwDypaz61A',
    'OMhFxj6SYhM',
    'h10Iktl4KKR',
    'XUoqvbk0uVH',
    'tmi1jtKYZs0',
    'ONC3bpjq525',
    'U8h0daQzXXk',
    'iz4CvIFovsF',
    'cb773khL7XB',
    'WVsVwfErZ7V',
    'VlReEXXH1WN',
    'sD0zbIksKTY',
    'Riyr0nniCVo',
    'yuwtSD8EyoY',
    'KppYygPZ8BL',
    'CxREUNzKxHB',
    'QCbFgssCzeF',
    'rJaHpLnWvfg',
    'p77CBdxxtHI',
    'KpUgwivl5Cr',
    'TNmg7uRUWgC',
    'Z6VwHVRIh48',
    'QnfPxpJvb1D',
    'hMdC0CMKSGn',
    'w4EYZpbtUV8',
    'SODPuEmHEGV',
    'JFlnkaXlXm5',
    'KWk8waoLO7N',
    'aG42nUguLLW'
  ];

  static Map getMappedCasePlanWithGapsByDomain(
    List<Events> casePlanEvents,
    List<Events> casePlanGapsEvents,
  ) {
    Map sanitizedDataObject = {};
    List<Map> mappedCasePlanGaps =
        OvcCasePlanConstant.getMappedCasePlanGaps(casePlanGapsEvents)
            as List<Map<dynamic, dynamic>>;
    for (Events casePlanEvent in casePlanEvents) {
      Map data = OvcCasePlanConstant.getMappedEventObject(casePlanEvent);
      String casePlanToGapLinkageValue =
          data[OvcCasePlanConstant.casePlanToGapLinkage] ??
              'casePlanToGapLinkage';
      data['gaps'] = mappedCasePlanGaps
          .where((Map data) =>
              casePlanToGapLinkageValue.trim() != '' &&
              data.containsValue(casePlanToGapLinkageValue))
          .toList();
      if (data.containsKey(OvcCasePlanConstant.casePlanDomainType)) {
        sanitizedDataObject[data[OvcCasePlanConstant.casePlanDomainType]] =
            data;
      }
    }
    return sanitizedDataObject;
  }

  static List getMappedCasePlanGaps(
    List<Events> casePlanGapsEvents,
  ) {
    return casePlanGapsEvents
        .map((Events eventData) => getMappedEventObject(eventData))
        .toList();
  }

  static Map getMappedEventObject(Events eventData) {
    Map map = {};
    map['eventDate'] = eventData.eventDate;
    map['eventId'] = eventData.event;
    for (Map dataValue in eventData.dataValues) {
      if ('${dataValue['value']}'.trim() != '') {
        map[dataValue['dataElement']] = dataValue['value'];
      }
    }
    return map;
  }
}
