import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../home_screen/data/model/img_text_model.dart';
import '../../../../home_screen/data/model/latest_product_model.dart';
import '../shop_widget/shop_body_content.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<ImgTextModel> productCategoryList = [];
  List<LatestProductModel> latestProductCardList = [];
  List<ImgTextModel> trendingProductList = [];
  @override
  void initState() {
    productCategoryList.addAll(ImgTextModel.productCategoryList());
    latestProductCardList.addAll(LatestProductModel.latestProductCardList());
    trendingProductList.addAll(ImgTextModel.trendingProductList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: shopBodyContent(context,productCategoryList,latestProductCardList,trendingProductList),
    );
  }
}
