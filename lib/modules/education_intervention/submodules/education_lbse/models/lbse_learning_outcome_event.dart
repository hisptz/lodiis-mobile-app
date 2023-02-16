import 'package:kb_mobile_app/models/events.dart';

class LbseLearningOutcomeEvent {
  String? id;
  String? theme;
  String? date;
  String? learningOutcome;
  bool? enrollmentOuAccessible;
  Events? eventData;

  LbseLearningOutcomeEvent({
    this.id,
    this.theme,
    this.learningOutcome,
    this.date,
    this.enrollmentOuAccessible,
    this.eventData,
  });

  LbseLearningOutcomeEvent fromTeiModel(
    Events eventData,
  ) {
    List keys = [
      'kuMzFGnDULh',
      'mm5ZvlsZ6Sx',
    ];
    Map<String, dynamic> data = {};
    for (Map detailObj in eventData.dataValues) {
      String? attribute = detailObj['dataElement'];
      if (attribute != null && keys.contains(attribute)) {
        data[attribute] = '${detailObj['value']}'.trim();
      }
    }
    return LbseLearningOutcomeEvent(
      id: eventData.event,
      theme: data['kuMzFGnDULh'] ?? '',
      learningOutcome: data['mm5ZvlsZ6Sx'] ?? '',
      date: eventData.eventDate,
      enrollmentOuAccessible: eventData.enrollmentOuAccessible,
      eventData: eventData,
    );
  }

  @override
  String toString() {
    return '$theme - $learningOutcome';
  }
}
