import 'package:flutter/material.dart';
import '../../../../login_register_screen/presentation/page/login_register/sign_in_page.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_view/custom_button.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import 'top_convex_clipper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageView extends StatelessWidget {
  final String image;
  final String text;
  final int noOfScreen;
  final int currentScreenNo;
  final Function(int) onPressed;

  const OnboardingPageView({super.key, required this.image, required this.text, required this.noOfScreen, required this.currentScreenNo, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return Scaffold(
      backgroundColor: AppColors.secondPrimaryColor,
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: size.height * 0.3,
            right: 0,
            left: 0,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Positioned(
            top: size.height * 0.5,
            child: Column(
              children: [
                ClipPath(
                  clipper: TopConvexClipper(),
                  child: Container(height: size.height * 0.5, width: size.width, color: AppColors.secondPrimaryColor),
                ),
              ],
            ),
          ),
          // Onboarding Text
          Positioned(
            top: size.height * 0.65,
            left: size.width * 0.01,
            right: size.width * 0.05,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 18.0.sp),
            ),
          ),

          ///Buttons
          Positioned(
            top: size.height * 0.82,
            left: size.width * 0.08,
            right: size.width * 0.08,
            child: Visibility(
              visible: !isLastScreen,
              replacement: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///getStarted
                  CustomButton(
                    text: AppStrings.btnGetStarted,
                    onPressed: () {
                      openLoginScreen(context);
                    },
                    color: AppColors.primaryColor,
                    textColor: AppColors.secondPrimaryColor,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 5.0,
                    paddingVertical: 8,
                    paddingHorizontal: 90,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Skip
                  CustomButton(
                    text: AppStrings.btnSkip,
                    onPressed: () {
                      openLoginScreen(context);
                    },
                    color: AppColors.secondPrimaryColor,
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 5.0,
                    paddingVertical: 8,
                    paddingHorizontal: 50,
                  ),

                  ///Next
                  CustomButton(
                    text: AppStrings.btnNext,
                    onPressed: () {
                      onPressed(currentScreenNo + 1);
                    },
                    color: AppColors.primaryColor,
                    textColor: AppColors.secondPrimaryColor,
                    borderColor: AppColors.primaryColor,
                    borderRadius: 5.0,
                    paddingVertical: 8,
                    paddingHorizontal: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openLoginScreen(BuildContext context) {
    context.pushScreen(SignInPage());
  }
}
