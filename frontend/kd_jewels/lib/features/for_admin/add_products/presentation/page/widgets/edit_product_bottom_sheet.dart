import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/common_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/custom_button.dart';

editProductBottomSheet(BuildContext context) {
  showCommonBottomSheet(
    context: context,
    headerChild: Center(
      child: Text(
        AppStrings.editProduct,
        style: AppTextStyles.semiBold.copyWith(fontSize: 18.sp, color: AppColors.primaryColor),
      ),
    ),
    middleChild: StatefulBuilder(
      builder: (context, setState) {
        return Column();
      },
    ),
    heightFactor: 0.99,
    bottomChild: Row(
          children: [
            SizedBox(
              height: 50,
              child: CustomButton(
                text: '',
                onPressed: () {},
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                paddingHorizontal: 5.0,
                paddingVertical: 0.0,
                borderColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),

  ).whenComplete(() {
    //When close the form then resetData
  },);
}
