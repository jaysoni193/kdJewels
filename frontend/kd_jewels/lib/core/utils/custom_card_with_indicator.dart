import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../extensions/widget_size_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardWithIndicator extends StatefulWidget {
  final List? listName;
  final double? height;

  const CustomCardWithIndicator({
    super.key,
    required this.listName,
    this.height,
  });

  @override
  State<CustomCardWithIndicator> createState() => _CustomCardWithIndicatorState();
}

class _CustomCardWithIndicatorState extends State<CustomCardWithIndicator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    if (widget.listName == null || widget.listName!.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: [
        CarouselSlider.builder(
         // carouselController: _carouselController,
          itemCount: widget.listName!.length,
          itemBuilder: (context, index, realIndex) {
            return buildCard(context, widget.listName![index], screenWidth);
          },
          options: CarouselOptions(
            height: screenHeight * 0.3.h,
            autoPlay: widget.listName!.length > 1,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        15.0.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.listName!.length,
                (index) => _indicator(index == _currentIndex),
          ),
        ),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.0,
      width: 8.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

Widget buildCard(BuildContext context, dynamic item, double screenWidth) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Image.asset(
      item.backgroundImage ?? '',
      fit: BoxFit.cover,
      width: screenWidth.w,
    ),
  );
}
