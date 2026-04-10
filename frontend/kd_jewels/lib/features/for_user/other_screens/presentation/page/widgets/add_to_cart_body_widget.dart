import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../collection_screen/data/model/collection_data_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget addToCartBodyContent(
  BuildContext context,
  screenWidth,
  List<CollectionDataModel>? collectionDataList,
) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
          child: Container(
            width: screenWidth * 0.90.w,
            height: 180.h,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey.withValues(alpha: 0.2)),
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8.0),
                  top: Radius.circular(8.0),
                ),
                boxShadow: [BoxShadow(color: AppColors.primaryColor.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(8.0), boxShadow: [
                            BoxShadow(color: AppColors.primaryColor.withValues(alpha: 0.8), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 0.5, offset: Offset(0, 0.5))
                          ]),
                          child: Icon(
                            Icons.clear,
                            color: AppColors.primaryColor,
                            size: 18.sp,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppUtils.appPadding),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.temp,
                        width: 90.w,
                        height: 90.h,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.60.w,
                              child: Text(AppStrings.productName,
                                  style: AppTextStyles.medium.copyWith(fontSize: 13.sp, color: AppColors.primaryColor, fontWeight: FontWeight.w600), maxLines: 2),
                            ),
                            5.0.hSpace,
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  color: AppColors.black,
                                  size: 13,
                                ),
                                Text(
                                  AppStrings.productPrice,
                                  style: AppTextStyles.medium.copyWith(fontSize: 13.0.sp, color: AppColors.black, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            5.0.hSpace,
                            Row(
                              children: [
                                Text(
                                  '${AppStrings.weight} ${': '}',
                                  style: AppTextStyles.medium.copyWith(color: AppColors.grey, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '5.241 g',
                                  style: AppTextStyles.medium.copyWith(color: AppColors.black, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            5.0.hSpace,
                            Row(
                              children: [
                                Text(
                                  '${AppStrings.qty} ${': '}',
                                  style: AppTextStyles.medium.copyWith(color: AppColors.grey, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '1',
                                  style: AppTextStyles.medium.copyWith(color: AppColors.black, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppUtils.appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(
                        color: AppColors.grey.withValues(alpha: 0.2),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: AppUtils.appPadding, top: AppUtils.appPadding),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(8.0), boxShadow: [
                                  BoxShadow(
                                      color: AppColors.primaryColor.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 0.5, offset: Offset(0, 0.5))
                                ]),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.primaryColor,
                                  size: 20.sp,
                                )),
                            10.0.wSpace,
                            Text(
                              AppStrings.addAGiftMessage,
                              style: AppTextStyles.medium.copyWith(color: AppColors.black, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
