import 'package:flutter/material.dart';
import 'package:kd_jewels/core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/common_app_bar.dart';
import '../widgets/customise_jewellery_body_content.dart';

class CustomiseJewelleryPage extends StatefulWidget {
  const CustomiseJewelleryPage({super.key});

  @override
  State<CustomiseJewelleryPage> createState() => _CustomiseJewelleryPageState();
}

class _CustomiseJewelleryPageState extends State<CustomiseJewelleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: CommonAppBar(pageName: AppStrings.customiseJewellery, isShowLogo: false,),
      ),
      body: customiseJewelleryBodyContent(context),
    );
  }
}
