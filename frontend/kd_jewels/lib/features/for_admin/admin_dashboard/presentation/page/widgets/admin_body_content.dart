import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../add_products/presentation/page/add_products/add_products_page.dart';
import 'dashboard_card_widget.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import 'action_button_widget.dart';

class AdminBodyContent extends StatelessWidget {
  const AdminBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 18.0.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.0.hSpace,
          Text(
            'Hi, Admin 👋',
            style: AppTextStyles.semiBold.copyWith(fontSize: 20.0.sp, color: AppColors.primaryColor),
          ),
          // Stats Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                DashboardCardWidget(title: 'Products', value: '120', icon: Icons.inventory),
                DashboardCardWidget(title: 'Orders', value: '45', icon: Icons.shopping_cart),
                DashboardCardWidget(title: 'Users', value: '300', icon: Icons.people),
                DashboardCardWidget(title: 'Test', value: '₹50K', icon: Icons.attach_money),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Actions',
                  style: AppTextStyles.semiBold.copyWith(fontSize: 20.0.sp, color: AppColors.primaryColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    actionButton(Icons.add, 'Add Product', () {
                      context.pushScreen(AddProductsPage());
                    }),
                    actionButton(Icons.image, 'Add Banner', () {}),
                    actionButton(Icons.list, 'Orders', () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
