import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/navigation_extension.dart';
import '../../add_category/add_category_page.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/custom_button.dart';
import 'edit_product_bottom_sheet.dart';
import 'product_list.dart';

class AddProductsBodyContent extends StatelessWidget {
  const AddProductsBodyContent({super.key});

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
                  return ProductList();
                },
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Row(
              spacing: 5.0,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: CustomButton(
                    text: AppStrings.addProduct,
                    onPressed: () => editProductBottomSheet(context,true),
                    color: AppColors.primaryColor,
                    textColor: AppColors.whiteColor,
                    paddingHorizontal: 30,
                  ),
                ),
                Flexible(
                  child: CustomButton(
                    text: AppStrings.addCategory,
                    onPressed: () => context.pushScreen(AddCategoryPage()),
                    color: AppColors.primaryColor,
                    textColor: AppColors.whiteColor,
                    paddingHorizontal: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
