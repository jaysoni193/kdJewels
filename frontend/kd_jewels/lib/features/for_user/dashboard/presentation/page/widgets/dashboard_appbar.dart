import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../other_screens/presentation/page/other_screens/wishlist_page.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/custom_circle_icon_button.dart';
import '../../../../other_screens/presentation/page/other_screens/add_to_cart_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SelectedButton {
  none,
  menu,
  favorite,
  notification,
  cart,
}

class DashboardAppbar extends StatefulWidget {
  const DashboardAppbar({super.key});

  @override
  State<DashboardAppbar> createState() => _DashboardAppbarState();
}

class _DashboardAppbarState extends State<DashboardAppbar> {
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
            width: screenWidth * 0.18.w,
            height: screenHeight * 0.06.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 9.0, top: 9.0, bottom: 9.0),
        child: CustomCircleIconButton(
          icon: Icons.menu,
          onTap: () {
            Scaffold.of(context).openDrawer();
            setState(() {
              selectedButton = SelectedButton.menu;
            });
          },
          isSelected: selectedButton == SelectedButton.menu,
          selectedColor: AppColors.primaryColor,
          unselectedColor: AppColors.whiteColor,
          selectedIconColor: AppColors.whiteColor,
          unselectedIconColor: AppColors.primaryColor,
          size: 34.sp,
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
              context.pushScreen(WishlistPage());
            },
            isSelected: selectedButton == SelectedButton.favorite,
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
            icon: Icons.shopping_bag_outlined,
            onTap: () {
              setState(() {
                selectedButton = SelectedButton.cart;
              });
              context.pushScreen(AddToCartPage());
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
