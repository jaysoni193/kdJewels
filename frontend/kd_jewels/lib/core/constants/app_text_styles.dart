import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle appbarTextStyle =  TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.normal);

  // Large Text
  static TextStyle get large => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle get medium => TextStyle(fontFamily: 'Poppins-Medium', fontSize: 13.sp, fontWeight: FontWeight.w500, color: AppColors.black);

  static TextStyle get bold => TextStyle(fontFamily: 'Poppins-Bold', fontSize: 14.sp, fontWeight: FontWeight.w700, color: AppColors.whiteColor);

  static TextStyle get extraBold => TextStyle(fontFamily: 'Poppins', fontSize: 28.sp, fontWeight: FontWeight.w800, color: AppColors.primaryColor);

  static TextStyle get semiBold => TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.black);

}
