import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_view/custom_divider.dart';
import 'common_header_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopByGenderWidget extends StatefulWidget {
  final String? headerText;
  final String? quoteText;
  final VoidCallback? onTap;
  final bool isHeaderTextShow;

  const ShopByGenderWidget({super.key, required this.onTap, this.headerText, this.quoteText, required this.isHeaderTextShow});

  @override
  State<ShopByGenderWidget> createState() => _ShopByGenderWidgetState();
}

class _ShopByGenderWidgetState extends State<ShopByGenderWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Visibility(visible: widget.isHeaderTextShow, child: commonHeaderWidget(widget.headerText ?? '', widget.quoteText ?? '')),
        CustomDivider(
          isShowImage: true,
          isShowButtonText: false,
          image: AppAssets.divider_3,
          imageWidth: 80.w,
        ),
        AppUtils.appPadding.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Men
            cardForMen(screenWidth),
            //Kids
            cardForKids(screenWidth),
          ],
        ),
        AppUtils.appPadding.hSpace,
        //Women
        cardForWomen(screenWidth),
      ],
    );
  }

  cardForMen(screenWidth) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppUtils.appPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(8.0),
              top: Radius.circular(8.0),
            ),
            boxShadow: [BoxShadow(color: AppColors.primaryColor.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              child: Image.asset(
                AppAssets.temp,
                width: screenWidth * 0.4,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
              child: SizedBox(
                height: 38.0.h,
                width: screenWidth * 0.4.w,
                child: Container(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.men,
                          style: AppTextStyles.medium.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.collection,
                              style: AppTextStyles.medium.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.0.wSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12.0.sp,
                              color: AppColors.primaryColor,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  cardForKids(screenWidth) {
    return Padding(
      padding: EdgeInsets.only(right: AppUtils.appPadding),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(8.0),
              top: Radius.circular(8.0),
            ),
            boxShadow: [BoxShadow(color: AppColors.primaryColor.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              child: Image.asset(
                AppAssets.temp,
                width: screenWidth * 0.4.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
              child: SizedBox(
                height: 38.0.h,
                width: screenWidth * 0.4.w,
                child: Container(
                  color: AppColors.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.kids,
                          style: AppTextStyles.medium.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.collection,
                              style: AppTextStyles.medium.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.0.wSpace,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12.0.sp,
                              color: AppColors.primaryColor,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  cardForWomen(screenWidth) {
    return Padding(
      padding: EdgeInsets.only(left: AppUtils.appPadding, right: AppUtils.appPadding),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(8.0),
              top: Radius.circular(8.0),
            ),
            boxShadow: [BoxShadow(color: AppColors.primaryColor.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              child: Image.asset(
                AppAssets.temp,
                width: screenWidth * 0.89.w,
                height: 170.h,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
              child: SizedBox(
                height: 38.0.h,
                width: screenWidth * 0.8.w,
                child: Padding(
                  padding: EdgeInsets.only(left: AppUtils.appPadding, bottom: 10.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.women,
                        style: AppTextStyles.medium.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.collection,
                            style: AppTextStyles.medium.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          4.0.wSpace,
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12.sp,
                            color: AppColors.primaryColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
