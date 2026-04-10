import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomCircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final double size;

  const CustomCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
    this.selectedColor = AppColors.primaryColor,
    this.unselectedColor = AppColors.whiteColor,
    this.selectedIconColor = AppColors.whiteColor,
    this.unselectedIconColor = AppColors.primaryColor,
    this.size = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? selectedColor : unselectedColor,
          border: Border.all(color: AppColors.secondPrimaryColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            size: size * 0.5,
            color: isSelected ? selectedIconColor : unselectedIconColor,
          ),
        ),
      ),
    );
  }
}
