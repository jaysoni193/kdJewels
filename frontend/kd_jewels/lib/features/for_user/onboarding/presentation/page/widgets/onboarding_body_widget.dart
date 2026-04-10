import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import 'onBoarding_page_view.dart';

class OnboardingBodyWidget extends StatefulWidget {
  const OnboardingBodyWidget({super.key});

  @override
  State<OnboardingBodyWidget> createState() => _OnboardingBodyWidgetState();
}

class _OnboardingBodyWidgetState extends State<OnboardingBodyWidget> {
  PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: controller,
          onPageChanged: (int page) {
            // To view Page View
            setState(() {
              currentIndex = page;
            });
          },
          children: [
            OnboardingPageView(image:  AppAssets.temp, text: AppStrings.onBoardingText, noOfScreen: 3, currentScreenNo: 0, onPressed: changeScreen),
            OnboardingPageView(
              image:  AppAssets.temp,
              text: AppStrings.onBoardingText,
              noOfScreen: 3,
              currentScreenNo: 1,
              onPressed: changeScreen,
            ),
            OnboardingPageView(
              image:  AppAssets.temp,
              text: AppStrings.onBoardingText,
              noOfScreen: 3,
              currentScreenNo: 2,
              onPressed: changeScreen,
            ),
          ],
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicator(),
          ),
        ),
      ],
    );
  }

  //Lets write function to change next onboarding screen
  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  // Create a Indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  // Create a indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
