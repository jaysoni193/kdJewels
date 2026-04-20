import 'package:flutter/material.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/common_bottom_sheet.dart';
import '../../../../../../../core/utils/custom_button.dart';
import 'category_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

categoryBottomSheet(BuildContext context,bool isFromAdd) {
  showCommonBottomSheet(
    context: context,
    headerChild: Center(
      child: Text(
        isFromAdd? AppStrings.addCategory :AppStrings.editCategory,
        style: AppTextStyles.semiBold.copyWith(fontSize: 18.sp, color: AppColors.primaryColor),
      ),
    ),
    middleChild: StatefulBuilder(
      builder: (context, setState) {
        return CategoryForm();
      },
    ),
    bottomChild: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(text: AppStrings.submit, onPressed: () {}, color: AppColors.primaryColor, textColor: AppColors.whiteColor),
      ],
    ),
  )/*.whenComplete(() {
    //When close the form then resetData
  },)*/;
}
