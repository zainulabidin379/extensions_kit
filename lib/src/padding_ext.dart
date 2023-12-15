import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  /// Horizontal Padding
  Widget padHrz(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  /// Vertical Padding
  Widget padVert(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  /// Padding to All sides
  Widget padAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  /// Padding RIGHT Only
  Widget padRight(double padding) => Padding(
        padding: EdgeInsets.only(right: padding),
        child: this,
      );

  /// Padding LEFT Only
  Widget padLeft(double padding) => Padding(
        padding: EdgeInsets.only(left: padding),
        child: this,
      );

  /// Padding TOP
  Widget padTop(double padding) => Padding(
        padding: EdgeInsets.only(top: padding),
        child: this,
      );

  /// Padding Bottom
  Widget padBottom(double padding) => Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: this,
      );
}
