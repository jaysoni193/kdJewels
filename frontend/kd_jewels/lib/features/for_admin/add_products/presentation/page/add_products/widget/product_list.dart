import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.image, size: 30),
          ),

          const SizedBox(width: 25),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Test', style: AppTextStyles.semiBold.copyWith(fontSize: 16.sp)),
                Text('2000', style: AppTextStyles.medium),
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
                  editProductBottomSheet(context,false);
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
