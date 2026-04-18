import 'package:flutter/material.dart';
import 'package:kd_jewels/core/utils/common_app_status_bar.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/common_app_bar.dart';
import '../../../../collection_screen/data/model/collection_data_model.dart';
import '../widgets/custom_jewels_body_content.dart';

class CustomJewelsPage extends StatefulWidget {
  const CustomJewelsPage({super.key});

  @override
  State<CustomJewelsPage> createState() => _CustomJewelsPageState();
}

class _CustomJewelsPageState extends State<CustomJewelsPage> {
  List<CollectionDataModel> collectionDataList = [];

  @override
  void initState() {
    collectionDataList.addAll(CollectionDataModel.collectionDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonAppStatusBar(
      color: AppColors.primaryColor,
      iconBrightness: Brightness.light,
      child: SafeArea(
        child: CommonAppStatusBar(
          color: AppColors.primaryColor,
          iconBrightness: Brightness.light,
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: CommonAppBar(pageName: AppStrings.customJewels, isShowLogo: false,),
            ),
            body: customJewelsBodyContent(context, collectionDataList),
          ),
        ),
      ),
    );
  }
}
