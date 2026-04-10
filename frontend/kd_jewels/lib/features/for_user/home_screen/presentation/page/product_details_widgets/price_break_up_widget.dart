import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget priceBreakUpWidget(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
    width: screenWidth.w,
    decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(1, 2),
          top: Radius.elliptical(1, 2),
        ),
        boxShadow: [BoxShadow(color: AppColors.grey.withOpacity(0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
    child: Padding(
      padding: EdgeInsets.only(left: AppUtils.appPadding),
      child: ExpansionTile(
        showTrailingIcon: true,
        minTileHeight: 70.0,
        title: Text(
          AppStrings.priceBreakUp,
          style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp),
        ),
        subtitle: Text(
          AppStrings.goldRate,
          style: AppTextStyles.medium.copyWith(fontSize: 11.sp, fontWeight: FontWeight.w500, color: AppColors.grey),
        ),
        childrenPadding: EdgeInsets.zero,
        children: <Widget>[
        ],
      ),
    ),
  );
}
