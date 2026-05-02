import 'package:flutter/material.dart';
import 'package:kd_jewels/core/utils/custom_view/common_app_status_bar.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../home_screen/data/model/latest_product_model.dart';
import '../../../data/model/care_tips_model.dart';
import '../blog_widget/blog_body_content.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<LatestProductModel> latestProductCardList = [];
  List<CareTipsModel> careAndTipsList = [];
  @override
  void initState() {
    // TODO: implement initState
    latestProductCardList.addAll(LatestProductModel.latestProductCardList());
    careAndTipsList.addAll(CareTipsModel.careAndTipsList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonAppStatusBar(
        color: AppColors.primaryColor,
        iconBrightness: Brightness.light,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: blogBodyContent(context,latestProductCardList,careAndTipsList),
        ),
      ),
    );
  }
}
