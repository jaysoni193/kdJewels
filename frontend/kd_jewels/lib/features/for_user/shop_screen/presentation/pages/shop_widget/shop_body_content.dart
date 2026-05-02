import 'package:flutter/material.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_view/custom_grid_view.dart';
import '../../../../../../core/utils/custom_view/horizontal_list_view.dart';
import '../../../../../../core/utils/custom_view/custom_card.dart';
import '../../../../home_screen/data/model/img_text_model.dart';
import '../../../../home_screen/data/model/latest_product_model.dart';


Widget shopBodyContent(BuildContext context, List<ImgTextModel>? productCategoryList, List<LatestProductModel>? latestProductCardList, List<ImgTextModel>? trendingProductList) {
  return SingleChildScrollView(
    child: Column(
      children: [
        ///Shop by Category
        10.0.hSpace,
        CustomGridView(
          headerText: AppStrings.shopByCategory,
          listName: productCategoryList,
        ),

        ///Advertisement Card(Put video etc..)
        15.0.hSpace,
        CustomCard(
          headerText: "",
          listName: latestProductCardList,
        ),

        ///Trending Products
        15.0.hSpace,
        HorizontalListView(headerText: AppStrings.trending, listName: trendingProductList,onTap: () {},),

        50.0.hSpace,
      ],
    ),
  );
}
