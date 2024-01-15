/// Extensions for adding additional functionality to the [DateTime].
extension DateExtension on DateTime {
  // Constants for month names, month abbreviations, weekday names, and weekday abbreviations.
  static const List<String> _monthNames = [
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
    'November',
    'December',
  ];

  static const List<String> _monthAbbreviations = [
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
    'Dec',
  ];

  static const List<String> _weekdayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  static const List<String> _weekdayAbbreviations = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  /// Returns a sequence of [DateTime] instances for each day within the given range.
  ///
  /// The range is inclusive for the [start] date and exclusive for the [end] date.
  ///
  /// Example:
  /// ```dart
  /// DateTime startDate = DateTime(2022, 1, 8);
  /// DateTime endDate = DateTime(2022, 1, 12);
  ///
  /// Iterable<DateTime> dateRange = DateTime.daysInRange(startDate, endDate);
  /// print(dateRange.toList());  // [2022-01-08 00:00:00.000, ..., 2022-01-11 00:00:00.000]
  /// ```
  ///
  /// The `daysInRange` method generates a sequence of [DateTime] instances starting
  /// from the [start] date and continuing until, but not including, the [end] date.
  /// It accounts for time zone changes during the iteration.
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

  /// Returns a [DateTime] with the date of the original, but time set to midnight.
  ///
  /// Example:
  /// ```dart
  /// DateTime fullDateTime = DateTime(2022, 1, 8, 15, 30);
  /// DateTime dateOnly = fullDateTime.dateOnly;
  /// print(dateOnly);  // 2022-01-08 00:00:00.000
  /// ```
  ///
  /// The `dateOnly` extension provides a convenient way to obtain a new `DateTime` instance
  /// with the same date as the original but with the time set to midnight (00:00:00).
  /// This is useful when you want to work specifically with the date component and ignore the time.
  DateTime get dateOnly => DateTime(year, month, day);

  /// Returns [true] if the date is on the same day as today; otherwise, [false].
  ///
  /// Example:
  /// ```dart
  /// DateTime today = DateTime.now();
  /// DateTime otherDate = DateTime(2022, 1, 8);
  ///
  /// print(today.isToday);        // true
  /// print(otherDate.isToday);    // false
  /// ```
  ///
  /// The `isToday` extension checks whether the date of the [DateTime] instance
  /// is the same as the current date. It returns [true] if they are on the same day,
  /// and [false] otherwise. This is a convenient way to determine if a date
  /// corresponds to the current day.
  bool get isToday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  /// Returns [true] if the date was on the same day as yesterday; otherwise, [false].
  ///
  /// Example:
  /// ```dart
  /// DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  /// DateTime otherDate = DateTime(2022, 1, 8);
  ///
  /// print(yesterday.isYesterday);        // true
  /// print(otherDate.isYesterday);         // false
  /// ```
  ///
  /// The `isYesterday` extension checks whether the date of the [DateTime] instance
  /// is the same as the date of yesterday. It returns [true] if they are on the
  /// same day, and [false] otherwise. This is a convenient way to determine if a date
  /// corresponds to yesterday.
  bool get isYesterday {
    final nowDate = DateTime.now();
    return year == nowDate.year &&
        month == nowDate.month &&
        day == nowDate.day - 1;
  }

  /// Returns [true] if the date will be on the same day as tomorrow; otherwise, [false].
  ///
  /// Example:
  /// ```dart
  /// DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  /// DateTime otherDate = DateTime(2022, 1, 8);
  ///
  /// print(tomorrow.isTomorrow);        // true
  /// print(otherDate.isTomorrow);       // false
  /// ```
  ///
  /// The `isTomorrow` extension checks whether the date of the [DateTime] instance
  /// will be the same as the date of tomorrow. It returns [true] if they will be on the
  /// same day, and [false] otherwise. This is a convenient way to determine if a date
  /// corresponds to tomorrow.
  bool get isTomorrow {
    final nowDate = DateTime.now();
    return year == nowDate.year &&
        month == nowDate.month &&
        day == nowDate.day + 1;
  }

  /// Adds a certain amount of days to this date and returns a new [DateTime] instance.
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8);
  /// DateTime futureDate = currentDate.addDays(5);
  /// print(futureDate);  // 2022-01-13 00:00:00.000
  /// ```
  ///
  /// The `addDays` method creates a new [DateTime] instance by adding the specified
  /// number of days to the original date. The time components (hour, minute, second,
  /// millisecond, microsecond) remain unchanged.
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

  /// Adds a certain amount of hours to this date and returns a new [DateTime] instance.
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8, 12, 0);
  /// DateTime futureDate = currentDate.addHours(3);
  /// print(futureDate);  // 2022-01-08 15:00:00.000
  /// ```
  ///
  /// The `addHours` method creates a new [DateTime] instance by adding the specified
  /// number of hours to the original date. The date components (year, month, day)
  /// remain unchanged.
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

  /// Returns a [DateTime] representing the day after this [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8);
  /// DateTime nextDay = currentDate.nextDay;
  /// print(nextDay);  // 2022-01-09 00:00:00.000
  /// ```
  ///
  /// The `nextDay` extension provides a convenient way to obtain a new [DateTime] instance
  /// representing the day immediately following the original date.
  DateTime get nextDay => addDays(1);

  /// Returns a [DateTime] representing the day before this [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8);
  /// DateTime previousDay = currentDate.previousDay;
  /// print(previousDay);  // 2022-01-07 00:00:00.000
  /// ```
  ///
  /// The `previousDay` extension provides a convenient way to obtain a new [DateTime] instance
  /// representing the day immediately preceding the original date.
  DateTime get previousDay => addDays(-1);

  /// Checks whether two [DateTime] instances are on the same day.
  ///
  /// Example:
  /// ```dart
  /// DateTime date1 = DateTime(2022, 1, 8, 12, 0);
  /// DateTime date2 = DateTime(2022, 1, 8, 18, 30);
  ///
  /// print(date1.isSameDay(date2));  // true
  /// ```
  ///
  /// The `isSameDay` method compares the year, month, and day components of two [DateTime] instances.
  /// It returns [true] if they are on the same day and [false] otherwise.
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

  /// Checks if this [DateTime] instance represents the first day of the month.
  ///
  /// Example:
  /// ```dart
  /// DateTime firstDay = DateTime(2022, 1, 1);
  /// DateTime otherDay = DateTime(2022, 1, 8);
  ///
  /// print(firstDay.isFirstDayOfMonth);  // Output: true
  /// print(otherDay.isFirstDayOfMonth);  // Output: false
  /// ```
  ///
  /// The `isFirstDayOfMonth` extension returns [true] if the date is the first day of the month,
  /// and [false] otherwise. It compares the year, month, and day components of the [DateTime]
  /// instance with the date of the first day of the same month.
  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth);

  /// Checks if this [DateTime] instance represents the last day of the month.
  ///
  /// Example:
  /// ```dart
  /// DateTime lastDay = DateTime(2022, 1, 31);
  /// DateTime otherDay = DateTime(2022, 1, 8);
  ///
  /// print(lastDay.isLastDayOfMonth);  // Output: true
  /// print(otherDay.isLastDayOfMonth);  // Output: false
  /// ```
  ///
  /// The `isLastDayOfMonth` extension returns [true] if the date is the last day of the month,
  /// and [false] otherwise. It compares the year, month, and day components of the [DateTime]
  /// instance with the date of the last day of the same month.
  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth);

  /// Returns a [DateTime] instance representing the first day of the month of this [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8);
  /// DateTime firstDay = currentDate.firstDayOfMonth;
  /// print(firstDay);  // Output: 2022-01-01 00:00:00.000
  /// ```
  ///
  /// The `firstDayOfMonth` extension returns a new [DateTime] instance with the same year and month
  /// as the original date but with the day set to 1 and the time set to midnight (00:00:00).
  DateTime get firstDayOfMonth => DateTime(year, month);

  /// Returns a [DateTime] instance representing the first day of the week of this [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8);
  /// DateTime firstDayOfWeek = currentDate.firstDayOfWeek;
  /// print(firstDayOfWeek);  // Output: 2022-01-03 12:00:00.000 (Assuming Monday is the first day of the week)
  /// ```
  ///
  /// The `firstDayOfWeek` getter returns a new [DateTime] instance with the same year, month,
  /// and hour as the original date but adjusted to the first day of the week. Daylight Saving
  /// Time is handled by setting the hour to 12:00 Noon rather than the default of Midnight (00:00:00).
  /// The week in this context is considered to start from Monday.
  DateTime get firstDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(year, month, this.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    var decreaseNum = (day.weekday - 1) % 7;
    return subtract(Duration(days: decreaseNum));
  }

  /// Returns a [DateTime] instance representing the last day of the week of this [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8);
  /// DateTime lastDayOfWeek = currentDate.lastDayOfWeek;
  /// print(lastDayOfWeek);  // Output: 2022-01-09 12:00:00.000 (Assuming Sunday is the last day of the week)
  /// ```
  ///
  /// The `lastDayOfWeek` getter returns a new [DateTime] instance with the same year, month,
  /// and hour as the original date but adjusted to the last day of the week. Daylight Saving
  /// Time is handled by setting the hour to 12:00 Noon rather than the default of Midnight (00:00:00).
  /// The week in this context is considered to end on Sunday.
  DateTime get lastDayOfWeek {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    final day = DateTime.utc(year, month, this.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    var increaseNum = (7 - day.weekday) % 7;
    return day.add(Duration(days: 7 - increaseNum));
  }

  /// Returns a [DateTime] instance representing the last day of the month of this [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2022, 1, 8);
  /// DateTime lastDayOfMonth = currentDate.lastDayOfMonth;
  /// print(lastDayOfMonth);  // Output: 2022-01-31 00:00:00.000
  /// ```
  ///
  /// The `lastDayOfMonth` getter calculates and returns a new [DateTime] instance with the same
  /// year and month as the original date but adjusted to the last day of that month.
  DateTime get lastDayOfMonth {
    var beginningNextMonth =
        (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  /// Returns a [DateTime] instance representing the exact date of the previous month.
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2024, 1, 8);
  /// DateTime previousMonthDate = currentDate.previousMonth;
  /// print(previousMonthDate);  // Output: 2023-12-08 00:00:00
  /// ```
  ///
  /// The `previousMonth` extension calculates and returns a new [DateTime] instance
  /// with the same day and time as the original date but adjusted to the exact date of the previous month.
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

  /// Returns a [DateTime] instance representing the exact date of the next coming month.
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2024, 1, 8);
  /// DateTime nextMonthDate = currentDate.nextMonth;
  /// print(nextMonthDate);  // Output: 2023-2-08 00:00:00
  /// ```
  ///
  /// The `nextMonth` extension calculates and returns a new [DateTime] instance
  /// with the same day and time as the original date but adjusted to the exact date of the next month.
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

  /// Returns a [DateTime] instance representing the exact date of the previous week.
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2024, 1, 15);
  /// DateTime previousWeekDate = currentDate.previousWeek;
  /// print(previousWeekDate);  // Output: 2024-01-08 00:00:00
  /// ```
  ///
  /// The `previousWeek` extension calculates and returns a new [DateTime] instance
  /// by subtracting seven days from the original date, representing the exact date of the previous week.
  DateTime get previousWeek => subtract(const Duration(days: 7));

  /// Returns a [DateTime] instance representing the exact date of the coming week.
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2024, 1, 8);
  /// DateTime nextWeekDate = currentDate.nextWeek;
  /// print(nextWeekDate);  // Output: 2024-01-15 00:00:00
  /// ```
  ///
  /// The `nextWeek` extension calculates and returns a new [DateTime] instance
  /// by adding seven days to the original date, representing the exact date of the coming week.
  DateTime get nextWeek => add(const Duration(days: 7));

  /// Checks if two [DateTime] instances fall within the same week.
  ///
  /// Example:
  /// ```dart
  /// DateTime date1 = DateTime(2024, 1, 8);
  /// DateTime date2 = DateTime(2024, 1, 12);
  ///
  /// bool result = date1.isSameWeek(date2);
  /// print(result);  // Output: true
  /// ```
  ///
  /// The `isSameWeek` method compares two [DateTime] instances, ignoring the time component,
  /// and determines if they fall within the same week.
  bool isSameWeek(DateTime b) {
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
  /// The `format` method allows you to create custom date and time formats by
  /// using placeholders that represent various components of the date and time.
  ///
  /// ## Supported Placeholders:
  ///
  /// - `yyyy`: Full year (e.g., 2024)
  /// - `yy`: Last two digits of the year (e.g., 24)
  /// - `MMMM`: Full month name (e.g., January)
  /// - `MMM`: Abbreviated month name (e.g., Jan)
  /// - `MM`: Two-digit month (01 - 12)
  /// - `M`: Single-digit month (1 - 12)
  /// - `dd`: Two-digit day of the month (01 - 31)
  /// - `d`: Single-digit day of the month (1 - 31)
  /// - `HH`: Two-digit hour in 24-hour format (00 - 23)
  /// - `hh`: Two-digit hour in 12-hour format (01 - 12)
  /// - `mm`: Two-digit minute (00 - 59)
  /// - `ss`: Two-digit second (00 - 59)
  /// - `a`: AM or PM
  /// - `EEEE`: Full weekday name (e.g., Monday)
  /// - `EEE`: Abbreviated weekday name (e.g., Mon)
  ///
  /// ## Example Usage:
  ///
  /// ```dart
  /// DateTime now = DateTime.now();
  ///
  /// // Example 1: Format for a standard date and time representation
  /// print(now.format('yyyy-MM-dd – HH:mm'));  // 2024-01-08 – 15:30
  ///
  /// // Example 2: Format with custom date components and 12-hour time format
  /// print(now.format('dd/MMM/yyyy hh:mm:ss a'));  // 08/Jan/2024 03:30:45 PM
  ///
  /// // Example 3: Format for a complete date with full weekday name
  /// print(now.format('EEEE, MMMM d, yyyy'));  // Saturday, January 8, 2024
  ///
  /// // Example 4: Format with minimal components
  /// print(now.format('M/d/yy'));  // 1/8/24
  ///
  /// // Example 5: Format with 24-hour time and no leading zeros in minutes
  /// print(now.format('HH:mm'));  // 15:30
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

  /// Returns the difference in days between two [DateTime] instances.
  ///
  /// Example:
  /// ```dart
  /// DateTime date1 = DateTime(2024, 1, 8);
  /// DateTime date2 = DateTime(2024, 1, 12);
  ///
  /// int daysDifference = date1.diffDays(date2);
  /// print(daysDifference);  // Output: -4
  /// ```
  ///
  /// The `diffDays` method calculates and returns the difference in days between the current [DateTime] instance
  /// and the provided [DateTime]. The result can be negative if the current date is before the provided date.
  int diffDays(DateTime b) => this.difference(b).inDays;

  /// Returns the difference in hours between two [DateTime] instances.
  ///
  /// Example:
  /// ```dart
  /// DateTime date1 = DateTime(2024, 1, 8, 12, 0);
  /// DateTime date2 = DateTime(2024, 1, 12, 9, 30);
  ///
  /// int hoursDifference = date1.diffHours(date2);
  /// print(hoursDifference);  // Output: -92
  /// ```
  ///
  /// The `diffHours` method calculates and returns the difference in hours between the current [DateTime] instance
  /// and the provided [DateTime]. The result can be negative if the current time is before the provided time.
  int diffHours(DateTime b) => this.difference(b).inHours;

  /// Returns the difference in minutes between two [DateTime] instances.
  ///
  /// Example:
  /// ```dart
  /// DateTime date1 = DateTime(2024, 1, 8, 12, 0);
  /// DateTime date2 = DateTime(2024, 1, 12, 9, 30);
  ///
  /// int minutesDifference = date1.diffMinutes(date2);
  /// print(minutesDifference);  // Output: -5530
  /// ```
  ///
  /// The `diffMinutes` method calculates and returns the difference in minutes between the current [DateTime] instance
  /// and the provided [DateTime]. The result can be negative if the current time is before the provided time.
  int diffMinutes(DateTime b) => this.difference(b).inMinutes;

  /// Returns the difference in seconds between two [DateTime] instances.
  ///
  /// Example:
  /// ```dart
  /// DateTime date1 = DateTime(2024, 1, 8, 12, 0, 0);
  /// DateTime date2 = DateTime(2024, 1, 12, 9, 30, 15);
  ///
  /// int secondsDifference = date1.diffSeconds(date2);
  /// print(secondsDifference);  // Output: -331215
  /// ```
  ///
  /// The `diffSeconds` method calculates and returns the difference in seconds between the current [DateTime] instance
  /// and the provided [DateTime]. The result can be negative if the current time is before the provided time.
  int diffSeconds(DateTime b) => this.difference(b).inSeconds;

  /// Get the difference between two `DateTime` instances in years, months, and days.
  ///
  /// If you want the result in abbreviated form (y, m, d), pass `true` to the `abbr` parameter,
  /// which is `false` by default.
  ///
  /// Example:
  /// ```dart
  /// DateTime start = DateTime.now();
  /// DateTime end = DateTime.now().add(Duration(days: 500));
  /// print(start.diffYearsMonthsDays(end));  // 1 year 4 months 15 days
  ///
  /// DateTime start2 = DateTime.now();
  /// DateTime end2 = DateTime.now().add(Duration(days: 370));
  /// print(start2.diffYearsMonthsDays(end2, abbr: true));  // 1 y 5 d
  /// ```
  ///
  /// **Note**: This method provides an approximation and may not be entirely accurate,
  /// especially when dealing with leap years and months of varying lengths.
  ///
  /// The result is formatted as a string indicating the difference in years, months, and days.
  /// If a component is zero, it won't be included in the result.
  ///
  /// `b` The other `DateTime` instance to compare against.
  /// `abbr` If `true`, the result will be abbreviated (y, m, d); otherwise, it will be in long form.
  ///
  /// `return` A string representing the difference in years, months, and days.
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
