import 'package:kb_mobile_app/models/events.dart';

class CasePlanGapFollowUp {
  String id;
  String date;
  String result;
  String reason;
  String casePlanGapToFollowinUpLinkage;
  Events eventData;

  CasePlanGapFollowUp({
    this.id,
    this.date,
    this.result,
    this.reason,
    this.casePlanGapToFollowinUpLinkage,
    this.eventData,
  });

  CasePlanGapFollowUp fromTeiModel(
    Events eventData,
    String casePlanGapToFollowinUpLinkage,
  ) {
    List reasonIds = [
      'jBlJhUFzHDN',
      'whIcXFKztLy',
      'mNKqSsW5FyE',
      'gEiKTWFdTDR',
      'QSGJF5uy3s1',
      'IZyIR4gdGHH',
      'OTQ2AmiJTsd',
      'NaQd6h96kQu',
      'R1CLwUrULl4',
      'uUVW07YYELA',
      'BsYbWvITaTO',
      'rqoRLKfOz1X',
      'U3OirYxhmZ3',
      'RCG0ohFiNym',
      'N6cgKEcBkT4',
      'NkQ3F4cqYMQ',
      'ST3KYyn9AUb',
      'lEr87UA4ecO',
      'sSFwyRvfzCN',
      'x4V6Yh6LvJs',
      'DTHXODoARku',
      'uhwmhQuRbUy',
      'vV9iBTXHtCv',
      'FfhMRIKszu3',
      'pKgBXzMDJgd',
      'kKR2XpajAzo',
      'c3YpE03Omap',
      'O6Qu5NzSgQn',
      'BYoXCG1xAro',
      'euIQlU1MKYj',
      'ruf1RhT5l9k',
      'kzv81ioLFRX',
      'ArkWJ0TUaSi',
      'FkCg8sWsq07',
      'YunlkvLZnoY',
      'I7UH0WwKGZI',
      'z0jJcSOiJ8j',
      'RIhHpWTry4e',
      'AR0rxfsD8Nx',
      'NCR4KJhMra5',
      'IudkpcChyyO',
      'B2dFwKf4AmX',
      'GgpyEuYY7cm',
      'dPXH2ODY0aD',
      'ZdTCSQMnqIz',
      'bGhjAinKNWT',
      'NejOFo7hXcl',
      'yuI2h1iaF0S'
    ];
    List resultIds = [
      'qoT16RqF0AW',
      'AxGWsUhzPdO',
      'ZrX6iFwSFdI',
      'FLxulMZBB8P',
      'GXiyFeuJAEO',
      'i37SPKK7tv2',
      'AHpXZXFUeVp',
      'HhlAKX5erk4',
      'As5nDUZA4bB',
      'XAdRNtFaJrW',
      'dYXGYJAkMjm',
      'ofKPDgInoED',
      'rCoESQBRoWQ',
      'Jyr5fwQFmin',
      'kg8HJ6qihcV',
      'bmFT0AV8ZXv',
      'i4bl7zHws9D',
      'ssHdcYq1IMO',
      'GUtvvHnjdxo',
      'glwwR6j93BC',
      'ujRjcCXrDIQ',
      'N3EJnMcHYhd',
      'VhxUu6aLkMA',
      'fEmt4VhSOvd',
      'LW6zZlSlP9P',
      'rGtX9VyOOAb',
      'nsGf9zTVrR8',
      'FKqpxT2LoVK',
      'jFOpXW5vEdz',
      'txZRxI3C8wW',
      'jH9hAU5NhWB',
      'pvonlFmi4K0',
      'TgCXgdny2Xe',
      'midyHOIjh5q',
      'lmYzX0g8YqA',
      'FVVQ9E2DrD7',
      'yG6IpwrMGjE',
      'Fhuw28RcqJf',
      'EpWQo1uCBLn',
      'VoMWh6QVeUM',
      'vo9dTXq3TK4',
      'kUahCyGuIra',
      'Rg2LB1YtRaY',
      'BDk0CYuQYGB',
      'pfEyKGoezfY',
      'FCz2oClbBs2',
      'DRsYIjVp8a6',
      'aGPDNhnjIBK'
    ];
    Map data = Map();
    String followupResults = '';
    String folloupReason = '';
    for (Map detailObj in eventData.dataValues) {
      String dataElement = detailObj['dataElement'];
      if (dataElement != null &&
          dataElement == casePlanGapToFollowinUpLinkage) {
        data[dataElement] = '${detailObj['value']}'.trim() ?? '';
      } else if (dataElement != null && resultIds.indexOf(dataElement) > -1) {
        followupResults =
            detailObj['value'] != null && '${detailObj['value']}'.trim() != ''
                ? '${detailObj['value']}'.trim()
                : followupResults;
      } else if (dataElement != null && reasonIds.indexOf(dataElement) > -1) {
        folloupReason =
            detailObj['value'] != null && '${detailObj['value']}'.trim() != ''
                ? '${detailObj['value']}'.trim()
                : folloupReason;
      }
    }
    return CasePlanGapFollowUp(
      id: eventData.event,
      casePlanGapToFollowinUpLinkage:
          data[casePlanGapToFollowinUpLinkage] ?? '',
      date: eventData.eventDate,
      result: followupResults,
      reason: folloupReason,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$id $result';
  }
}
