import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../collection_screen/presentation/pages/collection/collection_page.dart';
import '../../../../blog_screen/presentation/pages/blog/blog_page.dart';
import '../../../../contact_us_screen/presentation/pages/contact_options_dialog.dart';
import '../../../../shop_screen/presentation/pages/shop/shop_page.dart';
import '../../../../home_screen/presentation/page/home/home_page.dart';
import '../widgets/drawer_widget.dart';
import 'dashboard_appbar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  void _handleClose() {
    setState(() {
      selectedIndex = 0;
      bottomNavigationKey.currentState?.setPage(0);
    });
  }

  final List<Widget> tabsForPages = [
    HomePage(),
    ShopPage(),
    BlogPage(),
    CollectionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: DashboardAppbar(),
        ),
        drawer: drawerWidget(context),
        body: tabsForPages.elementAt(selectedIndex == 4 ? 0 : selectedIndex),
        bottomNavigationBar: CurvedNavigationBar(
          key: bottomNavigationKey,
          index: selectedIndex,
          items: [
            _navBarItem(Icons.home_outlined, AppStrings.home, 0, selectedIndex),
            _navBarItem(Icons.shopping_bag_outlined, AppStrings.shop, 1, selectedIndex),
            _navBarItem(Icons.book_outlined, AppStrings.blogs, 2, selectedIndex),
            _navBarItem(Icons.diamond_outlined, AppStrings.collection, 3, selectedIndex),
            _navBarItem(Icons.phone_paused_outlined, AppStrings.contactUs, 4, selectedIndex),
          ],
          color: AppColors.secondPrimaryColor,
          buttonBackgroundColor: AppColors.primaryColor,
          backgroundColor: AppColors.secondPrimaryColor,
          animationCurve: Curves.easeInOut,
          height: 62.h,
          iconPadding: 10.0,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            if (index == 4) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => contactOptionsDialog(
                  context,
                  () {
                    _handleClose();
                  },
                ),
              );
            }
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}

CurvedNavigationBarItem _navBarItem(IconData icon, String label, int index, int selectedIndex) {
  return CurvedNavigationBarItem(
      child: Icon(
        icon,
        color: selectedIndex == index ? AppColors.secondPrimaryColor : AppColors.primaryColor,
        size: 25.h,
      ),
      label: label,
      labelStyle: AppTextStyles.medium.copyWith(
        color: selectedIndex == index ? AppColors.primaryColor : AppColors.primaryColor,
      ));
}
