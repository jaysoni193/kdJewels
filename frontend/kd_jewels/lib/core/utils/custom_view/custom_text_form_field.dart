import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final Widget? prefixIcon;
  final int? maxLength;
  final String? labelText;
  final String hintText;
  final bool obscureText;
  final bool? isEnable;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool? isMaxLine;

  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.maxLength,
    this.labelText,
    required this.hintText,
    required this.obscureText,
    this.focusNode,
    this.validator,
    this.inputFormatters,
    required this.keyboardType,
    required this.controller,
    this.isEnable,
    this.isMaxLine = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      inputFormatters: widget.inputFormatters ?? [],
      focusNode: widget.focusNode ?? FocusNode(),
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      enabled: widget.isEnable,
      maxLines: widget.isMaxLine ?? false ? 3 : null,
      style: AppTextStyles.medium.copyWith(fontSize: 15.0.sp, color: AppColors.black),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: AppColors.grey),
          // borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: AppColors.grey),
          //  borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: AppColors.primaryColor),
          //borderRadius: BorderRadius.circular(12.0),
        ),
        isDense: false, // Added this
        contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        labelText: widget.labelText != null ? '${widget.labelText!} *' : null, // Adding * to label
        hintText: widget.hintText,
        suffixStyle: AppTextStyles.medium.copyWith(color: AppColors.whiteColor),
        hintStyle: AppTextStyles.medium.copyWith(color: AppColors.grey),
        labelStyle: AppTextStyles.medium,
      ),
    );
  }
}
