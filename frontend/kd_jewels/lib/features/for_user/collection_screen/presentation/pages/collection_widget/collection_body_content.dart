import 'package:flutter/material.dart';
import 'package:kd_jewels/core/constants/app_strings.dart';
import 'package:kd_jewels/core/utils/custom_view/custom_search_bar.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/utils/custom_view/custom_grid_view_with_price.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../other_screens/presentation/page/other_screens/customise_jewellery_page.dart';
import '../../../data/model/collection_data_model.dart';
import 'filter_by_name.dart';
import 'filter_by_price.dart';

Widget collectionBodyContent(
  BuildContext context,
  List<CollectionDataModel>? collectionDataList,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: AppUtils.appPadding, vertical: AppUtils.appPadding),
    child: SingleChildScrollView(
      child: Column(
        children: [
          AppUtils.appPadding.hSpace,
          CustomSearchBar(controller: TextEditingController()),
          AppUtils.appPadding.hSpace,
          filterByName(),
          AppUtils.appPadding.hSpace,
          filterByPrice(),
          AppUtils.appPadding.hSpace,
          CustomGridViewWithPrice(
            isHeaderTextShow: true,
            headerText: AppStrings.collection,
            quoteText: AppStrings.collectionItems,
            listName: collectionDataList,
            isShowFavIcon: false,
            onTap: () {
              context.pushScreen(CustomiseJewelleryPage());
            },
          ),
          50.0.hSpace
        ],
      ),
    ),
  );
}
