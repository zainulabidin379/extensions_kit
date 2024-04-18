import 'package:flutter/material.dart';

/// Extensions for adding additional functionality to the `num`.
extension NumberExtensions on num {
  /// Generates Lorem Ipsum text with the specified number of words.
  ///
  /// Example:
  /// ```dart
  /// String loremIpsumText = 15.loremIpsum();
  /// print(loremIpsumText);
  /// // Output: 'lorem ipsum dolor sit amet consectetur adipiscing elit sed do...'
  /// ```
  ///
  /// The `loremIpsum` method generates Lorem Ipsum text with a word count equal to [this].
  /// It utilizes a predefined list of words to construct the text, repeating the words
  /// as needed to achieve the specified word count.
  ///
  /// @return A string containing Lorem Ipsum text with the specified number of words.
  String loremIpsum() {
    var words = [
      'lorem',
      'ipsum',
      'dolor',
      'sit',
      'amet',
      'consectetur',
      'adipiscing',
      'elit',
      'sed',
      'do',
      'eiusmod',
      'tempor',
      'incididunt',
      'ut',
      'labore',
      'et',
      'dolore',
      'magna',
      'aliqua',
      'ut',
      'enim',
      'ad',
      'minim',
      'veniam',
      'quis',
      'nostrud',
      'exercitation',
      'ullamco',
      'laboris',
      'nisi',
      'ut',
      'aliquip',
      'ex',
      'ea',
      'commodo',
      'consequat',
      'duis',
      'aute',
      'irure',
      'dolor',
      'in',
      'reprehenderit',
      'in',
      'voluptate',
      'velit',
      'esse',
      'cillum',
      'dolore',
      'eu',
      'fugiat',
      'nulla',
      'pariatur',
      'excepteur',
      'sint',
      'occaecat',
      'cupidatat',
      'non',
      'proident',
      'sunt',
      'in',
      'culpa',
      'qui',
      'officia',
      'deserunt',
      'mollit',
      'anim',
      'id',
      'est',
      'laborum'
    ];

    var result = '';
    for (var i = 0; i < this; i++) {
      result += '${words[i % words.length]} ';
    }
    return result.trim();
  }

  /// Converts an [int] into its English ordinal representation.
  ///
  /// Example:
  /// ```dart
  /// print(1.ordinal);   // Output: 1st
  /// print(22.ordinal);  // Output: 22nd
  /// print(143.ordinal); // Output: 143rd
  /// print(0.ordinal);   // Output: 0th
  /// print(12.ordinal);  // Output: 12th
  /// print(69.ordinal);  // Output: 69th
  /// ```
  ///
  /// The `ordinal` extension converts an integer into its English ordinal representation.
  /// It is commonly used to format numbers as ordinals, such as "1st", "22nd", "143rd", etc.
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

  /// Returns `true` if the current value is between the given [min] (inclusive) and [max] (exclusive).
  ///
  /// Example:
  /// ```dart
  /// num value = 5;
  /// bool isBetween = value.between(0, 10);
  /// print(isBetween);  // Output: true
  /// ```
  ///
  /// The `between` method checks if the current value is within the specified range [min, max).
  /// It returns `true` if the value is greater than or equal to [min] and less than [max].
  bool between(num min, num max) {
    assert(min <= max,
        'Invalid bounds: $min and $max, min cannot be greater than max');
    return min <= this && this < max;
  }

  /// Returns `true` if the current value is outside the given range of [min] (exclusive) and [max] (exclusive).
  ///
  /// Example:
  /// ```dart
  /// num value = 15;
  /// bool isOutside = value.outside(0, 10);
  /// print(isOutside);  // Output: true
  /// ```
  ///
  /// The `outside` method checks if the current value is outside the specified range (exclusive) [min, max).
  /// It returns `true` if the value is less than [min] or greater than [max].
  bool outside(num min, num max) {
    assert(min <= max,
        'Invalid bounds: $min and $max, min cannot be greater than max');
    return this < min || this > max;
  }

  /// Returns an empty space with a specified height.
  ///
  /// Example:
  /// ```dart
  /// int heightValue = 20;
  /// SizedBox heightBox = heightValue.heightBox;
  /// ```
  ///
  /// The `heightBox` extension returns a [SizedBox] widget with the height set to the value of the current integer.
  /// It is commonly used in Flutter UI layouts to add empty space with a specific height.
  SizedBox get heightBox => SizedBox(height: toDouble());

  /// Returns an empty space with a specified width.
  ///
  /// Example:
  /// ```dart
  /// int widthValue = 30;
  /// SizedBox widthBox = widthValue.widthBox;
  /// ```
  ///
  /// The `widthBox` extension returns a [SizedBox] widget with the width set to the value of the current integer.
  /// It is commonly used in Flutter UI layouts to add empty space with a specific width.
  SizedBox get widthBox => SizedBox(width: toDouble());

  /// Creates [EdgeInsets] where all the offsets are set to the current integer value.
  ///
  /// Example:
  /// ```dart
  /// int paddingValue = 16;
  /// EdgeInsets allPadding = paddingValue.padAll();
  /// ```
  ///
  /// The `padAll` method returns [EdgeInsets] with all offsets set to the value of the current integer.
  /// It is useful for creating consistent padding on all sides.
  EdgeInsets padAll() => EdgeInsets.all(toDouble());

  /// Creates [EdgeInsets] with symmetric horizontal offsets.
  ///
  /// Example:
  /// ```dart
  /// int horizontalPaddingValue = 8;
  /// EdgeInsets horizontalPadding = horizontalPaddingValue.padHrz();
  /// ```
  ///
  /// The `padHrz` method returns [EdgeInsets] with symmetric horizontal offsets set to the value of the current integer.
  /// It is useful for creating padding on the left and right sides.
  EdgeInsets padHrz() => EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates [EdgeInsets] with symmetric vertical offsets.
  ///
  /// Example:
  /// ```dart
  /// int verticalPaddingValue = 12;
  /// EdgeInsets verticalPadding = verticalPaddingValue.padVert();
  /// ```
  ///
  /// The `padVert` method returns [EdgeInsets] with symmetric vertical offsets set to the value of the current integer.
  /// It is useful for creating padding on the top and bottom sides.
  EdgeInsets padVert() => EdgeInsets.symmetric(vertical: toDouble());

  /// Creates [EdgeInsets] with only the top value.
  ///
  /// Example:
  /// ```dart
  /// int topPaddingValue = 10;
  /// EdgeInsets topPadding = topPaddingValue.padTop();
  /// ```
  ///
  /// The `padTop` method returns [EdgeInsets] with only the top offset set to the value of the current integer.
  /// It is useful for creating padding on the top side.
  EdgeInsets padTop() => EdgeInsets.only(top: toDouble());

  /// Creates [EdgeInsets] with only the left value.
  ///
  /// Example:
  /// ```dart
  /// int leftPaddingValue = 6;
  /// EdgeInsets leftPadding = leftPaddingValue.padLeft();
  /// ```
  ///
  /// The `padLeft` method returns [EdgeInsets] with only the left offset set to the value of the current integer.
  /// It is useful for creating padding on the left side.
  EdgeInsets padLeft() => EdgeInsets.only(left: toDouble());

  /// Creates [EdgeInsets] with only the right value.
  ///
  /// Example:
  /// ```dart
  /// int rightPaddingValue = 4;
  /// EdgeInsets rightPadding = rightPaddingValue.padRight();
  /// ```
  ///
  /// The `padRight` method returns [EdgeInsets] with only the right offset set to the value of the current integer.
  /// It is useful for creating padding on the right side.
  EdgeInsets padRight() => EdgeInsets.only(right: toDouble());

  /// Creates [EdgeInsets] with only the bottom value.
  ///
  /// Example:
  /// ```dart
  /// int bottomPaddingValue = 14;
  /// EdgeInsets bottomPadding = bottomPaddingValue.padBottom();
  /// ```
  ///
  /// The `padBottom` method returns [EdgeInsets] with only the bottom offset set to the value of the current integer.
  /// It is useful for creating padding on the bottom side.
  EdgeInsets padBottom() => EdgeInsets.only(bottom: toDouble());

  /// Creates [BorderRadiusGeometry] with a circular radius set to the current integer value.
  ///
  /// Example:
  /// ```dart
  /// int circularRadiusValue = 8;
  /// BorderRadiusGeometry circularRadius = circularRadiusValue.circular();
  /// ```
  ///
  /// The `circular` method returns [BorderRadiusGeometry] with a circular radius set to the value of the current integer.
  /// It is useful for creating rounded corners with a consistent circular radius.
  BorderRadiusGeometry circular() => BorderRadius.circular(toDouble());

  /// Returns a string representation of the number abbreviated to a compact form.
  ///
  /// This method abbreviates the number to a shorter form using "k" for thousands,
  /// "M" for millions, and "B" for billions. For numbers less than 1000, it returns
  /// the number as a plain string. For numbers in thousands, millions, or billions,
  /// it formats the number to one decimal place and appends the corresponding
  /// abbreviation. If the decimal place is zero, it is omitted for a cleaner look.
  ///
  /// Examples:
  /// - 999 returns "999"
  /// - 1000 returns "1k"
  /// - 1100 returns "1.1k"
  /// - 2500000 returns "2.5M"
  /// - 3000000000 returns "3B"
  ///
  /// Returns:
  /// A string representation of the abbreviated number.
  String get abbreviated {
    if (this >= 1000 && this < 1000000) {
      return "${(this / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}k";
    } else if (this >= 1000000 && this < 1000000000) {
      return "${(this / 1000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}M";
    } else if (this >= 1000000000) {
      return "${(this / 1000000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}B";
    } else {
      return this.toString();
    }
  }
}

/// Creates [EdgeInsets] with only the given values for left, right, top, and bottom offsets.
///
/// Example:
/// ```dart
/// int leftValue = 2;
/// int rightValue = 4;
/// int topValue = 6;
/// int bottomValue = 8;
/// EdgeInsets customPadding = padOnly(l: leftValue, r: rightValue, t: topValue, b: bottomValue);
/// ```
///
/// The `padOnly` method returns [EdgeInsets] with specified offsets based on the provided parameters.
/// It is useful for creating custom padding with different values for each side.
EdgeInsets padOnly({
  double l = 0,
  double r = 0,
  double t = 0,
  double b = 0,
}) =>
    EdgeInsets.only(left: l, bottom: b, top: t, right: r);
