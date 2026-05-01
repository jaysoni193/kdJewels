import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_assets.dart';
import 'subtle_background.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../add_products/presentation/page/add_products/add_products_page.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_colors.dart';
import 'action_button_widget.dart';

class AdminBodyContent extends StatelessWidget {
  const AdminBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Subtle background
        SubtleBackground(),

        // Content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.0.hSpace,

              // Header
              _Header(),

              // Label
              Text(
                'OVERVIEW',
                style: AppTextStyles.medium.copyWith(fontSize: 12.sp, color: AppColors.black.withValues(alpha: 0.4), letterSpacing: 1.6),
              ),

              12.0.hSpace,

              // Stats grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.1,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    _StatCard(title: AppStrings.lblProducts, value: '120', icon: Icons.inventory_2_outlined, trend: '+12%', trendUp: true),
                    _StatCard(title: AppStrings.lblOrders, value: '45', icon: Icons.shopping_bag_outlined, trend: '+8%', trendUp: true),
                    _StatCard(title: AppStrings.lblUsers, value: '300', icon: Icons.people_outline, trend: '+5%', trendUp: true),
                    _StatCard(title: AppStrings.lblRevenue, value: '₹50K', icon: Icons.diamond_outlined, trend: '-2%', trendUp: false),
                  ],
                ),
              ),

              16.0.hSpace,

              // Quick actions
              _QuickActions(),

              16.0.hSpace,
            ],
          ),
        ),
      ],
    );
  }
}



class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.homeLogo,
          width: screenWidth * 0.20.w, // 18% of screen width
          height: screenHeight * 0.07.h, // 6% of screen height
          fit: BoxFit.contain,
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.badgeColor,
            border: Border.all(color: AppColors.goldenColor.withValues(alpha: 0.5), width: 1),
          ),
          child: Icon(Icons.diamond_outlined, color: AppColors.golden, size: 20.r),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String trend;
  final bool trendUp;

  const _StatCard({required this.title, required this.value, required this.icon, required this.trend, required this.trendUp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE8E6E0), width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon — single gold tone
          Icon(icon, color: AppColors.golden, size: 25.r),

          // Value + title + trend
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTextStyles.bold.copyWith(fontSize: 22.sp, fontWeight: FontWeight.w700, color: AppColors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTextStyles.medium.copyWith(color: AppColors.black.withValues(alpha: 0.4))),
                  Text(trend, style: AppTextStyles.medium.copyWith(color: trendUp ? AppColors.green : AppColors.red)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionBtn(label: AppStrings.addProduct, icon: Icons.add_rounded, onTap: () => context.pushScreen(AddProductsPage())),
        ),
        12.0.wSpace,
        Expanded(
          child: ActionBtn(label: AppStrings.viewOrders, icon: Icons.receipt_long_outlined, onTap: () {}, outlined: true),
        ),
      ],
    );
  }
}

