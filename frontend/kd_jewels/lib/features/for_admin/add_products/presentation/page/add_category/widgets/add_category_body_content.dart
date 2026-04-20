import 'package:flutter/material.dart';
import 'package:kd_jewels/features/for_admin/add_products/presentation/page/add_category/widgets/category_bottom_sheet.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/custom_button.dart';
import 'category_list.dart';

class AddCategoryBodyContent extends StatelessWidget {
  const AddCategoryBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Column(
            spacing: 10.0,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CategoryList();
                },
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: CustomButton(
              text: AppStrings.addCategory,
              onPressed: () => categoryBottomSheet(context,true),
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              paddingHorizontal: 30,
            ),
          ),
        ],
      ),
    );
  }
}
