import 'package:flutter/material.dart';
import 'package:kd_jewels/core/utils/custom_view/common_app_status_bar.dart';
import '../../../data/model/latest_product_model.dart';
import '../home_widgets/home_page_body_content.dart';
import '../../../data/model/img_text_model.dart';
import '../../../../../../core/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImgTextModel> filterList = [];
  List<ImgTextModel> spacialProductList = [];
  List<LatestProductModel>? latestProductCardList = [];

  @override
  void initState() {
    filterList.addAll(ImgTextModel.filterList());
    spacialProductList.addAll(ImgTextModel.spacialProductList());
    latestProductCardList?.addAll(LatestProductModel.latestProductCardList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: CommonAppStatusBar(
        color: AppColors.primaryColor,
        iconBrightness: Brightness.light,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: homePageBodyContent(context,screenHeight, filterList, spacialProductList, latestProductCardList),
        ),
      ),
    );
  }
}
