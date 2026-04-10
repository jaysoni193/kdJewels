import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kd_jewels/core/constants/app_assets.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../dashboard/presentation/page/dashboard/dashboard_page.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_button.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/otp_text_field.dart';

class OtpBodyWidget extends StatefulWidget {
  const OtpBodyWidget({super.key});

  @override
  State<OtpBodyWidget> createState() => _OtpBodyWidgetState();
}

class _OtpBodyWidgetState extends State<OtpBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.minHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: AppUtils.appPadding),
                            child: Image.asset(
                              AppAssets.loginLogo,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(AppUtils.appPadding),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [text(), otpTextField(), resendButton()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget text() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppStrings.enterOTPText,
            style: AppTextStyles.large.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        10.0.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.otpSentOnSMSText,
              style: AppTextStyles.medium,
            ),
            8.0.wSpace,
            Text(
              "+91${maskingTheMobileNumber().toString()}",
              style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
        20.0.hSpace,
      ],
    );
  }

  Widget otpTextField() {
    return OtpTextField(
      pinTextController: TextEditingController(),
      pinLength: 4,
      onComplete: (value) {},
      onChange: (value) {},
      onValidate: (value) {
        if (value!.length < 4) {
          return AppStrings.otpValidation;
        } else {
          return null;
        }
      },
    );
  }

  Widget resendButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.otpNotReceivedText,
          style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w400),
        ),
        8.0.wSpace,
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Text(
            AppStrings.resendOtp,
            style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  String maskingTheMobileNumber() {
    // Only keep the first three and last two digits visible
    final String mobileNumber = '0000000000';

    if (mobileNumber.length < 10) {
      return mobileNumber; // Return original if it's too short
    }

    // Mask the middle digits
    return mobileNumber.replaceRange(3, 8, '*' * 5);
  }
}
