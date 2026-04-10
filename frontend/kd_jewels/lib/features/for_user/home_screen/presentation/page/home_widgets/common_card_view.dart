import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonCardView extends StatefulWidget {
  final String? image;
  final double? height;
  final VoidCallback onTap;

  const CommonCardView({
    super.key,
    required this.image,
    required this.onTap,
    this.height,
  });

  @override
  State<CommonCardView> createState() => _CommonCardViewState();
}

class _CommonCardViewState extends State<CommonCardView> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            height: widget.height == 0.0 ? screenHeight * 0.23 : widget.height,
            width: screenWidth.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(1, 2),
                  top: Radius.elliptical(1, 2),
                ),
                boxShadow: [BoxShadow(color: AppColors.grey.withValues(alpha: 0.6), spreadRadius: 0.1, blurStyle: BlurStyle.normal, blurRadius: 1, offset: Offset(0, 1))]),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 0.0), child: Image.asset(widget.image ?? '', fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
