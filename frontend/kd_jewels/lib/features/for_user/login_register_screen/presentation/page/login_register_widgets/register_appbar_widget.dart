import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/constants/app_colors.dart';

registerAppBarWidget(BuildContext context) {
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
          context.popScreen();
        },
        icon: Icon(
          Icons.clear,
          color: AppColors.primaryColor,
        ),
        iconSize: 24,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
  );
}
