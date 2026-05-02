import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../app_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget headerLabel(String? headerText) {
  return Padding(
    padding: EdgeInsets.only(left: AppUtils.appPadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          headerText ?? '',
          style: AppTextStyles.medium.copyWith(
            color: AppColors.primaryColor,
            fontSize: 16.0.sp,
          ),
        ),
      ],
    ),
  );
}
