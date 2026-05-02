import 'package:flutter/material.dart';
import 'package:kd_jewels/features/for_admin/add_products/presentation/page/add_category/widgets/add_category_body_content.dart';
import '../../../../../../core/utils/custom_view/common_app_status_bar.dart';
import '../../../../../../core/utils/custom_view/common_app_bar.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../add_products/widget/add_products_body_content.dart';


class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
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
            child: CommonAppBar(pageName: AppStrings.addCategory, isShowLogo: false,textColor: AppColors.black,),
          ),
          body: const AddCategoryBodyContent(),
        ),
      ),
    );
  }
}
