import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_strings.dart';
import 'common_header_widget.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_view/custom_divider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftingWidget extends StatefulWidget {
  final String? headerText;
  final String? quoteText;
  final List? listName;
  final VoidCallback? onTap;
  final bool isHeaderTextShow;

  const GiftingWidget({
    super.key,
    required this.listName,
    required this.onTap,
    this.headerText,
    this.quoteText,
    required this.isHeaderTextShow,
  });

  @override
  State<GiftingWidget> createState() => _GiftingWidgetState();
}

class _GiftingWidgetState extends State<GiftingWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Visibility(
          visible: widget.isHeaderTextShow,
          child: commonHeaderWidget(widget.headerText ?? '', widget.quoteText ?? ''),
        ),
        CustomDivider(
          isShowImage: true,
          isShowButtonText: false,
          image: AppAssets.divider_2,
          imageWidth: 80.w,
        ),
        AppUtils.appPadding.hSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: List.generate(widget.listName!.length, (index) {
              return InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(8.0),
                          top: Radius.circular(8.0),
                        ),
                        boxShadow: [
                          BoxShadow(color: AppColors.primaryColor.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                          child: Image.asset(
                            widget.listName?[index].image ?? "",
                            width: screenWidth * 0.82.w,
                            height: 160.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                          child: SizedBox(
                            height: 35.h,
                            width: screenWidth * 0.82.w,
                            child: Container(
                              color: AppColors.whiteColor,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.listName?[index].text ?? "",
                                      style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
                                      maxLines: 3,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          AppStrings.collection,
                                          style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
                                          maxLines: 3,
                                        ),
                                        5.0.wSpace,
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.primaryColor,
                                          size: 12.sp,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
