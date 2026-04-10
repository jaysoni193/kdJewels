import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  // Push a new screen
  Future<void> pushScreen(Widget screen) {
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // Pop the current screen
  void popScreen() {
    Navigator.pop(this);
  }

  // Push a new screen and remove all previous screens
  Future<void> pushAndRemoveAll(Widget screen) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false, // Removes all routes
    );
  }

  // Replace the current screen with a new one
  Future<void> replaceScreen(Widget screen) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // Pop until a specific screen is found
  void popUntilRoute(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }
}
