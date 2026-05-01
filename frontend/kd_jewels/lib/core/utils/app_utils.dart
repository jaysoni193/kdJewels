import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_assets.dart';

class AppUtils {
  //default app padding
  static double appPadding = 15.0.sp;

  //NoData
  static Widget noData() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.icNoData, height: 80.h, width: 80.w, color: AppColors.primaryColor),
          Text(
            AppStrings.noDataFound,
            style: AppTextStyles.semiBold.copyWith(fontSize: 18.0.sp, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  //NoInternet
  static Widget noInternet() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.icNoInternet, height: 80.h, width: 80.w, color: AppColors.primaryColor),
          Text(
            AppStrings.noInternet,
            style: AppTextStyles.semiBold.copyWith(fontSize: 18.0.sp, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  void showCustomDialog({
    required BuildContext context,
    required Widget child,
    double? width,
    double? height,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Main Dialog Box with Custom Size
              SizedBox(
                width: width ?? MediaQuery.of(context).size.width * 0.9,
                height: height, // null = auto height
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: child,
                ),
              ),

              // ❌ Close Button
              Positioned(
                top: -10,
                right: -10,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: EdgeInsets.all(3), // 👈 increases tap area
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.close, color: Colors.white, size: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
