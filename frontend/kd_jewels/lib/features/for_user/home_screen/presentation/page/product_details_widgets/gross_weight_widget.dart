import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_view/custom_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget grossWeightWidget(
  String? weight,
) {
  return CustomContainer(
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppUtils.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppStrings.grossWeight,
                  style: AppTextStyles.medium.copyWith(color: AppColors.black, fontSize: 17.0.sp, fontWeight: FontWeight.w500),
                ),
                5.0.wSpace,
                Text(
                  '(in Grams)',
                  style: AppTextStyles.medium.copyWith(color: AppColors.grey, fontWeight: FontWeight.w700),
                )
              ],
            ),
            5.0.hSpace,
            Text(AppStrings.text),
            15.0.hSpace,
            Text(
              AppStrings.weightInGram,
              style: AppTextStyles.medium.copyWith(color: AppColors.black, fontSize: 15.0.sp, fontWeight: FontWeight.w500),
            ),
            8.0.hSpace,
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.3), borderRadius: BorderRadius.all(Radius.circular(20)), border: Border.all(color: AppColors.primaryColor)),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Text(
                '1.960',
                style: AppTextStyles.medium.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 15.0.sp,
                ),
              ),
            ),
          ],
        )),
  );
}
