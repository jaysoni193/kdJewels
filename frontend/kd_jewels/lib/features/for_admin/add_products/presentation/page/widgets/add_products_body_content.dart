import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_button.dart';
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
              ProductList(),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: CustomButton(text: AppStrings.addProduct, onPressed: () {}, color: AppColors.primaryColor, textColor: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}
