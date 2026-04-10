import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double borderWidth;
  final TextStyle? textStyle; // <-- New textStyle parameter

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
    this.borderColor = Colors.transparent,
    this.borderRadius = 12.0,
    this.paddingVertical = 8.0,
    this.paddingHorizontal = 100.0,
    this.borderWidth = 2.0,
    this.textStyle, // <-- Optional style override
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                TextStyle( // Fallback to default if null
                  color: textColor,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
