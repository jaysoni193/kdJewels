import 'package:flutter/material.dart';
import '../../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../admin_dashboard/presentation/page/widgets/action_button_widget.dart';
import '../../../../../admin_dashboard/presentation/page/widgets/subtle_background.dart';
import '../../add_category/add_category_page.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/custom_view/custom_button.dart';
import 'edit_product_bottom_sheet.dart';
import 'product_list.dart';

class AddProductsBodyContent extends StatelessWidget {
  const AddProductsBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SubtleBackground(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10.0,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ProductList();
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: Row(
            spacing: 5.0,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ActionBtn(label: AppStrings.addProduct, icon: Icons.add_rounded, onTap: () => editProductBottomSheet(context, true)),
              ),
              Flexible(
                child: ActionBtn(label: AppStrings.addCategory, icon: Icons.add_rounded, outlined: true, onTap: () => context.pushScreen(AddCategoryPage())),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
