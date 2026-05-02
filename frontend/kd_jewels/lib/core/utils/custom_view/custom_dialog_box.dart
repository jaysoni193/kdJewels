import 'package:flutter/material.dart';
import '../../extensions/widget_size_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_text_styles.dart';
import 'custom_button.dart';

class CustomDialogBox {
  static Future<void> showDeleteAccountDialog(BuildContext context, {VoidCallback? cancelBtn, VoidCallback? okBtn}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.whiteColor.withValues(alpha: 0.3),
          child: Dialog(
            backgroundColor: AppColors.whiteColor,
            shadowColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.icDelete, height: 60.0.h, width: 60.0.w, color: AppColors.red),
                  Text(
                    AppStrings.deleteAccount,
                    style: AppTextStyles.medium.copyWith(fontSize: 20.sp, color: AppColors.red),
                  ),
                  5.0.hSpace,
                  Text(AppStrings.deleteAccountString, style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor)),
                  15.0.hSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 45.h,
                          child: CustomButton(text: AppStrings.btnCancel, onPressed: cancelBtn ?? () {}, color: AppColors.grey, textColor: AppColors.whiteColor),
                        ),
                      ),
                      10.0.wSpace,
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 45.h,
                          child: CustomButton(text: AppStrings.btnOkay, onPressed: okBtn ?? () {}, color: AppColors.primaryColor, textColor: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showCustomDialog(BuildContext context, {String? icon, String? title, Color? titleColor, String? subTitle, String? btnText, VoidCallback? onTap}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.whiteColor.withValues(alpha: 0.3),
          child: Dialog(
            backgroundColor: AppColors.whiteColor,
            shadowColor: AppColors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(icon ?? AppAssets.icDelete, height: 60.0.h, width: 60.0.w),
                  Text(
                    title ?? 'Title',
                    style: AppTextStyles.medium.copyWith(fontSize: 18.sp, color: titleColor),
                  ),
                  5.0.hSpace,
                  Text(
                    subTitle ?? 'subTitle',
                    style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 15.sp),
                  ),
                  15.0.hSpace,
                  CustomButton(text: btnText ?? AppStrings.btnOkay, onPressed: onTap ?? () {}, color: AppColors.golden, textColor: AppColors.whiteColor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showCustomDialogWithChild({
    required BuildContext context,
    required Widget child,
    double? width,
    double? height,
    bool barrierDismissible = false,
  }) async {
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

  static Future<void> showLogoutDialog(BuildContext context, {VoidCallback? noBtn, VoidCallback? yesBtn}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: AppColors.whiteColor.withValues(alpha: 0.5),
          child: Dialog(
            backgroundColor: AppColors.whiteColor,
            shadowColor: AppColors.grey,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.icLogout, height: 60.0.h, width: 60.0.w, color: AppColors.primaryColor),
                  Text(
                    AppStrings.logout,
                    style: AppTextStyles.medium.copyWith(fontSize: 20.sp, color: AppColors.primaryColor),
                  ),
                  5.0.hSpace,
                  Text(AppStrings.logoutText, style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor)),
                  15.0.hSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 45.h,
                          child: CustomButton(text: AppStrings.btnNo, onPressed: noBtn ?? () {}, color: AppColors.grey, textColor: AppColors.whiteColor),
                        ),
                      ),
                      10.0.wSpace,
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 45.h,
                          child: CustomButton(text: AppStrings.btnYes, onPressed: yesBtn ?? () {}, color: AppColors.primaryColor, textColor: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
