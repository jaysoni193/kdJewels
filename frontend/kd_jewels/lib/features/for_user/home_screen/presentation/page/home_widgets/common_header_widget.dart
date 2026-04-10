import 'package:flutter/cupertino.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget commonHeaderWidget(String headerText, String quoteText) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            headerText ?? '',
            style: AppTextStyles.medium.copyWith(
              color: AppColors.primaryColor,
              fontSize: 16.0.sp,
            ),
          ),
          Visibility(
            visible: quoteText.isNotEmpty,
            child: Column(
              children: [
                2.0.hSpace,
                Text(
                  quoteText ?? '',
                  style: AppTextStyles.medium.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),

          5.0.hSpace,
        ],
      ),
    ],
  );
}
