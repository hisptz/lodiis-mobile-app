class DateConversionUtil {
  static String getDaysBetweenTestingAndInformedResult(
      DateTime testDate, DateTime resultDate) {
    Duration days = resultDate.difference(testDate);
    return '${days.inDays}';
  }

  static String getWeeksBetweenTestingAndInformedResult(
      DateTime testDate, DateTime resultDate) {
    Duration days = resultDate.difference(testDate);
    double weeks = days.inDays / 7;
    return '${weeks.floor()}';
  }

  static String getMinutesBetweenTestingAndInformedResult(
      DateTime testDate, DateTime resultDate) {
    Duration days = resultDate.difference(testDate);
    return '${days.inMinutes}';
  }

  static String getHoursBetweenTestingAndInformedResult(
      DateTime testDate, DateTime resultDate) {
    Duration days = resultDate.difference(testDate);
    return '${days.inHours}';
  }
}
