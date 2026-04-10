import 'package:flutter/material.dart';
import '../extensions/widget_size_extension.dart';
import 'header_text_widget.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomGridView extends StatefulWidget {
  final String? headerText;
  final List? listName;

  const CustomGridView({super.key, required this.headerText, required this.listName});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        headerLabel(widget.headerText ?? ''),
        15.0.hSpace,
        LayoutBuilder(
          builder: (context, constraints) {
            // Determine item width dynamically
            double screenWidth = constraints.maxWidth;
            int crossAxisCount = screenWidth > 600 ? 6 : 3; // More columns on big screens
            double aspectRatio = screenWidth > 600 ? 0.80 : 0.75;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.listName?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10.0,
                //  mainAxisSpacing: 10.0,
                  childAspectRatio: aspectRatio,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                widget.listName?[index].image ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Text(
                              widget.listName?[index].text ?? '',
                              maxLines: 3,
                              style: AppTextStyles.medium.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
