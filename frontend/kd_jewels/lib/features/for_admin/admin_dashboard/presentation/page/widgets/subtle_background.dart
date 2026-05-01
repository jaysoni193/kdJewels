import 'package:flutter/material.dart';

class SubtleBackground extends StatelessWidget {
  const SubtleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // Clean off-white base
          Container(color: const Color(0xFFF5F4F0)),

          // Single soft warm circle top-right — barely visible
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFE8C97A).withValues(alpha: 0.12)),
            ),
          ),

          // Thin gold accent line at top
          Positioned(top: 0, left: 0, right: 0, child: Container(height: 2, color: const Color(0xFFD4AF5A).withValues(alpha: 0.4))),
        ],
      ),
    );
  }
}
