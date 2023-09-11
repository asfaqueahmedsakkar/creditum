import 'package:creditum/app/core/extensions/int_extension.dart';

var _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November' 'December',
];

extension DateExtension on DateTime {
  String toDateString() =>
      "${_months[month - 1].substring(0, 3)} ${day.padded()}, $year";

  String toDateTimeString() =>
      "${_months[month - 1].substring(0, 3)} ${day.padded()}, $year @ ${(hour % 12 == 0 ? 12 : hour % 12).padded()}:${minute.padded()} ${(hour >= 12 ? "PM" : "AM")}";

  bool isSameDay(DateTime date){
    return day == date.day && month == date.month && year == date.year;
  }

}
