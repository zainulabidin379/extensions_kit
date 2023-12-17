final RegExp _emailRegularExpression = RegExp(
    r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

extension StringExtension on String {
  /// Returns true if string contains email
  bool get isEmail => _emailRegularExpression.hasMatch(toLowerCase());

  /// Capitalizes each word in the string, e.g.:
  /// `hello world` becomes `Hello World`.
  String get capitalize {
    return split(' ').map((e) => e.capitalizeFirst).join(' ');
  }

  /// Capitalizes the first word in the string, e.g.:
  /// `hello world` becomes `Hello world`.
  String get capitalizeFirst {
    if (length == 0) return '';
    if (length == 1) return toUpperCase();
    return substring(0, 1).toUpperCase() + substring(1);
  }

  /// Mocks a string that needs to be translated or changed
  String get mock => '$this 🧨';

  /// Indicates if the string is a boolean
  ///
  /// If [caseSensitive] is `true`, which is the default,
  /// the only accepted inputs are the strings `"true"` and `"false"`,
  /// Example:
  /// ```dart
  /// print('true'.isBool()); // true
  /// print('false'.isBool()); // true
  /// print('TRUE'.isBool()); // false
  /// print('TRUE'.isBool(caseSensitive: false)); // true
  /// print('FALSE'.isBool(caseSensitive: false)); // true
  /// print('NO'.isBool()); // false
  /// print('YES'.isBool()); // false
  /// print('0'.isBool()); // false
  /// print('1'.isBool()); // false
  /// ```
  bool isBool({bool caseSensitive = true}) =>
      bool.tryParse(this, caseSensitive: caseSensitive) != null;

  /// Converts the string into a Boolean
  ///
  /// Throws if the string is not a Boolean.
  /// If [caseSensitive] is `true`, which is the default,
  /// the only accepted inputs are the strings `"true"` and `"false"`,
  bool toBool({bool caseSensitive = true}) =>
      bool.parse(this, caseSensitive: caseSensitive);

  /// Indicates if the string is a number
  ///
  /// print('2021'.isNum()); // true
  /// print('3.14'.isNum()); // true
  /// print('  3.14 \xA0'.isNum()); // true
  /// print('0.'.isNum()); // true
  /// print('.0'.isNum()); // true
  /// print('-1.e3'.isNum()); // true
  /// print('1234E+7'.isNum()); // true
  /// print('+.12e-9'.isNum()); // true
  /// print('-NaN'.isNum()); // true
  /// print('0xFF'.isNum()); // true
  /// print(double.infinity.toString().isNum()); // true
  /// print('1f'.isNum()); // false
  bool get isNum => num.tryParse(this) != null;

  /// Converts the string into a [num]
  ///
  /// Throws if the string is not a number.
  num get toNum => num.parse(this);

  /// Indicates if the string is a double number
  bool get isDouble => double.tryParse(this) != null;

  /// Converts the string into an [double]
  ///
  /// Throws if the string is not an Double number.
  double get toDouble => double.parse(this);

  /// Indicates if the string is an integer number
  bool get isInt => int.tryParse(this) != null;

  /// Converts the string into an [int]
  ///
  /// Throws if the string is not an Integer.
  int get toInt => int.parse(this);

  /// Removes all the whitespace from the string
  String get removeAllWhitespace => replaceAll(' ', '');

  /// Checks whether this regular expression has a match in the [pattern].
  bool hasMatch(String pattern) => RegExp(pattern).hasMatch(this);
}
