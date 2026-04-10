import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/constants/app_strings.dart';
import 'product_detail_sub_widget/product_specification_table_sub_widget.dart';
import 'product_detail_sub_widget/write_review_sub_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productSpecificationWidget(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    children: [
      //Product Specification
      Container(
        width: screenWidth.w,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(1, 2),
              top: Radius.elliptical(1, 2),
            ),
            boxShadow: [BoxShadow(color: AppColors.grey.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]
        ),
        child: Padding(
          padding: EdgeInsets.only(left: AppUtils.appPadding),
          child: ExpansionTile(
            showTrailingIcon: true,
            minTileHeight: 40.0,
            title: Text(
              AppStrings.productSpecification,
              style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),
            childrenPadding: EdgeInsets.zero,
            children: <Widget>[
              productSpecificationTableSubWidget(),
            ],
          ),
        ),
      ),
      //Write a Review
      Container(
        width: screenWidth.w,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(1, 2),
              top: Radius.elliptical(1, 2),
            ),
            boxShadow: [BoxShadow(color: AppColors.grey.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
        child: Padding(
          padding: EdgeInsets.only(left: AppUtils.appPadding),
          child: ExpansionTile(
            showTrailingIcon: true,
            minTileHeight: 40.0,
            title: Text(
              AppStrings.writeAReview,
              style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),
            childrenPadding: EdgeInsets.zero,
            children: <Widget>[
              WriteReviewSubWidget(),
            ],
          ),
        ),
      ),
      //ask a Question
      Container(
        width: screenWidth.w,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(1, 2),
              top: Radius.elliptical(1, 2),
            ),
            boxShadow: [BoxShadow(color: AppColors.grey.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
        child: Padding(
          padding: EdgeInsets.only(left: AppUtils.appPadding),
          child: ExpansionTile(
            showTrailingIcon: true,
            minTileHeight: 40.0,
            title: Text(
              AppStrings.askQuestion,
              style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),
            childrenPadding: EdgeInsets.zero,
            children: <Widget>[
            ],
          ),
        ),
      ),

    ],
  );
}
