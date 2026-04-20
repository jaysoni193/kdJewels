import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../login_register_widgets/mobile_email_app_bar_widget.dart';
import '../login_register_widgets/email_password_body_widget.dart';


class MobileEmailPage extends StatefulWidget {
  const MobileEmailPage({super.key});

  @override
  State<MobileEmailPage> createState() => _MobileEmailPageState();
}

class _MobileEmailPageState extends State<MobileEmailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondPrimaryColor,
      appBar: mobileEmailAppBarWidget(context),
      body: MobileEmailBodyWidget(),

    );
  }
}
