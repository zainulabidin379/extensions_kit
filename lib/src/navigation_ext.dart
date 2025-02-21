import 'package:flutter/material.dart';

/// Extensions for navigation on the [BuildContext].
extension NavigatorExt on BuildContext {
  ///  just call this [canPop()] method and it would return true if this route can be popped and false if it’s not possible.
  bool canPop() => Navigator.canPop(this);

  /// performs a simple [Navigator.pop] action and returns given [result]
  void popScreen<T>({result}) => Navigator.pop(this, result);

  /// performs a simple [Navigator.push] action with given [route]
  Future<dynamic> push(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullScreenDialog = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).push(MaterialPageRoute(
        builder: (_) => screen,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullScreenDialog,
      ));

  /// performs a simple [Navigator.pushReplacement] action with given [route]
  Future<dynamic> pushReplacement(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullScreenDialog = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushReplacement(MaterialPageRoute(
        builder: (_) => screen,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullScreenDialog,
      ));

  /// perform push and remove route
  Future<dynamic> pushAndRemoveUntil(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullScreenDialog = false,
    bool routes = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => screen,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullScreenDialog,
          ),
          (Route<dynamic> route) => routes);

  /// perform push with routeName
  Future<dynamic> pushNamed(
    String screenName, {
    Object? arguments,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushNamed(screenName, arguments: arguments);

  /// perform replace with routeName
  Future<dynamic> pushReplacementNamed(
    String screenName, {
    Object? arguments,
    bool rootNavigator = false,
  }) =>
      Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).pushReplacementNamed(screenName, arguments: arguments);

  /// perform replace with routeName
  void popUntil(
    String screenName, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(
        this,
        rootNavigator: rootNavigator,
      ).popUntil(ModalRoute.withName(screenName));
}
