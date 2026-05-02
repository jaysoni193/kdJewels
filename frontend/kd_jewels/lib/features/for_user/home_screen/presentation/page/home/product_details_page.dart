import 'package:flutter/material.dart';
import 'package:kd_jewels/core/utils/custom_view/common_app_status_bar.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_view/common_app_bar.dart';
import '../../../../../../core/utils/custom_view/custom_button.dart';
import '../product_details_widgets/product_details_body_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonAppStatusBar(
        color: AppColors.primaryColor,
        iconBrightness: Brightness.light,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: CommonAppBar(pageName: AppStrings.productDetail, isShowLogo: false,),
          ),
          floatingActionButton: Container(
            color: AppColors.whiteColor,
            height: 60.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///Add To Cart
                  CustomButton(
                    text: AppStrings.addToCart,
                    onPressed: () {},
                    color: AppColors.secondPrimaryColor,
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 5.0,
                    paddingVertical: 8,
                    paddingHorizontal: 50,
                  ),

                  ///Buy Now
                  CustomButton(
                    text: AppStrings.buyNow,
                    onPressed: () {},
                    color: AppColors.primaryColor,
                    textColor: AppColors.secondPrimaryColor,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 5.0,
                    paddingVertical: 8,
                    paddingHorizontal: 60,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: ProductDetailsBodyContent(
            product: {
              'name': 'Gold Necklace',
              'price': '25000',
              'material': '22K Gold',
              'weight': '14.10',
              'description': 'A beautifully crafted gold necklace perfect for weddings and special occasions.',
              'images': [AppAssets.temp, AppAssets.temp, AppAssets.temp],
            },
          ),
        ),
      ),
    );
  }
}
