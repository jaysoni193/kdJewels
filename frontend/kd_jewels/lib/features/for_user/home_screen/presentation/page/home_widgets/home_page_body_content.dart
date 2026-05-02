import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../home/product_details_page.dart';
import 'common_card_view.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/app_utils.dart';
import 'gifting_widget.dart';
import 'shop_by_gender_widget.dart';
import '../../../../../../core/utils/custom_view/custom_card_with_indicator.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/utils/custom_view/horizontal_list_view.dart';
import '../../../data/model/img_text_model.dart';
import '../../../data/model/latest_product_model.dart';
import 'search_bar_widget.dart';
import 'spacial_products_widget.dart';
import 'three_card_widget.dart';

int currentIndex = 0;

Widget homePageBodyContent(
  BuildContext context,
  screenHeight,
  List<ImgTextModel>? filterList,
  List<ImgTextModel>? spacialProductList,
  List<LatestProductModel>? latestProductCardList,
) {
  return SingleChildScrollView(
    child: Column(
      children: [
        //search bar
        SearchBarWidget(),
        //Filters
        HorizontalListView(
          headerText: '',
          listName: filterList,
          onTap: () {
            context.pushScreen(ProductDetailsPage());
          },
        ),
        //Advertisement Card
        Visibility(visible: latestProductCardList?.isNotEmpty ?? false, child: CustomCardWithIndicator(listName: latestProductCardList)),
        AppUtils.appPadding.hSpace,
        CommonCardView(
          image: AppAssets.temp,
          onTap: () {},
        ),
        AppUtils.appPadding.hSpace,
        //Spacial Products
        SpacialProductsWidget(
          isHeaderTextShow: true,
          headerText: AppStrings.spacialProducts,
          quoteText: AppStrings.spacialProductQuote,
          listName: spacialProductList,
          onTap: () {},
        ),
        AppUtils.appPadding.hSpace,
        ThreeCardWidget(
          isHeaderTextShow: true,
          image1: AppAssets.temp,
          image2: AppAssets.temp,
          image3: AppAssets.temp,
          headerText: AppStrings.stunningEveryEar,
          quoteText: AppStrings.stunningEveryEarQuote,
          onTap: () {},
        ),
        //best Seller
        AppUtils.appPadding.hSpace,
        ThreeCardWidget(
          isHeaderTextShow: true,
          image1: AppAssets.temp,
          image2: AppAssets.temp,
          image3: AppAssets.temp,
          headerText: AppStrings.goldBestSellers,
          quoteText: AppStrings.goldBestSellersQuote,
          onTap: () {},
        ),
        //Gifting
        AppUtils.appPadding.hSpace,
        GiftingWidget(
          headerText: AppStrings.gifting,
          quoteText: AppStrings.giftingQuote,
          isHeaderTextShow: true,
          listName: filterList,
          onTap: () {},
        ),
        AppUtils.appPadding.hSpace,
        CommonCardView(
          height: screenHeight * 0.28,
          image: AppAssets.temp,
          onTap: () {},
        ),
        //Shop by Gender
        AppUtils.appPadding.hSpace,
        ShopByGenderWidget(
          isHeaderTextShow: true,
          headerText: AppStrings.shopByGender,
          quoteText: AppStrings.shopBuyGenderQuote,
          onTap: () {},
        ),
        //best Seller
        AppUtils.appPadding.hSpace,
        ThreeCardWidget(
          isHeaderTextShow: true,
          image1: AppAssets.temp,
          image2: AppAssets.temp,
          image3: AppAssets.temp,
          headerText: AppStrings.goldBestSellers,
          quoteText: AppStrings.silverBestSellersQuote,
          onTap: () {},
        ),
        //best Seller
        AppUtils.appPadding.hSpace,
        ThreeCardWidget(
          isHeaderTextShow: true,
          image1: AppAssets.temp,
          image2: AppAssets.temp,
          image3: AppAssets.temp,
          headerText: AppStrings.ring,
          quoteText: AppStrings.ringQuote,
          onTap: () {},
        ),
        //another card
        AppUtils.appPadding.hSpace,
        //Advertisement Card
        Visibility(visible: latestProductCardList?.isNotEmpty ?? false, child: CustomCardWithIndicator(listName: latestProductCardList)),
        50.0.hSpace,
      ],
    ),
  );
}
