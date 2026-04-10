import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/constants/app_colors.dart';

onBoardingAppBarWidget(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.zero,
    child: AppBar(
      backgroundColor: AppColors.secondPrimaryColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
}
