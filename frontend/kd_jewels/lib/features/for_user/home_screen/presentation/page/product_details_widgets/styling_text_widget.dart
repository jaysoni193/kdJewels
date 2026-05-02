import 'package:flutter/material.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_view/custom_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget stylingTextWidget() {
  return CustomContainer(
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppUtils.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.styling,
              style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),
            ),
            15.0.hSpace,
            Text(
              AppStrings.casualWear,
              style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            5.0.hSpace,
            Text(AppStrings.text)
          ],
        )),
  );
}
