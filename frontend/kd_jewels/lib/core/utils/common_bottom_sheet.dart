import 'package:flutter/material.dart';
import '../extensions/navigation_extension.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_colors.dart';
import '../constants/app_text_styles.dart';

Widget iconWidgets(String image, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Image.asset(
      image,
      height: 20,
      width: 20,
      color: AppColors.primaryColor,
    ),
  );
}

Widget textStyleGrey(String value) {
  return Text(
    value,
    style: AppTextStyles.medium.copyWith(
      fontSize: 15.0.sp,
      color: AppColors.primaryColor.withValues(alpha: 0.5),
      height: 1.8,
    ),
  );
}

Widget textStyleBlack(String value) {
  return Text(
    value,
    style: AppTextStyles.medium.copyWith(fontSize: 15.0.sp, height: 1.8),
  );
}

Future<void> showCommonBottomSheet({
  required BuildContext context,
  required Widget headerChild,
  required Widget middleChild,
  required Widget bottomChild,
}) {
  return showModalBottomSheet(
    context: context,
    elevation: 4,
    isScrollControlled: true,
    isDismissible: false,
    showDragHandle: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.65),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Header
                    Container(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                      padding: const EdgeInsets.all(15),
                      child: headerChild,
                    ),

                    // 🔹 Scrollable Middle ONLY
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          child: middleChild,
                        ),
                      ),
                    ),

                    // 🔹 Bottom FIXED (outside scroll)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: Colors.black.withValues(alpha: 0.05),
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: bottomChild,
                    ),
                  ],
                ),
              ),
              // 🔹 Close Button
              Positioned(
                right: 10,
                top: 10,
                child: InkWell(
                  onTap: () => context.popScreen(),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 24.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
