import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/common_app_bar.dart';
import '../../../../../../core/utils/common_app_status_bar.dart';
import '../../../../collection_screen/data/model/collection_data_model.dart';
import '../widgets/add_to_cart_body_widget.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  List<CollectionDataModel> collectionDataList = [];

  @override
  void initState() {
    collectionDataList.addAll(CollectionDataModel.collectionDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: CommonAppStatusBar(
        color: AppColors.primaryColor,
        iconBrightness: Brightness.light,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: CommonAppBar(pageName: AppStrings.myCart, isShowLogo: false,),
          ),
          body: addToCartBodyContent(context, screenWidth, collectionDataList),
        ),
      ),
    );
  }
}
