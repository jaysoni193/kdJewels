import 'package:flutter/material.dart';
import '../../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../../core/constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productSpecificationTableSubWidget() {
  return SizedBox(
    height: 200,
    child: Scrollbar(
      thumbVisibility: true,
      interactive: true,
      child: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "data",
                      style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp),
                    ),
                    Text(
                      "data",
                      style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  color: AppColors.grey.withOpacity(0.5),
                  endIndent: 20.0,
                  indent: 2.5,
                  thickness: 1.0,
                )
              ],
            ),
          );
        },
      ),
    ),
  );
}
