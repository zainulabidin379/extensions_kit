import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.addDays(1);
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  /// Returns a [DateTime] with the date of the original, but time set to
  /// midnight.
  DateTime get dateOnly => DateTime(year, month, day);

  /// Returns [true] if date is on the same day as today otherwise [false]
  bool get isToday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  /// Returns [true] if date was on the same day as yesterday otherwise [false]
  bool get isYesterday {
    final nowDate = DateTime.now();
    return year == nowDate.year &&
        month == nowDate.month &&
        day == nowDate.day - 1;
  }

  /// Returns [true] if the date will be on the same day as tomorrow otherwise [false]
  bool get isTomorrow {
    final nowDate = DateTime.now();
    return year == nowDate.year &&
        month == nowDate.month &&
        day == nowDate.day + 1;
  }

  /// Add a certain amount of days to this date
  DateTime addDays(int amount) => DateTime(
        year,
        month,
        day + amount,
        hour,
        minute,
        second,
        millisecond,
        microsecond,
      );

  /// Add a certain amount of hours to this date
  DateTime addHours(int amount) => DateTime(
        year,
        month,
        day,
        hour + amount,
        minute,
        second,
        millisecond,
        microsecond,
      );

  /// The day after this [DateTime]
  DateTime get nextDay => addDays(1);

  /// The day previous this [DateTime]
  DateTime get previousDay => addDays(-1);

  /// Whether or not two times are on the same day.
  bool isSameDay(DateTime b) =>
      year == b.year && month == b.month && day == b.day;

  /// The list of days in a given month
  List<DateTime> get daysInMonth {
    var first = firstDayOfMonth;
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = lastDayOfMonth;

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    var lastToDisplay = last.add(Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth);

  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth);

  DateTime get firstDayOfMonth => DateTime(year, month);

  DateTime get firstDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(year, month, this.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar works from Sunday - Monday
    var decreaseNum = day.weekday % 7;
    return subtract(Duration(days: decreaseNum));
  }

  DateTime get lastDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(year, month, this.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar's Week starts on Sunday
    var increaseNum = day.weekday % 7;
    return day.add(Duration(days: 7 - increaseNum));
  }

  /// The last day of a given month
  DateTime get lastDayOfMonth {
    var beginningNextMonth =
        (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  DateTime get previousMonth {
    var year = this.year;
    var month = this.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month);
  }

  DateTime get nextMonth {
    var year = this.year;
    var month = this.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month);
  }

  DateTime get previousWeek => subtract(const Duration(days: 7));

  DateTime get nextWeek => add(const Duration(days: 7));

  bool isSameWeek(DateTime b) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final a = DateTime.utc(year, month, day);
    b = DateTime.utc(b.year, b.month, b.day);

    final diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    final min = a.isBefore(b) ? a : b;
    final max = a.isBefore(b) ? b : a;
    final result = max.weekday % 7 - min.weekday % 7 >= 0;
    return result;
  }

  /// Formats `DateTime` into readable form according to the given format
  ///
  /// Example:
  ///
  /// DateTime.now().format("dd/MM/yyyy - hh:mm a") => 20/12/2023 - 08:00 PM
  ///
  /// Formatting notations and their Meaning:
  ///
  /// ABBR_MONTH = 'MMM';
  ///
  /// DAY = 'd';
  ///
  /// ABBR_WEEKDAY = 'E';
  ///
  /// WEEKDAY = 'EEEE';
  ///
  /// ABBR_STANDALONE_MONTH = 'LLL';
  ///
  /// STANDALONE_MONTH = 'LLLL';
  ///
  /// NUM_MONTH = 'M';
  ///
  /// NUM_MONTH_DAY = 'Md';
  ///
  /// NUM_MONTH_WEEKDAY_DAY = 'MEd';
  ///
  /// ABBR_MONTH_DAY = 'MMMd';
  ///
  /// ABBR_MONTH_WEEKDAY_DAY = 'MMMEd';
  ///
  /// MONTH = 'MMMM';
  ///
  /// MONTH_DAY = 'MMMMd';
  ///
  /// MONTH_WEEKDAY_DAY = 'MMMMEEEEd';
  ///
  /// ABBR_QUARTER = 'QQQ';
  ///
  /// QUARTER = 'QQQQ';
  ///
  /// YEAR = 'y';
  ///
  /// YEAR_NUM_MONTH = 'yM';
  ///
  /// YEAR_NUM_MONTH_DAY = 'yMd';
  ///
  /// YEAR_NUM_MONTH_WEEKDAY_DAY = 'yMEd';
  ///
  /// YEAR_ABBR_MONTH = 'yMMM';
  ///
  /// YEAR_ABBR_MONTH_DAY = 'yMMMd';
  ///
  /// YEAR_ABBR_MONTH_WEEKDAY_DAY = 'yMMMEd';
  ///
  /// YEAR_MONTH = 'yMMMM';
  ///
  /// YEAR_MONTH_DAY = 'yMMMMd';
  ///
  /// YEAR_MONTH_WEEKDAY_DAY = 'yMMMMEEEEd';
  ///
  /// YEAR_ABBR_QUARTER = 'yQQQ';
  ///
  /// YEAR_QUARTER = 'yQQQQ';
  ///
  /// HOUR24 = 'H';
  ///
  /// HOUR24_MINUTE = 'Hm';
  ///
  /// HOUR24_MINUTE_SECOND = 'Hms';
  ///
  /// HOUR = 'j';
  ///
  /// HOUR_MINUTE = 'jm';
  ///
  /// HOUR_MINUTE_SECOND = 'jms';
  ///
  String format(String format) => DateFormat(format).format(this);
}
