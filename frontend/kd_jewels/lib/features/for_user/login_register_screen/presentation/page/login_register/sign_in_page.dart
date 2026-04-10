import 'package:flutter/material.dart';
import '../login_register_widgets/sign_in_app_bar_widget.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../login_register_widgets/mobile_email_body_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondPrimaryColor,
      appBar: signInAppBarWidget(context),
      body: MobileEmailBodyWidget(),
    );
  }
}
