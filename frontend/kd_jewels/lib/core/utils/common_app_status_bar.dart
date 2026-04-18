import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonAppStatusBar extends StatelessWidget {
  final Widget child;
  final Brightness iconBrightness;
  final Color color;

  const CommonAppStatusBar({
    super.key,
    required this.child,
    required this.iconBrightness,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness,
        statusBarBrightness:
        iconBrightness == Brightness.dark ? Brightness.light : Brightness.dark,
      ),
      child: child,
    );
  }
}