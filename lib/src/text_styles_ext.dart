import 'package:flutter/material.dart';

/// Helper extension that allows to use a text style like:
/// `context.textStyles.bodyLarge`
extension TextStyles on BuildContext {
  /// The list of text styles available to the app
  _TextStyles get textStyles => _TextStyles(
        displayLarge: _displayLarge,
        displayMedium: _displayMedium,
        displaySmall: _displaySmall,
        headlineLarge: _headlineLarge,
        headlineMedium: _headlineMedium,
        headlineSmall: _headlineSmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        labelLarge: _labelLarge,
        labelMedium: _labelMedium,
        labelSmall: _labelSmall,
      );

  TextTheme get _textTheme => Theme.of(this).textTheme;

  TextStyle get _displayLarge => _textTheme.displayLarge!;
  TextStyle get _displayMedium => _textTheme.displayMedium!;
  TextStyle get _displaySmall => _textTheme.displaySmall!;
  TextStyle get _headlineLarge => _textTheme.headlineLarge!;
  TextStyle get _headlineMedium => _textTheme.headlineMedium!;
  TextStyle get _headlineSmall => _textTheme.headlineSmall!;
  TextStyle get _titleLarge => _textTheme.titleLarge!;
  TextStyle get _titleMedium => _textTheme.titleMedium!;
  TextStyle get _titleSmall => _textTheme.titleSmall!;
  TextStyle get _bodyLarge => _textTheme.bodyLarge!;
  TextStyle get _bodyMedium => _textTheme.bodyMedium!;
  TextStyle get _bodySmall => _textTheme.bodySmall!;
  TextStyle get _labelLarge => _textTheme.labelLarge!;
  TextStyle get _labelMedium => _textTheme.labelMedium!;
  TextStyle get _labelSmall => _textTheme.labelSmall!;
}

class _TextStyles {
  const _TextStyles({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
  });

  /// See [TextTheme.displayLarge].
  final TextStyle displayLarge;

  /// See [TextTheme.displayMedium].
  final TextStyle displayMedium;

  /// See [TextTheme.displaySmall].
  final TextStyle displaySmall;

  /// See [TextTheme.headlineLarge].
  final TextStyle headlineLarge;

  /// See [TextTheme.headlineMedium].
  final TextStyle headlineMedium;

  /// See [TextTheme.headlineSmall].
  final TextStyle headlineSmall;

  /// See [TextTheme.titleLarge].
  final TextStyle titleLarge;

  /// See [TextTheme.titleMedium].
  final TextStyle titleMedium;

  /// See [TextTheme.titleSmall].
  final TextStyle titleSmall;

  /// See [TextTheme.bodyLarge].
  final TextStyle bodyLarge;

  /// See [TextTheme.bodyMedium].
  final TextStyle bodyMedium;

  /// See [TextTheme.bodySmall].
  final TextStyle bodySmall;

  /// See [TextTheme.labelLarge].
  final TextStyle labelLarge;

  /// See [TextTheme.labelMedium].
  final TextStyle labelMedium;

  /// See [TextTheme.labelSmall].
  final TextStyle labelSmall;
}

/// Converts a textStyle to the desired font weight.
///
/// Example usage:
/// `context.textStyles.bodyLarge.semiBold`
extension FontWeights on TextStyle {
  /// Black, the most thick
  TextStyle get thick => copyWith(fontWeight: FontWeight.w900);

  /// Extra-bold
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// Bold
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Semi-bold
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Medium
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Normal, regular, plain
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Light
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Extra-light
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  /// Thin, the least thick
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
}

/// Converts a textStyle to the desired font style.
///
/// Example usage:
/// `context.textStyles.bodyLarge.italic`
extension FontStyles on TextStyle {
  /// Use the upright glyphs
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);

  /// Use glyphs designed for slanting
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

/// Adds a Color to the textStyle.
///
/// Example usage:
/// `context.textStyles.bodyLarge.color(Colors.white)`
extension FontColor on TextStyle {
  /// Apply the color to TextStyle
  TextStyle applyColor(Color color) => copyWith(color: color);
}

/// Converts a textStyle to the desired font size
/// Example usage:
/// `context.textStyles.bodyLarge.size10`
extension FontSizes on TextStyle {
  /// 8
  TextStyle get size8 => copyWith(fontSize: 8);

  /// 9
  TextStyle get size9 => copyWith(fontSize: 9);

  /// 10
  TextStyle get size10 => copyWith(fontSize: 10);

  /// 11
  TextStyle get size11 => copyWith(fontSize: 11);

  /// 12
  TextStyle get size12 => copyWith(fontSize: 12);

  /// 13
  TextStyle get size13 => copyWith(fontSize: 13);

  /// 14
  TextStyle get size14 => copyWith(fontSize: 14);

  /// 15
  TextStyle get size15 => copyWith(fontSize: 15);

  /// 16
  TextStyle get size16 => copyWith(fontSize: 16);

  /// 17
  TextStyle get size17 => copyWith(fontSize: 17);

  /// 18
  TextStyle get size18 => copyWith(fontSize: 18);

  /// 19
  TextStyle get size19 => copyWith(fontSize: 19);

  /// 20
  TextStyle get size20 => copyWith(fontSize: 20);

  /// 21
  TextStyle get size21 => copyWith(fontSize: 21);

  /// 22
  TextStyle get size22 => copyWith(fontSize: 22);

  /// 23
  TextStyle get size23 => copyWith(fontSize: 23);

  /// 24
  TextStyle get size24 => copyWith(fontSize: 24);

  /// 25
  TextStyle get size25 => copyWith(fontSize: 25);

  /// 26
  TextStyle get size26 => copyWith(fontSize: 26);

  /// 27
  TextStyle get size27 => copyWith(fontSize: 27);

  /// 28
  TextStyle get size28 => copyWith(fontSize: 28);

  /// 29
  TextStyle get size29 => copyWith(fontSize: 29);

  /// 30
  TextStyle get size30 => copyWith(fontSize: 30);

  /// 31
  TextStyle get size31 => copyWith(fontSize: 31);

  /// 32
  TextStyle get size32 => copyWith(fontSize: 32);

  /// 33
  TextStyle get size33 => copyWith(fontSize: 33);

  /// 34
  TextStyle get size34 => copyWith(fontSize: 34);

  /// 35
  TextStyle get size35 => copyWith(fontSize: 35);

  /// 36
  TextStyle get size36 => copyWith(fontSize: 36);

  /// 37
  TextStyle get size37 => copyWith(fontSize: 37);

  /// 38
  TextStyle get size38 => copyWith(fontSize: 38);

  /// 39
  TextStyle get size39 => copyWith(fontSize: 39);

  /// 40
  TextStyle get size40 => copyWith(fontSize: 40);

  /// 41
  TextStyle get size41 => copyWith(fontSize: 41);

  /// 42
  TextStyle get size42 => copyWith(fontSize: 42);

  /// 43
  TextStyle get size43 => copyWith(fontSize: 43);

  /// 44
  TextStyle get size44 => copyWith(fontSize: 44);

  /// 45
  TextStyle get size45 => copyWith(fontSize: 45);

  /// 46
  TextStyle get size46 => copyWith(fontSize: 46);

  /// 47
  TextStyle get size47 => copyWith(fontSize: 47);

  /// 48
  TextStyle get size48 => copyWith(fontSize: 48);

  /// 49
  TextStyle get size49 => copyWith(fontSize: 49);

  /// 50
  TextStyle get size50 => copyWith(fontSize: 50);
}
