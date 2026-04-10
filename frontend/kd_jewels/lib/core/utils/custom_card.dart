import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kd_jewels/core/extensions/widget_size_extension.dart';
import 'header_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatefulWidget {
  final String? headerText;
  final List? listName;

  const CustomCard({
    super.key,
    required this.headerText,
    required this.listName,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late final PageController _pageController;
  Timer? timer;
  int _currentIndex = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);

    if (widget.listName!.length > 1) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_pageController.hasClients) {
          _currentIndex = (_currentIndex + 1) % widget.listName!.length;
          _pageController.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOutCubicEmphasized,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Visibility(
            visible: widget.headerText?.isNotEmpty == true,
            child: Column(
              children: [
                headerLabel(widget.headerText ?? ''),
                15.0.hSpace,
              ],
            )),
        SizedBox(
          height: 220.h,
          width: screenWidth * 0.99.w,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.listName!.length,
            itemBuilder: (context, index) {
              return buildCard(context, widget.listName?[index], screenWidth);
            },
          ),
        ),
      ],
    );
  }
}

Widget buildCard(BuildContext context, dynamic item, double screenWidth) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(item.backgroundImage ?? '', fit: BoxFit.cover),
        ],
      ),
    ),
  );
}
