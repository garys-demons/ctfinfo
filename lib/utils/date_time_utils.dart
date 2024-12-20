class DateTimeUtils {
  static final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  static String getFormattedTime(String dateTime) {
    final String fullTime = dateTime.split('T')[1];
    final String time = '${fullTime.split(':')[0]}:${fullTime.split(':')[1]}';
    return time;
  }

  static String getFormattedDate(String dateTime) {
    final String fullDate = dateTime.split('T')[0];
    final String date = fullDate.split('-')[2];
    final String month = fullDate.split('-')[1];
    final String year = fullDate.split('-')[0];
    return '$date ${months[int.parse(month) - 1]} $year';
  }
}
