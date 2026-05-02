import 'package:flutter/material.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/custom_view/common_bottom_sheet.dart';
import '../../../../../../../core/utils/custom_view/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../admin_dashboard/presentation/page/widgets/action_button_widget.dart';
import 'product_form.dart';

editProductBottomSheet(BuildContext context,bool isFromAdd) {
  showCommonBottomSheet(
    context: context,
    headerChild: Center(
      child: Text(
        isFromAdd ? AppStrings.addProduct:AppStrings.editProduct,
        style: AppTextStyles.semiBold.copyWith(fontSize: 18.sp, color: AppColors.black),
      ),
    ),
    middleChild: StatefulBuilder(
      builder: (context, setState) {
        return ProductForm();
      },
    ),
    bottomChild: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(text: AppStrings.btnSubmit, onPressed: () {}, color: AppColors.black, textColor: AppColors.whiteColor,),
          ],
        ),
  )/*.whenComplete(() {
    //When close the form then resetData
  },)*/;
}
