import 'package:flutter/material.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/custom_dialog_box.dart';
import '../../../../../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5, offset: const Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Product Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text('Test', style: AppTextStyles.semiBold.copyWith(fontSize: 16.0.sp)),
              ),
            ],
          ),

          // Actions
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: AppColors.black, size: 20.0.sp),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.red, size: 20.0.sp),
                onPressed: () => CustomDialogBox.showDeleteAccountDialog(context,okBtn: () {},cancelBtn: () {},),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

