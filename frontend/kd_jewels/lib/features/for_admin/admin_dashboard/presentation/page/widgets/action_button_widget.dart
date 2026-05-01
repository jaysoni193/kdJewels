import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';

class ActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool outlined;

  const ActionBtn({super.key, required this.label, required this.icon, required this.onTap, this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: outlined ? Colors.transparent : AppColors.black,
          border: Border.all(color: outlined ?  AppColors.grey : AppColors.black, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16.r, color: outlined ? AppColors.black.withValues(alpha: 0.5) : Colors.white),
            6.0.wSpace,
            Text(
              label,
              style: AppTextStyles.medium.copyWith(fontSize: 13.sp, color: outlined ? AppColors.black.withValues(alpha: 0.5) : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
