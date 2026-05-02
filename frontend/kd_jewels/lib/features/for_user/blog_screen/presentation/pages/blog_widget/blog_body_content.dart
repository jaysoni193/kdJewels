import 'package:flutter/material.dart';
import 'package:kd_jewels/core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_view/custom_card.dart';
import '../../../../home_screen/data/model/latest_product_model.dart';
import '../../../data/model/care_tips_model.dart';
import 'care_and_tips_widget.dart';

Widget blogBodyContent(BuildContext context,List<LatestProductModel>? latestProductCardList,List<CareTipsModel>? careAndTipsList) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ///stylingTips(In Card put videos)
        10.0.hSpace,
        CustomCard(headerText: AppStrings.stylingTips,listName: latestProductCardList,),
        ///top5
        15.0.hSpace,
        CustomCard(headerText: AppStrings.top5,listName: latestProductCardList,),
        ///careAndTips
        15.0.hSpace,
        careAndTipsWidget(context,careAndTipsList),
        80.0.hSpace,
      ],
    ),
  );
}
