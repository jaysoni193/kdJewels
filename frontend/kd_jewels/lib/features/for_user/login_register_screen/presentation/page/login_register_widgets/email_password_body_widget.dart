import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kd_jewels/core/constants/app_assets.dart';
import 'package:kd_jewels/core/utils/custom_divider.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../login_register/register_page.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/email_validator.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_button.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_text_form_field.dart';
import '../../../../../../core/utils/mobile_number_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileEmailBodyWidget extends StatefulWidget {
  const MobileEmailBodyWidget({super.key});

  @override
  State<MobileEmailBodyWidget> createState() => _MobileEmailBodyWidgetState();
}

final email = TextEditingController();
final loginFormKey = GlobalKey<FormState>();

class _MobileEmailBodyWidgetState extends State<MobileEmailBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Image.asset(AppAssets.loginLogo),
            Padding(
              padding: EdgeInsets.all(AppUtils.appPadding),
              child: Form(
                key: loginFormKey,
                child: Column(
                  children: [
                    loginSignUpText(),
                    10.0.hSpace,

                    ///Email ID
                    emailIDTextField(),
                    25.0.hSpace,

                    ///Password
                    passwordTextField(),
                    10.0.hSpace,

                    ///Button
                    signInButton(context),
                    8.0.hSpace,

                    signUpButton(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget loginSignUpText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        AppStrings.loginSignUP,
        style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 16.sp),
      ),
    ],
  );
}

Widget passwordTextField() {
  return CustomTextFormField(
    key: UniqueKey(),
    labelText: AppStrings.mobileNo,
    inputFormatters: [
      LengthLimitingTextInputFormatter(10),
      FilteringTextInputFormatter.digitsOnly,
      MobileNumberValidator(),
    ],
    hintText: AppStrings.mobileNoHintText,
    obscureText: false,
    keyboardType: TextInputType.phone,
    controller: TextEditingController(),
    validator: (value) {
      //   //Todo (Validation for Mobile no)
      if (value!.isEmpty) {
        return 'Please enter a mobile number.';
      }
      if (!RegExp(r"^[6789]").hasMatch(value)) {
        return 'Mobile number must start with 6, 7, 8, or 9.';
      }
      if (value.length != 10) {
        return 'Mobile number must be 10 digits long.';
      } else {
        return null;
      }
    },
  );
}

Widget emailIDTextField() {
  return CustomTextFormField(
    key: UniqueKey(),
    labelText: AppStrings.emailID,
    inputFormatters: [
      LengthLimitingTextInputFormatter(40),
    ],
    hintText: AppStrings.emailIDHintText,
    obscureText: false,
    keyboardType: TextInputType.text,
    controller: TextEditingController(),
    validator: (value) => EmailValidator.validate(value),
  );
}

/*Widget getOTPButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomButton(
        text: AppStrings.getOtp,
        onPressed: () {
          if (loginFormKey.currentState!.validate()) {
            context.pushScreen(OtpPage());
          }
        },
        color: AppColors.primaryColor,
        textColor: AppColors.whiteColor,
        borderRadius: 5.0,
      ),
    ],
  );
}*/

Widget signInButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomButton(
        text: AppStrings.signIn,
        onPressed: () {
          if (loginFormKey.currentState!.validate()) {

          }
        },
        color: AppColors.primaryColor,
        textColor: AppColors.whiteColor,
        borderRadius: 5.0,
      ),
    ],
  );
}

Widget signUpButton(BuildContext context) {
  return CustomDivider(
    isShowImage: false,
    isShowButtonText: true,
    text: AppStrings.signUpText,
    buttonText: AppStrings.signUP,
    onPressed: () {
      context.pushScreen(RegisterPage());
    },
  );
}
