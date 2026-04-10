import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget filterByPrice() {
  return SizedBox(
    height: 35,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10, // Number of items
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(18), border: Border.all(color: AppColors.primaryColor)),
          child: Center(
            child: Text('Item ${index + 1}', style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 12.0.sp, fontWeight: FontWeight.w400)),
          ),
        );
      },
    ),
  );
}
