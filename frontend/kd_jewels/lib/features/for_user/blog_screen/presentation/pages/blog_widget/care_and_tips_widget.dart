import 'package:flutter/material.dart';
import 'package:kd_jewels/core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/app_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget careAndTipsWidget(BuildContext context,careAndTipsList){
  return Column(
    children: [
      headerText(),
      10.0.hSpace,
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
              itemCount: careAndTipsList?.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100, // optional: tile background
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.shade300,)
                    ),
                    child: ExpansionTile(
                      collapsedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      dense: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      iconColor: AppColors.primaryColor,
                      showTrailingIcon: true,
                      enabled: true,
                      minTileHeight: 40.0,
                      title: Text(
                        careAndTipsList[index].title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      childrenPadding: EdgeInsets.zero,
                      children: <Widget>[ListTile(title: Text(careAndTipsList[index].subTitle))],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

Widget headerText() {
  return Padding(
    padding: EdgeInsets.only(left: AppUtils.appPadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppStrings.careAndTips,
          style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 16.0.sp),
        ),
      ],
    ),
  );
}


