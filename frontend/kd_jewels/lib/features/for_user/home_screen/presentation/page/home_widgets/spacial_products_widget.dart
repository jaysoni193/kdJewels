import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import 'common_header_widget.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_divider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacialProductsWidget extends StatefulWidget {
  final String? headerText;
  final String? quoteText;
  final List? listName;
  final VoidCallback? onTap;
  final bool isHeaderTextShow;

  const SpacialProductsWidget({super.key, required this.listName, required this.onTap, this.headerText, this.quoteText, required this.isHeaderTextShow});

  @override
  State<SpacialProductsWidget> createState() => _SpacialProductsWidgetState();
}

class _SpacialProductsWidgetState extends State<SpacialProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(visible: widget.isHeaderTextShow, child: commonHeaderWidget(widget.headerText ?? '', widget.quoteText ?? '')),
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
                          BoxShadow(color: AppColors.primaryColor.withOpacity(0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                          child: Image.asset(
                            widget.listName?[index].image ?? "",
                            width: 130.w,
                            height: 120.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                          child: SizedBox(
                            height: 35,
                            width: 130,
                            child: Container(
                              color: AppColors.whiteColor,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.listName?[index].text ?? "",
                                  style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
                                  maxLines: 3,
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
