import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/extensions/navigation_extension.dart';
import '../../../../for_user/onboarding/presentation/page/onboarding_screen/onboarding_screen.dart';
import '../../../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Delay navigation by 3 seconds
    Timer(const Duration(seconds: 3), () {
      context.pushAndRemoveAll(OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: appBarWidget(), body: bodyWidget(context)),
    );
  }
}

appBarWidget() {
  return PreferredSize(
    preferredSize: Size.zero,
    child: AppBar(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
}

bodyWidget(BuildContext context) {
  final MediaQueryData mediaQuery = MediaQuery.of(context);
  final double screenWidth = mediaQuery.size.width;
  final double screenHeight = mediaQuery.size.height;

  // Adjust logo size as a fraction of screen size
  final double logoWidth = screenWidth * 0.8.w; // 50% of screen width
  final double logoHeight = screenHeight * 0.8.w; // 30% of screen height

  return Container(
    width: screenWidth.w,
    height: screenHeight.h,
    color: AppColors.primaryColor,
    alignment: Alignment.center,
    child: Image.asset(
      AppAssets.splashLogo,
      fit: BoxFit.contain,
      width: logoWidth,
      height: logoHeight,
    ),
  );
}
