import 'package:flutter/material.dart';

import 'shimmer/shimmer.dart';

/// Extensions for accessing functionality of the [Widget].
extension WidgetExtensions on Widget {
  /// Will [Unfocus] any focused textfield
  ///
  /// It's better to use it on main parent widget of the screen e.g. [Scaffold]
  GestureDetector unFocus(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: this,
      );

  /// Centers the [Widget]
  Widget get centerWidget => Center(child: this);

  /// Aligns the [Widget] to Center LEFT
  Widget get leftAlign => Align(alignment: Alignment.centerLeft, child: this);

  /// Aligns the [Widget] to Top LEFT
  Widget get topLeftAlign => Align(alignment: Alignment.topLeft, child: this);

  /// Aligns the [Widget] to Bottom LEFT
  Widget get bottomLeftAlign =>
      Align(alignment: Alignment.bottomLeft, child: this);

  /// Aligns the [Widget] to Center RIGHT
  Widget get rightAlign => Align(alignment: Alignment.centerRight, child: this);

  /// Aligns the [Widget] to Top RIGHT
  Widget get topRightAlign => Align(alignment: Alignment.topRight, child: this);

  /// Aligns the [Widget] to Bottom RIGHT
  Widget get bottomRightAlign =>
      Align(alignment: Alignment.bottomRight, child: this);

  /// Aligns the [Widget] to TOP Center
  Widget get topAlign => Align(alignment: Alignment.topCenter, child: this);

  /// Aligns the [Widget] to BOTTOM
  Widget get bottomAlign =>
      Align(alignment: Alignment.bottomCenter, child: this);

  /// Wraps [this] widget with a [Flexible] widget
  Widget get flexible => Flexible(child: this);

  /// Wraps [this] widget with an [Expanded] widget
  Expanded expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  /// Wraps [this] widget with a [GestureDetector] widget and accepts a function
  Widget onDoubleTap(Function() function) => GestureDetector(
        onDoubleTap: function,
        child: this,
      );

  /// Wraps [this] widget with a [GestureDetector] widget and accepts a function
  Widget onTap(Function() function) => GestureDetector(
        onTap: function,
        child: this,
      );

  /// Wraps [this] widget with a [GestureDetector] widget and accepts a function
  Widget onLongPress(Function() function) => GestureDetector(
        onLongPress: function,
        child: this,
      );

  /// Wraps [this] widget with an [Opacity] widget
  Opacity withOpacity({required double opacity}) => Opacity(
        opacity: opacity,
        child: this,
      );

  /// Wraps [this] widget with a [Positioned] widget
  Positioned positionTop({
    Key? key,
    required double top,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        top: top,
        width: width,
        height: height,
        child: this,
      );

  /// Wraps [this] widget with a [Positioned] widget
  Positioned positionBottom({
    Key? key,
    required double bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  /// Wraps [this] widget with a [Positioned] widget
  Positioned positionTB({
    Key? key,
    required double top,
    required double bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        top: top,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  /// Wraps [this] widget with a [Positioned] widget
  Positioned positionLR({
    Key? key,
    required double left,
    required double right,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        left: left,
        right: right,
        width: width,
        height: height,
        child: this,
      );

  /// Wraps [this] widget with a [Positioned] widget
  Positioned positionLRTB({
    Key? key,
    required double top,
    required double bottom,
    required double left,
    required double right,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        child: this,
      );

  /// Shows a basic [Tooltip] with a message
  Widget tooltip(String message,
          {Decoration? decoration,
          double? height,
          bool? preferBelow,
          EdgeInsetsGeometry? padding,
          TextStyle? textStyle,
          Duration? waitDuration,
          Duration? showDuration,
          Duration? exitDuration,
          bool enableTapToDismiss = true,
          TooltipTriggerMode? triggerMode,
          EdgeInsetsGeometry? margin}) =>
      Tooltip(
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        showDuration: showDuration,
        exitDuration: exitDuration,
        margin: margin,
        enableTapToDismiss: enableTapToDismiss,
        triggerMode: triggerMode,
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

  /// Wraps [this] widget with a [Shimmer] with customizable Base Color and HightLight Color
  Widget applyShimmer(
      {bool enable = true, Color? baseColor, Color? highlightColor}) {
    if (enable) {
      return Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey.shade300,
        highlightColor: highlightColor ?? Colors.grey.shade100,
        enabled: enable,
        child: this,
      );
    } else {
      return this;
    }
  }
}
