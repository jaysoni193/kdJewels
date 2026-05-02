import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/custom_view/custom_button.dart';
import '../../../../../../../core/utils/custom_view/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

addUpdateCategory({required bool isFromUpdate}){
  return Column(
    spacing: 20.0,
    children: [
      Center(
        child: Text(isFromUpdate ? AppStrings.editCategory : AppStrings.addCategory,style: AppTextStyles.bold.copyWith(fontSize: 15.0.sp,color: AppColors.black)),
      ),
      CustomTextFormField(
        hintText: AppStrings.lblProductCategory,
        obscureText: false,
        keyboardType: TextInputType.text,
        controller: TextEditingController(),
        validator: (value) {
          return null;
        },
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]'))],
      ),
      CustomButton(
        text: isFromUpdate ? AppStrings.editCategory : AppStrings.addCategory,
        onPressed: () {},
        color: AppColors.black,
        textColor: AppColors.whiteColor,
        paddingHorizontal: 30,
      ),
    ],
  );
}