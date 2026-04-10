import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const CustomContainer({
    super.key,
    required this.child, this.height,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height?.h,
      width: screenWidth.w,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(1, 2),
            top: Radius.elliptical(1, 2),
          ),
          boxShadow: [BoxShadow(color: AppColors.grey.withOpacity(0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
      padding: EdgeInsets.only(left: AppUtils.appPadding, top: AppUtils.appPadding, bottom: AppUtils.appPadding,right: AppUtils.appPadding),
      child: child,
    );
  }
}
