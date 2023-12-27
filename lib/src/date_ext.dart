

extension DateExtension on DateTime {
  
  // Constants for month names, month abbreviations, weekday names, and weekday abbreviations.
  static const List<String> _monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  static const List<String> _monthAbbreviations = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static const List<String> _weekdayNames = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
  ];

  static const List<String> _weekdayAbbreviations = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];
  
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

  /// Checks if `DateTime` is the first day of the month
  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth);

  /// Checks if `DateTime` is the last day of the month
  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth);

  /// Returns `DateTime` of the first day of the month of `this`
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

  /// Get exact `DateTime` of previous month
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

  /// Get exact `DateTime` of coming month
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

  /// Get exact `DateTime` of previous week
  DateTime get previousWeek => subtract(const Duration(days: 7));

  /// Get exact `DateTime` of coming week
  DateTime get nextWeek => add(const Duration(days: 7));

  /// Check if two `DateTime` are in the same week
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

  /// Formats the date and time according to the specified pattern.
  ///
  /// The pattern can include various placeholders representing components
  /// of the date and time, such as 'yyyy' for the year, 'MM' for the month,
  /// and so on. See the documentation for a list of supported placeholders.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// DateTime now = DateTime.now();
  /// print(now.format('yyyy-MM-dd – HH:mm'));      // Example 1
  /// print(now.format('dd/MMM/yyyy hh:mm:ss a'));  // Example 2
  /// print(now.format('EEEE, MMMM d, yyyy'));       // Example 3
  /// ```
  String format(String pattern) {
    final Map<String, String> formatPlaceholders = {
      'yyyy': this.year.toString(),
      'yy': this.year.toString().substring(2),
      'MMMM': _monthNames[this.month - 1],
      'MMM': _monthAbbreviations[this.month - 1],
      'MM': _twoDigits(this.month),
      'M': this.month.toString(),
      'dd': _twoDigits(this.day),
      'd': this.day.toString(),
      'HH': _twoDigits(this.hour),
      'hh': _twoDigits(this.hour % 12),
      'mm': _twoDigits(this.minute),
      'ss': _twoDigits(this.second),
      'a': this.hour < 12 ? 'AM' : 'PM',
      'EEEE': _weekdayNames[this.weekday - 1],
      'EEE': _weekdayAbbreviations[this.weekday - 1],
    };

    String result = pattern;
    formatPlaceholders.forEach((placeholder, value) {
      result = result.replaceAll(placeholder, value);
    });

    return result;
  }

  /// Adds a leading zero to a single-digit number to ensure it has two digits.
  String _twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    }
    return '0$n';
  }

  /// Get difference in Days
  int diffDays(DateTime b) => this.difference(b).inDays;

  /// Get difference in Hours
  int diffHours(DateTime b) => this.difference(b).inHours;

  /// Get difference in Minutes
  int diffMinutes(DateTime b) => this.difference(b).inMinutes;

  /// Get difference in Seconds
  int diffSeconds(DateTime b) => this.difference(b).inSeconds;

  /// Get difference between two `DateTime` in years, month and days
  ///
  /// If you want your string in y, m and d than pass true to `abbr`, by default its false.
  ///
  /// Example:
  /// dateTime.diffYearsMonthsDays(DateTime.now().add(Duration(days: 500))) => 1 year 4 months 15 days
  ///
  /// dateTime.diffYearsMonthsDays(DateTime.now().add(Duration(days: 370)), abbr: true) => 1 y 5 d
  ///
  /// *This method provides an approximation and may not be entirely accurate, especially when dealing with leap years and months of varying lengths.
  String diffYearsMonthsDays(DateTime b, {bool abbr = false}) {
    final totalDays = this.diffDays(b).abs();
    final years = totalDays ~/ 365;
    final months = (totalDays % 365) ~/ 30;
    final days = (totalDays % 365) % 30;
    String res = '';

    if (years != 0) {
      if (abbr) {
        res = res + "$years y ";
      } else {
        res = res + "$years ${years > 1 ? "years" : "year"} ";
      }
    }
    if (months != 0) {
      if (abbr) {
        res = res + "$months m ";
      } else {
        res = res + "$months ${months > 1 ? "months" : "month"} ";
      }
    }
    if (days != 0) {
      if (abbr) {
        res = res + "$days d";
      } else {
        res = res + "$days ${days > 1 ? "days" : "day"}";
      }
    }
    return res;
  }
}
