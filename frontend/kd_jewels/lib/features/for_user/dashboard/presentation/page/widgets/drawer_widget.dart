import 'package:flutter/material.dart';
import 'package:kd_jewels/core/constants/app_assets.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/utils/custom_view/common_expansion_tile.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../other_screens/presentation/page/other_screens/custom_jewels_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget drawerWidget(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: ListView(
        children: [
          SizedBox(
            height: 80,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.icUser,
                        width: screenWidth * 0.07.w, // 18% of screen width
                        height: screenHeight * 0.04.h, // 6% of screen height
                        fit: BoxFit.contain,
                        color: AppColors.primaryColor,
                      ),
                      8.0.wSpace,
                      Row(
                        children: [
                          Text(
                            "Hi",
                            style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 17.0.sp, fontWeight: FontWeight.w700),
                          ),
                          5.0.wSpace,
                          Text("John !", //UserName who stores in AppPreference
                              style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 17.0.sp, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //MyProfile,orderHistory
          CommonExpansionTile(
            text: AppStrings.myProfile,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.orderHistory,
          ),

          //ShopBy
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 5.0),
            child: Text(
              AppStrings.shopBy,
              style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
            ),
          ),
          CommonExpansionTile(
            text: AppStrings.allJewellery,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.metal,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.collection,
          ),
          10.0.hSpace,
          //ShopFor
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 5.0),
            child: Text(
              AppStrings.shopFor,
              style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor,),
            ),
          ),
          CommonExpansionTile(
            text: AppStrings.men,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.kids,
          ),
          25.0.hSpace,
          //Other
          CommonExpansionTile(
            text: AppStrings.wishlist,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.jewelleryCare,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.getInTouch,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.customJewels,
            onTap: () {
              context.popScreen();
              context.pushScreen(CustomJewelsPage());
            },
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.feedback,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.policy,
          ),
          10.0.hSpace,
          CommonExpansionTile(
            text: AppStrings.logout,
          ),
          10.0.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  AppStrings.deleteAccount,
                  style: AppTextStyles.medium.copyWith(color: AppColors.red),
                ),
              ),
            ],
          ),
          10.0.hSpace,
        ],
      ));
}
