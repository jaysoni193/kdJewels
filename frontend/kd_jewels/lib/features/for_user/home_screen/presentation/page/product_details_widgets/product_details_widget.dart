import 'package:flutter/material.dart';
import '../../../../../../../core/utils/custom_container.dart';
import '../../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../../core/utils/custom_button.dart';
import '../../../../../../../core/utils/custom_text_form_field.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/app_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productDetailsWidget(
  String? name,
  String? price,
  String? material,
) {
  return CustomContainer(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppUtils.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name ?? '', style: AppTextStyles.medium),
          Text(
            "₹ ${price ?? ''}",
            style: AppTextStyles.medium,
          ),
          2.0.hSpace,
          Text(
            material ?? '',
            style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 11.0.sp),
          ),
          2.0.hSpace,
          Text(
            AppStrings.inclusiveOfAllTax,
            style: AppTextStyles.medium.copyWith(color: AppColors.grey, fontWeight: FontWeight.w600, fontSize: 11.0.sp),
          ),
          10.0.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: CustomTextFormField(hintText: AppStrings.pinCodeHint, obscureText: false, keyboardType: TextInputType.number, controller: TextEditingController())),
              5.0.wSpace,
              Expanded(
                flex: 0,
                child: CustomButton(
                  text: AppStrings.check,
                  onPressed: () {},
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  paddingHorizontal: 10.0,
                  paddingVertical: 10.0,
                  borderWidth: 1,
                  borderRadius: 10.0,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
