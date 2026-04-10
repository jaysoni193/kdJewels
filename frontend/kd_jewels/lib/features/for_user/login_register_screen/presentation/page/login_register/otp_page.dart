import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../login_register_widgets/otp_app_bar_widget.dart';
import '../login_register_widgets/otp_body_widget.dart';


class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: otpAppBarWidget(context),
      body: OtpBodyWidget(),
    );
  }
}
