import 'package:flutter/material.dart';
import 'package:kd_jewels/core/utils/app_utils.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../features/for_user/home_screen/presentation/page/home_widgets/common_header_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridViewWithPrice extends StatefulWidget {
  final List? listName;
  final bool? isShowFavIcon;
  final VoidCallback? onTap;
  final bool? isHeaderTextShow;
  final String? headerText;
  final String? quoteText;

  const CustomGridViewWithPrice({super.key, required this.listName, required this.isShowFavIcon, required this.onTap, this.isHeaderTextShow, this.headerText, this.quoteText});

  @override
  State<CustomGridViewWithPrice> createState() => _CustomGridViewWithPriceState();
}

class _CustomGridViewWithPriceState extends State<CustomGridViewWithPrice> {
  final Set<int> _favoriteIndexes = {}; // Stores index-based favorites

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: widget.isHeaderTextShow ?? false, child: Padding(
          padding: EdgeInsets.only(left: AppUtils.appPadding),
          child: commonHeaderWidget(widget.headerText ?? '', widget.quoteText ?? ''),
        )),
        LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int crossAxisCount = screenWidth > 600 ? 3 : 2;
            double aspectRatio = screenWidth > 600 ? 1 : 0.65;
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.listName?.length,
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 0.0,
                childAspectRatio: aspectRatio,
              ),
              itemBuilder: (context, index) {
                final item = widget.listName?[index];
                final isFavorite = _favoriteIndexes.contains(index);
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(12.0),
                                        top: Radius.circular(12.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.primaryColor.withValues(alpha: 0.6), spreadRadius: 0.5, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1.0))
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                      bottom: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      item?.image ?? '',
                                      height: 155.h,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Visibility(
                                visible: item.label.isNotEmpty ?? false,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    item.label ?? '',
                                    style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SizedBox(
                              height: 60.0.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item?.productName ?? '',
                                    style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
                                    maxLines: 2,
                                  ),
                                  2.0.hSpace,
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.currency_rupee_sharp,
                                        size: 13.sp,
                                        color: AppColors.black,
                                        weight: 25.0.w,
                                      ),
                                      Text(
                                        item?.productPrice ?? '',
                                        style: AppTextStyles.medium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Favorite icon
                    Visibility(
                      visible: widget.isShowFavIcon ?? false,
                      child: Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isFavorite) {
                                _favoriteIndexes.remove(index);
                              } else {
                                _favoriteIndexes.add(index);
                              }
                            });
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 25.0.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
