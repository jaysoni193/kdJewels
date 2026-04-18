import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_text_styles.dart';

Widget actionButton(IconData icon, String label, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      spacing: 6.0,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, size: 28.sp, color: AppColors.golden),
          ),
        ),
        Text(label, style: AppTextStyles.semiBold.copyWith(fontSize: 14.0.sp,color: AppColors.primaryColor)),
      ],
    ),
  );
}