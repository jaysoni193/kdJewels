import 'package:flutter/material.dart';
import '../../../../../../core/utils/common_app_status_bar.dart';
import '../../../../../../core/utils/common_app_bar.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../widgets/add_products_body_content.dart';


class AddProductsPage extends StatefulWidget {
  const AddProductsPage({super.key});

  @override
  State<AddProductsPage> createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<AddProductsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CommonAppStatusBar(
        color: AppColors.primaryColor,
        iconBrightness: Brightness.light,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          extendBody: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: CommonAppBar(pageName: AppStrings.addProduct, isShowLogo: false),
          ),
          body: const AddProductsBodyContent(),
        ),
      ),
    );
  }
}
