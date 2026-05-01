import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class DashboardCardWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final IconData? icon;

  const DashboardCardWidget({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.05), blurRadius: 6, offset: const Offset(0, 3))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32.sp, color: AppColors.golden),
            Text(
              value ?? '',
              style: AppTextStyles.semiBold.copyWith(fontSize: 18.0.sp, color: AppColors.primaryColor),
            ),
            Text(
              title ?? '',
              style: AppTextStyles.semiBold.copyWith(fontSize: 16.0.sp, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
