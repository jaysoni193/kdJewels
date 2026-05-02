import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatefulWidget {
  final TextEditingController pinTextController;
  final Function(String) onComplete;
  final Function(String) onChange;
  final String? Function(String?) onValidate;
  final int? pinLength;
  const OtpTextField(
      {super.key,
        required this.pinTextController,
        required this.onComplete,
        required this.onChange,
        required this.onValidate,this.pinLength = 4});

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  StreamController<ErrorAnimationType>? errorController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.bold,
      ),
      textStyle: AppTextStyles.medium
          .copyWith(color: AppColors.whiteColor, fontSize: 14.0.sp),
      length:widget.pinLength??4,
      blinkWhenObscuring: true,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      animationType: AnimationType.fade,
      validator: widget.onValidate,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50.h,
        fieldWidth: 40.w,
        activeFillColor: AppColors.primaryColor,
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.black,
        inactiveFillColor: AppColors.whiteColor,
        selectedFillColor: AppColors.secondPrimaryColor,
        selectedColor: AppColors.primaryColor,
        borderWidth: 1,
        activeBorderWidth: 2,
        selectedBorderWidth: 2,
        inactiveBorderWidth: 2,
      ),
      cursorColor: AppColors.primaryColor,
      autoDisposeControllers: true,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: widget.pinTextController,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.white,
          blurRadius: 10,
        )
      ],
      onCompleted: widget.onComplete,
      onChanged: widget.onChange,
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
    );
  }
}
