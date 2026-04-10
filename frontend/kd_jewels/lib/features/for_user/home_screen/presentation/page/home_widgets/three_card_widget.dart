import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import 'common_header_widget.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_divider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeCardWidget extends StatefulWidget {
  final String? headerText;
  final String? quoteText;
  final String? image1;
  final String? image2;
  final String? image3;
  final VoidCallback? onTap;
  final bool isHeaderTextShow;

  const ThreeCardWidget({super.key, required this.onTap, this.headerText, this.quoteText, this.image1, this.image2, this.image3, required this.isHeaderTextShow});

  @override
  State<ThreeCardWidget> createState() => _ThreeCardWidgetState();
}

class _ThreeCardWidgetState extends State<ThreeCardWidget> {
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
        Padding(
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
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Image.asset(
                    widget.image1 ?? '',
                    width: screenWidth * 0.89.w,
                    height: 170.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        AppUtils.appPadding.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left
            leftCardImg(screenWidth),
            //Kids
            rightCardImg(screenWidth),
          ],
        ),
      ],
    );
  }

  leftCardImg(screenWidth) {
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
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(
                widget.image2 ?? '',
                width: screenWidth * 0.4.w,
                height: 145.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  rightCardImg(screenWidth) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppUtils.appPadding,
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
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.asset(
                widget.image2 ?? '',
                width: screenWidth * 0.4.w,
                height: 145.h,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
