import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_assets.dart';

class AppUtils {
  //default app padding
  static double appPadding = 15.0.sp;

  //NoData
  static Widget noData() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.icNoData, height: 80.h, width: 80.w, color: AppColors.primaryColor),
          Text(
            AppStrings.noDataFound,
            style: AppTextStyles.semiBold.copyWith(fontSize: 18.0.sp, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

}
