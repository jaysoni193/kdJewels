import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../extensions/widget_size_extension.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final String? buttonText;
  final bool? isShowImage;
  final bool? isShowButtonText;
  final String? image;
  final double? imageWidth;
  final VoidCallback? onPressed;

  const CustomDivider({super.key, this.text, this.buttonText, required this.isShowImage, this.image, required this.isShowButtonText, this.imageWidth, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.primaryColor,
            thickness: 0.8,
          ),
        ),
        2.0.wSpace,
        Visibility(
          visible: isShowButtonText ?? false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? '',
                style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
              ),
              8.0.wSpace,
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                child: Text(
                  buttonText ?? '',
                  style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isShowImage ?? false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image ?? '',
                color: AppColors.primaryColor,
                isAntiAlias: true,
                width: imageWidth,
                height: 25.h,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        2.0.wSpace,
        const Expanded(
          child: Divider(
            color: AppColors.primaryColor,
            thickness: 0.8,
          ),
        ),
      ],
    );
  }
}
