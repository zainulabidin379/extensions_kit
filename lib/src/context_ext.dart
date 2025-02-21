import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Extensions for adding additional functionality to the [BuildContext].
extension ContextExtensions on BuildContext {
  /// Get X percent of Height of a screen
  double h(double height) => height * MediaQuery.of(this).size.height / 100;

  /// Get X percent of Width of a screen
  double w(double width) => width * MediaQuery.of(this).size.width / 100;

  /// Get 100 percent of Height of a screen
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get 100 percent of Width of a screen
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Indicates whether the app is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Indicates whether the app is in light mode
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// Displays an alert dialog based on the platform (iOS or Android).
  ///
  /// [title] - The title of the alert dialog.
  ///
  /// [message] - The message content of the alert dialog.
  ///
  /// [positiveButtonsTitle] - List of titles for positive buttons.
  ///
  /// [cancelButtonTitle] - Title for the cancel button.
  ///
  /// [onDone] - Callback function invoked when a button is pressed. The parameter
  /// represents the index of the pressed button.
  ///
  /// [positiveTitleColor] - Text color for positive buttons.
  ///
  /// [cancelTitleColor] - Text color for the cancel button.
  ///
  /// [fontSize] - Font size for the button titles.
  ///
  /// [barrierDismissible] - Whether the dialog can be dismissed by tapping outside.
  ///
  /// Example usage:
  /// ```dart
  /// showAlertDialog(
  ///   title: "Alert",
  ///   message: "This is an alert message.",
  ///   positiveButtonsTitle: ["OK"],
  ///   onDone: (index) {
  ///     print("Button pressed at index $index");
  ///   },
  /// );
  /// ```
  void showAlertDialog({
    required String title,
    required String message,
    List<String>? positiveButtonsTitle,
    String? cancelButtonTitle,
    Function(int)? onDone,
    Color? positiveTitleColor,
    Color? cancelTitleColor,
    double? fontSize,
    bool barrierDismissible = true,
  }) {
    // Check the platform
    if (Ext.isIOS) {
      // Show Cupertino dialog
      _showIOSDialog(
        this,
        title,
        message,
        positiveButtonsTitle,
        cancelButtonTitle,
        onDone,
        positiveTitleColor,
        cancelTitleColor,
        fontSize,
        barrierDismissible,
      );
    } else {
      // Show Material dialog
      _showAndroidDialog(
        this,
        title,
        message,
        positiveButtonsTitle,
        cancelButtonTitle,
        onDone,
        positiveTitleColor,
        cancelTitleColor,
        fontSize,
        barrierDismissible,
      );
    }
  }

  /// Displays an iOS-style alert dialog.
  void _showIOSDialog(
    BuildContext context,
    String title,
    String message,
    List<String>? buttons,
    String? cancelButton,
    Function(int)? onDone,
    Color? positiveTitleColor,
    Color? cancelTitleColor,
    double? fontSize,
    bool barrierDismissible,
  ) {
    List<Widget> arrWidget = [];

    if (cancelButton != null) {
      CupertinoDialogAction action = CupertinoDialogAction(
        isDefaultAction: true,
        textStyle: TextStyle(color: cancelTitleColor, fontSize: fontSize),
        onPressed: () {
          context.popScreen();
        },
        child: Text(cancelButton),
      );
      arrWidget.add(action);
    }

    if (buttons != null) {
      for (String buttonTitle in buttons) {
        CupertinoDialogAction action = CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: TextStyle(color: positiveTitleColor, fontSize: fontSize),
          onPressed: () {
            int index = buttons.indexOf(buttonTitle);
            if (onDone != null) {
              onDone(index);
            }
            context.popScreen();
          },
          child: Text(buttonTitle),
        );
        arrWidget.add(action);
      }
    }

    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: arrWidget,
        );
      },
    );
  }

  /// Displays an Android-style alert dialog.
  void _showAndroidDialog(
    BuildContext context,
    String title,
    String message,
    List<String>? buttons,
    String? cancelButton,
    Function(int)? onDone,
    Color? positiveTitleColor,
    Color? cancelTitleColor,
    double? fontSize,
    bool barrierDismissible,
  ) {
    List<Widget> arrWidget = [];

    if (cancelButton != null) {
      TextButton action = TextButton(
        style: TextButton.styleFrom(
          foregroundColor: cancelTitleColor,
          textStyle: TextStyle(
            fontSize: fontSize,
          ),
        ),
        child: Text(
          cancelButton,
        ),
        onPressed: () {
          context.popScreen();
        },
      );
      arrWidget.add(action);
    }

    if (buttons != null) {
      for (String buttonTitle in buttons) {
        TextButton action = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: positiveTitleColor,
            textStyle: TextStyle(
              fontSize: fontSize,
            ),
          ),
          child: Text(
            buttonTitle,
          ),
          onPressed: () {
            int index = buttons.indexOf(buttonTitle);
            if (onDone != null) {
              onDone(index);
            }
            context.popScreen();
          },
        );
        arrWidget.add(action);
      }
    }

    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(title),
          content: Text(message),
          actions: arrWidget,
        );
      },
    );
  }
}
