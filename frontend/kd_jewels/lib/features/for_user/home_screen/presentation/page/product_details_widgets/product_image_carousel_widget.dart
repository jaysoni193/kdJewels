import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget productImageCarouselWidget(List<String> images) {
  int currentImage = 0;
  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.all(AppUtils.appPadding),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() => currentImage = index);
                  },
                ),
                items: images.map((url) {
                  return Image.asset(url, fit: BoxFit.cover, width: double.infinity);
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0.w,
                    height: 8.0.h,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentImage == entry.key ? AppColors.primaryColor : AppColors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

      );
    },
  );
}
