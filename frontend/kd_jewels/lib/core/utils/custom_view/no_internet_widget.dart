import 'package:flutter/material.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetWidget extends StatelessWidget {
  final Widget? child;
  final bool? isOffline;

  const NoInternetWidget({super.key, this.child, this.isOffline});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.primaryColor,
        padding: const EdgeInsets.all(16),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.icNoInternet, height: 80.h, width: 80.w, color: AppColors.primaryColor),
            Text(
              AppStrings.noInternet,
              style: AppTextStyles.semiBold.copyWith(fontSize: 18.0.sp, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
