import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kd_jewels/features/for_user/login_register_screen/presentation/page/login_register/mobile_email_page.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/constants/app_colors.dart';

otpAppBarWidget(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  return PreferredSize(
    preferredSize: Size.fromHeight(screenHeight * 0.04), // 8% of screen height
    child: AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      leading: IconButton(
        onPressed: () {
      context.pushScreen(MobileEmailPage());
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.primaryColor,
        ),
        iconSize: 24,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
  );
}