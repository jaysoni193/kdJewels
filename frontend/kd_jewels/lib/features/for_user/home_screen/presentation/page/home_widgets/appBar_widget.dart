import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kd_jewels/core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/custom_view/custom_circle_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SelectedButton {
  none,
  menu,
  favorite,
  notification,
  cart,
}

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  SelectedButton selectedButton = SelectedButton.none;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      title: Row(
        children: [
          Image.asset(
            AppAssets.homeLogo,
            width: screenWidth * 0.18.w, // 18% of screen width
            height: screenHeight * 0.06.h, // 6% of screen height
            fit: BoxFit.contain,
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomCircleIconButton(
          icon: Icons.menu,
          onTap: () {
            setState(() {
              selectedButton = SelectedButton.menu;
            });
          },
          isSelected: selectedButton == SelectedButton.menu,
          selectedColor: AppColors.primaryColor,
          unselectedColor: AppColors.whiteColor,
          selectedIconColor: AppColors.whiteColor,
          unselectedIconColor: AppColors.primaryColor,
          size: 34,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCircleIconButton(
            icon: Icons.favorite_border,
            onTap: () {
              setState(() {
                selectedButton = SelectedButton.favorite;
              });
            },
            isSelected: selectedButton == SelectedButton.favorite,
            selectedColor: AppColors.primaryColor,
            unselectedColor: AppColors.whiteColor,
            selectedIconColor: AppColors.whiteColor,
            unselectedIconColor: AppColors.primaryColor,
            size: 36,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCircleIconButton(
            icon: Icons.notifications_none,
            onTap: () {
              setState(() {
                selectedButton = SelectedButton.notification;
              });
            },
            isSelected: selectedButton == SelectedButton.notification,
            selectedColor: AppColors.primaryColor,
            unselectedColor: AppColors.whiteColor,
            selectedIconColor: AppColors.whiteColor,
            unselectedIconColor: AppColors.primaryColor,
            size: 34.sp,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCircleIconButton(
            icon: Icons.shopping_cart_outlined,
            onTap: () {
              setState(() {
                selectedButton = SelectedButton.cart;
              });
            },
            isSelected: selectedButton == SelectedButton.cart,
            selectedColor: AppColors.primaryColor,
            unselectedColor: AppColors.whiteColor,
            selectedIconColor: AppColors.whiteColor,
            unselectedIconColor: AppColors.primaryColor,
            size: 34.sp,
          ),
        ),
      ],
    );
  }
}
