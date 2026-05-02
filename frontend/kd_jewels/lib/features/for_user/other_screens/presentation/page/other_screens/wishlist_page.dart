import 'package:flutter/material.dart';
import 'package:kd_jewels/core/utils/custom_view/common_app_status_bar.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_view/common_app_bar.dart';
import '../../../../collection_screen/data/model/collection_data_model.dart';
import '../widgets/wishlist_body_content.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<CollectionDataModel> collectionDataList = [];

  @override
  void initState() {
    collectionDataList.addAll(CollectionDataModel.collectionDataList());
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: CommonAppBar(pageName: AppStrings.wishlist, isShowLogo: false,),
          ),
          body: wishlistBodyContent(context, collectionDataList),
        ),
      ),
    );
  }
}
