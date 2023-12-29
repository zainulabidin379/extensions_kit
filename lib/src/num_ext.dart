import 'package:flutter/material.dart';

/// Extensions for adding additional functionality to the [num].
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
