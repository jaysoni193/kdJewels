import 'package:flutter/material.dart';
import '../widgets/onboarding_body_widget.dart';
import '../widgets/onboarding_appbar_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: onBoardingAppBarWidget(context),
      body: OnboardingBodyWidget());
  }

}
