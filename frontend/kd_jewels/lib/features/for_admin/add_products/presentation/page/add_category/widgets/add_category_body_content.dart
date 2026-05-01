import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../admin_dashboard/presentation/page/widgets/subtle_background.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/custom_button.dart';
import '../../../../../../../core/utils/custom_text_form_field.dart';
import 'add_update_category.dart';
import 'category_list.dart';

class AddCategoryBodyContent extends StatelessWidget {
  const AddCategoryBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SubtleBackground(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
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
        ),
        Positioned(
          bottom: 10,
          left: 20,
          right: 20,
          child: CustomButton(
            text: AppStrings.addCategory,
            onPressed: () => AppUtils().showCustomDialog(
              context: context,
              height: 200.0,
              child: addUpdateCategory(isFromUpdate: false),
            ),
            color: AppColors.black,
            textColor: AppColors.whiteColor,
            paddingHorizontal: 30,
          ),
        ),
      ],
    );
  }

}


