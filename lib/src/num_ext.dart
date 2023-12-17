import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension NumberExtensions on num {
  /// Converts [int] into English ordinal representation
  /// ```
  /// print(1.ordinal); // 1st
  /// print(22.ordinal); // 22nd
  /// print(143.ordinal); // 143rd
  /// print(0.ordinal); // 0th
  /// print(12.ordinal); // 12th
  /// print(69.ordinal); // 69th
  /// ```
  String get ordinal {
    return switch (toInt() % 100) {
      11 || 12 || 13 => '${this}th',
      _ => switch (this % 10) {
          1 => '${this}st',
          2 => '${this}nd',
          3 => '${this}rd',
          _ => '${this}th'
        }
    };
  }

  /// Returns a string with comma separator like `1,233,15` if the String is '123315'.
  /// ```
  /// print(1234.currency); // 1,234
  /// print(23242342.currency); // 23,242,342
  /// print(142343.currency); // 142,343
  /// print(3242340.currency); // 3,242,340
  /// print(145.currency); // 145
  /// print(1520.currency); // 1,520
  /// ```
  String get currency => intl.NumberFormat.currency(customPattern: "#,###,000")
      .format(this)
      .toString();

  /// Returns a string with your custom pattern.
  /// ```
  /// print(123456.currencyWithPattern("#,###,000")); // 123,456
  /// print(123456.currencyWithPattern("#,##,000")); // 1,23,456
  /// ```
  String currencyWithPattern(String? pattern) =>
      intl.NumberFormat.currency(customPattern: pattern ?? "#,###,000")
          .format(this)
          .toString();

  /// Returns `true` if `this` is between the given [min] (inclusive) and [max] (exclusive).
  bool between(num min, num max) {
    assert(min <= max,
        'Invalid bounds: $min and $max, min cannot be greater than max');
    return min <= this && this < max;
  }

  /// Returns `true` if this number is outside the given range of [min] (exclusive) and
  /// [max] (exclusive).
  bool outside(num min, num max) {
    assert(min <= max,
        'Invalid bounds: $min and $max, min cannot be greater than max');
    return this < min || this > max;
  }

  /// Returns an empty space of given `height`
  SizedBox get heightBox => SizedBox(height: toDouble());

  /// Returns an empty space of given `width`
  SizedBox get widthBox => SizedBox(width: toDouble());

  /// Creates [EdgeInsets] where all the offsets are `value`.
  EdgeInsets padAll() => EdgeInsets.all(toDouble());

  /// Creates [EdgeInsets] with symmetric horizontal offsets.
  EdgeInsets padHrz() => EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates [EdgeInsets] with symmetric vertical offsets.
  EdgeInsets padVert() => EdgeInsets.symmetric(vertical: toDouble());

  /// Creates [EdgeInsets] with only the top value.
  EdgeInsets padTop() => EdgeInsets.only(top: toDouble());

  /// Creates [EdgeInsets] with only the left value.
  EdgeInsets padLeft() => EdgeInsets.only(left: toDouble());

  /// Creates [EdgeInsets] with only the right value.
  EdgeInsets padRight() => EdgeInsets.only(right: toDouble());

  /// Creates [EdgeInsets] with only the bottom value.
  EdgeInsets padBottom() => EdgeInsets.only(bottom: toDouble());

  /// Creates [EdgeInsets] with only the given value.
  EdgeInsets padOnly({
    double l = 0,
    double r = 0,
    double t = 0,
    double b = 0,
  }) =>
      EdgeInsets.only(left: l, bottom: b, top: t, right: r);

  /// Creates [BorderRadiusGeometry] with given value.
  BorderRadiusGeometry circular() => BorderRadius.circular(toDouble());
}
