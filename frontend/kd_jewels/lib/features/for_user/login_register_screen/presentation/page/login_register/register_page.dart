import 'package:flutter/material.dart';
import '../login_register_widgets/register_body_widget.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../login_register_widgets/register_appbar_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: registerAppBarWidget(context),
      body: RegisterBodyWidget(),
    );
  }
}
