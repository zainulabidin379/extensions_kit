import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  /// Will [Unfocus] any focused textfield
  ///
  /// It's better to use it on main parent widget of the screen e.g. [Scaffold]
  GestureDetector unfocus(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: this,
      );

  /// Centers the [Widget]
  Widget get center => Center(child: this);

  /// Aligns the [Widget] to LEFT
  Widget get leftAlign => Align(alignment: Alignment.centerLeft, child: this);

  /// Aligns the [Widget] to RIGHT
  Widget get rightAlign => Align(alignment: Alignment.centerRight, child: this);

  /// Aligns the [Widget] to TOP
  Widget get topAlign => Align(alignment: Alignment.topCenter, child: this);

  /// Aligns the [Widget] to BOTTOM
  Widget get bottomAlign =>
      Align(alignment: Alignment.bottomCenter, child: this);

  /// Wraps [this] widget with a [Flexible] widget
  Widget get flexible => Flexible(child: this);

  /// Shows a basic [Tooltip] with a message
  Widget tooltip(String message) => Tooltip(
        message: message,
        child: this,
      );

  /// Wraps [this] widget with a [SizedBox] with custom WIDTH and HEIGHT
  Widget sizedBox(double width, double height) => SizedBox(
        width: width,
        height: height,
        child: this,
      );

  /// Wraps [this] widget with a [SizedBox] with custom HEIGHT
  Widget heightBox(double height) => SizedBox(
        height: height,
        child: this,
      );

  /// Wraps [this] widget with a [SizedBox] with custom WIDTH
  Widget widthBox(double width) => SizedBox(
        width: width,
        child: this,
      );
}
