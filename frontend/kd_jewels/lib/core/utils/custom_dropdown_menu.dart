import 'package:flutter/material.dart';
import '../extensions/widget_size_extension.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'app_utils.dart';

class CustomDropdownMenu<T> extends StatefulWidget {
  final String? labelText;
  final List<T> items;
  final T? initialSelection;
  final Function(T) onSelected;
  final String label;

  const CustomDropdownMenu({
    super.key,
    this.labelText,
    required this.items,
    required this.onSelected,
    this.initialSelection,
    required this.label,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState<T>();
}

class _CustomDropdownMenuState<T> extends State<CustomDropdownMenu<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialSelection ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(visible: widget.labelText?.isNotEmpty == true ,child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppUtils.appPadding),
              child: Text(widget.labelText ?? '',style: AppTextStyles.medium),
            ),
            5.0.hSpace,
          ],
        )),
        DropdownMenu(
          key: UniqueKey(),
          initialSelection: _selectedValue,
          controller: TextEditingController(),
          inputDecorationTheme: InputDecorationTheme(
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
          ),
          requestFocusOnTap: true,
          label: Text(widget.label,style: TextStyle(color: AppColors.primaryColor),),
          expandedInsets: EdgeInsets.only(left: AppUtils.appPadding, right: AppUtils.appPadding, top: 8.0, bottom: 8.0),
          trailingIcon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.primaryColor,
          ),
          enabled: true,
          textStyle: AppTextStyles.medium,
          onSelected: (T? selectedValue) {
            setState(() {
              _selectedValue = selectedValue;
            });
            widget.onSelected(selectedValue!);
          },
          dropdownMenuEntries: widget.items.map((e) {
            // Ensure the `e.toString()` is used to get a string label
            return DropdownMenuEntry(
              value: e,
              label: e.toString(),  // Convert the object to a string representation
            );
          }).toList(),
        ),
      ],
    );
  }
}
