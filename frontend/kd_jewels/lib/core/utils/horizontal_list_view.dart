import 'package:flutter/material.dart';
import '../extensions/widget_size_extension.dart';
import 'header_text_widget.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalListView extends StatefulWidget {
  final String? headerText;
  final List? listName;
  final VoidCallback? onTap;

  const HorizontalListView({super.key, required this.headerText, required this.listName, required this.onTap});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: widget.headerText?.isNotEmpty ?? false, child: headerLabel(widget.headerText ?? '')),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: List.generate(widget.listName!.length, (index) {
              return GestureDetector(
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
                            width: 120.w,
                            height: 120.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                          child: SizedBox(
                            height: 35.h,
                            width: 120.w,
                            child: Container(
                              color: AppColors.whiteColor,
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    widget.listName?[index].text ?? "",
                                    style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
                                    maxLines: 2,
                                  ),
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
        15.0.hSpace
      ],
    );
  }
}
