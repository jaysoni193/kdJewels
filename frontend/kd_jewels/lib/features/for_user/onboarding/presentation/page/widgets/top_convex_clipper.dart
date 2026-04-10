import 'package:flutter/cupertino.dart';

class TopConvexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const double curveHeight = 100; // Increase this to deepen the curve

    path.moveTo(0, curveHeight);

    // Draw deeper convex curve
    path.quadraticBezierTo(
      size.width / 2, 0,             // Control point at the top center
      size.width, curveHeight,       // End point
    );

    // Complete the rectangle
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
