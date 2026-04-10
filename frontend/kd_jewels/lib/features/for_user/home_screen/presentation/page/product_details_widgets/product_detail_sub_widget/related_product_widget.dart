import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../../core/utils/header_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedProductWidget extends StatefulWidget {
  final String? headerText;
  final List? listName;
  final VoidCallback? onTap;

  const RelatedProductWidget({super.key, required this.headerText, required this.listName, required this.onTap});

  @override
  State<RelatedProductWidget> createState() => _RelatedProductWidgetState();
}

class _RelatedProductWidgetState extends State<RelatedProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: widget.headerText?.isNotEmpty ?? false, child: headerLabel(widget.headerText ?? '')),
        15.0.hSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: List.generate(widget.listName!.length, (index) {
              final item = widget.listName?[index];
              return InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
                      BoxShadow(color: AppColors.primaryColor.withOpacity(0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))
                    ]),
                    child: SizedBox(
                      height: 210.h,
                      width: 140.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            item.image ?? '',
                            width: 140.w,
                            height: 130.h,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.productName ?? '',
                                  style: AppTextStyles.medium.copyWith(fontSize: 13.0.sp, fontWeight: FontWeight.w500),
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.currency_rupee_outlined,
                                      color: AppColors.black,
                                      size: 15.sp,
                                    ),
                                    Text(
                                      item.productPrice,
                                      style: AppTextStyles.medium.copyWith(fontSize: 13.0.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
