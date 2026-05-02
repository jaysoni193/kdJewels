import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_view/custom_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productDescriptionWidget() {

  return CustomContainer(
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppUtils.appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.descriptionOfTheProduct,
              style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),
            10.0.hSpace,
            Text(AppStrings.text),

          ],
        )),
  );
}
