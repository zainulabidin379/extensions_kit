import 'package:flutter/material.dart';

/// Unfocus on tap
extension UnfocusOnTap on Widget {
  GestureDetector unfocus(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: this,
      );
}

/// Get X percent of Height of a screen
extension GetHeight on BuildContext {
  double h(num percent) => percent * MediaQuery.of(this).size.height / 100;
}

/// Get X percent of Width of a screen
extension GetWidth on BuildContext {
  double w(num percent) => percent * MediaQuery.of(this).size.width / 100;
}
