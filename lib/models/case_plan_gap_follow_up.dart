import 'package:kb_mobile_app/models/events.dart';

class CasePlanGapFollowUp {
  String id;
  String date;
  String result;
  String reason;
  String casePlanGapToFollowUpLinkage;
  Events eventData;

  CasePlanGapFollowUp({
    this.id,
    this.date,
    this.result,
    this.reason,
    this.casePlanGapToFollowUpLinkage,
    this.eventData,
  });

  CasePlanGapFollowUp fromTeiModel(
    Events eventData,
    String casePlanGapToFollowUpLinkage,
  ) {
    List reasonIds = [
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
    List resultIds = [
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
    Map data = Map();
    String followupResults = '';
    String followUpReason = '';
    for (Map detailObj in eventData.dataValues) {
      String dataElement = detailObj['dataElement'];
      if (dataElement != null && dataElement == casePlanGapToFollowUpLinkage) {
        data[dataElement] = '${detailObj['value']}'.trim() ?? '';
      } else if (dataElement != null && resultIds.indexOf(dataElement) > -1) {
        followupResults =
            detailObj['value'] != null && '${detailObj['value']}'.trim() != ''
                ? '${detailObj['value']}'.trim()
                : followupResults;
      } else if (dataElement != null && reasonIds.indexOf(dataElement) > -1) {
        followUpReason =
            detailObj['value'] != null && '${detailObj['value']}'.trim() != ''
                ? '${detailObj['value']}'.trim()
                : followUpReason;
      }
    }
    return CasePlanGapFollowUp(
      id: eventData.event,
      casePlanGapToFollowUpLinkage: data[casePlanGapToFollowUpLinkage] ?? '',
      date: eventData.eventDate,
      result: followupResults,
      reason: followUpReason,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $result';
  }
}
