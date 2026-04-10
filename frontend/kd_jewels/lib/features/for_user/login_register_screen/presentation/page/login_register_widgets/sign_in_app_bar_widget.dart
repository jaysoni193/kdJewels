import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/constants/app_colors.dart';

signInAppBarWidget(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.zero,
    child: AppBar(
      backgroundColor: AppColors.secondPrimaryColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.secondPrimaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
}
