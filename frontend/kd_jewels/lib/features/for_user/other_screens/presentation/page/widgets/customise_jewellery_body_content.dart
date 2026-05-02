import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_view/custom_button.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_view/custom_drop_down.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';

enum ColorLabel { green, red, blue }

extension ColorLabelExtension on ColorLabel {
  String get name {
    switch (this) {
      case ColorLabel.green:
        return 'Green';
      case ColorLabel.red:
        return 'Red';
      case ColorLabel.blue:
        return 'Blue';
      default:
        return '';
    }
  }

  static List<ColorLabel> get entries => ColorLabel.values;
}

Widget customiseJewelleryBodyContent(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppUtils.appPadding,
      ),
      child: Column(
        spacing: AppUtils.appPadding,
        children: [
          CustomDropdown(
            items: ["test"],
            validator: (value) {
              return null;
            },
            onChanged: (value) {},
            label: AppStrings.lblProductCategory,
          ),
          CustomDropdown(
            items: ["test"],
            validator: (value) {
              return null;
            },
            onChanged: (value) {},
            label: AppStrings.lblProductCategory,
          ),
          CustomDropdown(
            items: ["test"],
            validator: (value) {
              return null;
            },
            onChanged: (value) {},
            label: AppStrings.lblProductCategory,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: AppStrings.btnSubmit,
                onPressed: () {},
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                borderRadius: 5.0,
              ),
            ],
          ),
          20.0.hSpace,
        ],
      ),
    ),
  );
}
