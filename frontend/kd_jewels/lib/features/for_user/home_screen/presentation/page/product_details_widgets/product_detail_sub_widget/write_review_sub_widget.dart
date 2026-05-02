import 'package:flutter/material.dart';
import '../../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/custom_view/custom_text_form_field.dart';

class WriteReviewSubWidget extends StatefulWidget {
  const WriteReviewSubWidget({super.key});

  @override
  State<WriteReviewSubWidget> createState() => _WriteReviewSubWidgetState();
}

class _WriteReviewSubWidgetState extends State<WriteReviewSubWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppUtils.appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.title,
            style: AppTextStyles.medium,
          ),
          5.0.hSpace,
          CustomTextFormField(
              validator: (p0) {
                return null;
              }, hintText: AppStrings.headLineForYourReview, obscureText: false, keyboardType: TextInputType.text, controller: TextEditingController()),
          10.0.hSpace,
          Text(
            AppStrings.addAReview,
            style: AppTextStyles.medium,
          ),
          5.0.hSpace,
          CustomTextFormField(
            validator: (p0) {
              return null;
            },
            hintText: AppStrings.enterYourReview,
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            maxLength: 200,
            isMaxLine: true,
          ),
        ],
      ),
    );
  }
}
