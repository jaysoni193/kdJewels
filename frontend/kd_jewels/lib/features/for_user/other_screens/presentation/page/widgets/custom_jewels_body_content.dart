import 'package:flutter/material.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/utils/custom_view/custom_grid_view_with_price.dart';
import '../../../../home_screen/presentation/page/home_widgets/search_bar_widget.dart';
import '../other_screens/customise_jewellery_page.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../collection_screen/data/model/collection_data_model.dart';

Widget customJewelsBodyContent(
  BuildContext context,
  List<CollectionDataModel>? collectionDataList,
) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppUtils.appPadding, vertical: AppUtils.appPadding),
      child: Column(
        children: [
          //search bar
          SearchBarWidget(),
          CustomGridViewWithPrice(
            listName: collectionDataList,
            isShowFavIcon: true,
            onTap: () {
              context.pushScreen(CustomiseJewelleryPage());
            },
          ),
          20.0.hSpace,
        ],
      ),
    ),
  );
}
