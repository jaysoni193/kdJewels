import 'package:flutter/material.dart';
import 'package:kd_jewels/core/constants/app_assets.dart';
import '../../../../../../core/extensions/navigation_extension.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/utils/custom_text_form_field.dart';
import '../../../../../../core/utils/email_validator.dart';
import '../../../../dashboard/presentation/page/dashboard/dashboard_page.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_button.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBodyWidget extends StatefulWidget {
  const RegisterBodyWidget({super.key});

  @override
  State<RegisterBodyWidget> createState() => _RegisterBodyWidgetState();
}

class _RegisterBodyWidgetState extends State<RegisterBodyWidget> {
  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppUtils.appPadding),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.loginLogo,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        child: Column(
                      children: [
                        //Create Profile Text
                        createProfileText(),
                        10.0.hSpace,
                        //first name
                        firstName(),
                        10.0.hSpace,
                        //last name
                        lastName(),
                        10.0.hSpace,
                        //email id
                        emailId(),
                        10.0.hSpace,
                        //password
                        password(),
                        10.0.hSpace,
                        //conform password
                        conformPassword(),
                        20.0.hSpace,
                        //signup Button
                        signUpButton(),
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createProfileText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.createProfile,
          style: AppTextStyles.medium.copyWith(color: AppColors.primaryColor, fontSize: 16.0.sp),
        ),
      ],
    );
  }

  Widget firstName() {
    return CustomTextFormField(
      //key: UniqueKey(),
      controller: TextEditingController(),
      hintText: AppStrings.firstNameHintText,
      labelText: AppStrings.firstNameHintText,
      validator: (p0) {
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: false,
    );
  }

  Widget lastName() {
    return CustomTextFormField(
      controller: TextEditingController(),
      hintText: AppStrings.lastNameHintText,
      labelText: AppStrings.lastNameHintText,
      validator: (p0) {
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: false,
    );
  }

  Widget emailId() {
    return CustomTextFormField(
    //  key: UniqueKey(),
      controller: TextEditingController(),
      hintText: AppStrings.emailID,
      labelText: AppStrings.emailID,
      validator: (value) => EmailValidator.validate(value),
      keyboardType: TextInputType.text,
      obscureText: false,
    );
  }

  Widget password() {
    return CustomTextFormField(
      controller: TextEditingController(),
      hintText: AppStrings.passwordHintText,
      labelText: AppStrings.passwordHintText,
      validator: (p0) {
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: false,
    );
  }

  Widget conformPassword() {
    return CustomTextFormField(
      controller: TextEditingController(),
      hintText: AppStrings.confirmPasswordHintText,
      labelText: AppStrings.confirmPasswordHintText,
      validator: (p0) {
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: false,
    );
  }

  Widget signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: AppStrings.signUP,
          onPressed: () {
            context.pushAndRemoveAll(DashboardPage());
          },
          color: AppColors.primaryColor,
          textColor: AppColors.whiteColor,
          borderRadius: 5.0,
        ),
      ],
    );
  }
}
