import 'package:flutter/material.dart';
import 'package:kd_jewels/core/extensions/widget_size_extension.dart';
import 'package:kd_jewels/core/utils/custom_dialog_box.dart';
import '../../../../../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/app_text_styles.dart';
import 'edit_product_bottom_sheet.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.withValues(alpha: 0.3)),
        boxShadow: [BoxShadow(color: AppColors.secondPrimaryColor)],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(color: AppColors.grey.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)),
            child: Icon(Icons.image, size: 50.sp),
          ),

          25.0.wSpace,

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Test', style: AppTextStyles.semiBold.copyWith(fontSize: 16.sp)),
                Text('Rs. 2000', style: AppTextStyles.medium),
                Text('Stock: 10', style: AppTextStyles.medium),
              ],
            ),
          ),

          // Actions
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: AppColors.black, size: 20.0.sp),
                onPressed: () {
                  editProductBottomSheet(context, false);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.red, size: 20.0.sp),
                onPressed: () {
                  CustomDialogBox.showDeleteAccountDialog(context, okBtn: () {}, cancelBtn: () {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
