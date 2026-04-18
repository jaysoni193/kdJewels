import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatefulWidget {
  final String? pageName;
  final bool? isShowLogo;

  const CommonAppBar({super.key, required this.pageName, required this.isShowLogo,});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20.sp, color: AppColors.primaryColor),
      ),
      title: widget.isShowLogo == true
          ? Image.asset(
              AppAssets.homeLogo,
              width: screenWidth * 0.18.w, // 18% of screen width
              height: screenHeight * 0.06.h, // 6% of screen height
              fit: BoxFit.contain,
            )
          : Text(
              widget.pageName ?? '',
              style: AppTextStyles.medium.copyWith(fontSize: 16.0.sp, color: AppColors.primaryColor),
            ),
    );
  }
}
