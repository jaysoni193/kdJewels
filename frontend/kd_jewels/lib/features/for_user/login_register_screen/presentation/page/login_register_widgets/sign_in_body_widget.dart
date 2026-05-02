import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/utils/custom_view/custom_divider.dart';
import '../../bloc/login_register_bloc/login_register_bloc.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../login_register/register_page.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/validator/email_validator.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_view/custom_button.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/custom_view/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInBodyWidget extends StatelessWidget {
  final LoginRegisterBloc? loginRegisterBloc;

  const SignInBodyWidget({super.key, this.loginRegisterBloc});

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
                key: loginRegisterBloc?.loginFormKey,
                child: Column(
                  children: [
                    loginSignUpText(),
                    10.0.hSpace,

                    ///Email ID
                    CustomTextFormField(
                      key: UniqueKey(),
                      labelText: AppStrings.emailID,
                      inputFormatters: [LengthLimitingTextInputFormatter(40)],
                      hintText: AppStrings.emailIDHintText,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      controller: loginRegisterBloc!.email,
                      validator: (value) => EmailValidator.validate(value),
                    ),
                    25.0.hSpace,

                    ///Password
                    CustomTextFormField(
                      key: UniqueKey(),
                      labelText: AppStrings.passwordHintText,
                      inputFormatters: [LengthLimitingTextInputFormatter(30)],
                      hintText: AppStrings.passwordHintText,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      controller: loginRegisterBloc!.password,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          AppStrings.validationPassword;
                        }
                        return null;
                      },
                    ),
                    10.0.hSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: AppStrings.btnSignIn,
                          onPressed: () {
                            if (loginRegisterBloc!.loginFormKey.currentState!.validate()) {
                              loginRegisterBloc!.add(LogInEvent(loginRegisterBloc!.email.text, loginRegisterBloc!.password.text));
                            }
                          },
                          color: AppColors.primaryColor,
                          textColor: AppColors.whiteColor,
                          borderRadius: 5.0,
                        ),
                      ],
                    ),

                    8.0.hSpace,

                    CustomDivider(
                      isShowImage: false,
                      isShowButtonText: true,
                      text: AppStrings.signUpText,
                      buttonText: AppStrings.btnSignUP,
                      onPressed: () {
                        context.pushScreen(RegisterPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
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

Widget signUpButton(BuildContext context) {
  return CustomDivider(
    isShowImage: false,
    isShowButtonText: true,
    text: AppStrings.signUpText,
    buttonText: AppStrings.btnSignUP,
    onPressed: () {
      context.pushScreen(RegisterPage());
    },
  );
}
