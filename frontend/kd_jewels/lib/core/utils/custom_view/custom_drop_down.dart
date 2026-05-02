import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class CustomDropdown<T> extends StatefulWidget {
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final List<T> items;
  final String? label;
  final bool disabled;
  final bool enableSearch;
  final String Function(T)? displayStringForOption;
  final bool Function(T?, T?)? compareValues;
  final VoidCallback? onTap;
  final bool lazyLoad;
  final bool isShowAsterisk;
  final bool insideBlueCard;
  final FocusNode? focusNode;
  final Color? selectValueColor;
  final Function(String)? onQueryChanged;
  final String? Function(T?)? validator;

  const CustomDropdown({
    super.key,
    this.initialValue,
    this.onChanged,
    required this.items,
    this.label,
    this.disabled = false,
    this.enableSearch = false,
    this.displayStringForOption,
    this.compareValues,
    this.onTap,
    this.lazyLoad = false,
    this.isShowAsterisk = false,
    this.insideBlueCard = false,
    this.focusNode,
    this.selectValueColor,
    this.onQueryChanged,
    this.validator, // <-- Added validator here
  });

  String _getDisplayString(T item) {
    if (displayStringForOption != null) {
      return displayStringForOption!(item);
    } else {}
    return item.toString();
  }

  bool _compare(T? a, T? b) {
    if (compareValues != null) {
      return compareValues!(a, b);
    }
    return a == b;
  }

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  Future<void> _showSearch() async {
    if (!widget.disabled) {
      final T? result = await showSearch<T?>(
        context: context,
        delegate: DropdownSearch1<T>(
          widget.items,
          widget._getDisplayString,
          widget._compare,
          initialValue: _selectedValue,
          onQueryChanged: widget.onQueryChanged,
        ),
      );
      if (result != null && !widget._compare(result, _selectedValue)) {
        setState(() {
          _selectedValue = result;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(result);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: widget.label ?? '',
                style: AppTextStyles.medium.copyWith(
                    fontSize: 13.0.sp,
                    color: widget.disabled && !widget.insideBlueCard
                        ? AppColors.primaryColor
                        : widget.insideBlueCard
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
              if (widget.isShowAsterisk)
                TextSpan(
                  text: '*',
                  style: AppTextStyles.medium.copyWith(
                    color: AppColors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: widget.disabled
              ? null
              : () {
            if (widget.lazyLoad && widget.onTap != null) {
              widget.onTap!();
            }
            if (widget.enableSearch) {
              _showSearch();
            }
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey,
                      )
                    ],
                  ),
                  child: DropdownSearch<T>(
                    popupProps: PopupProps.menu(
                      showSearchBox: widget.enableSearch,
                      showSelectedItems: false,
                      constraints: BoxConstraints(
                        maxHeight: (widget.items.length * 85.0).clamp(0, 300),
                      ),
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                          ),
                        ),
                      ),
                      itemBuilder: (context, item, isSelected) {
                        return DropdownMenuItem<T>(
                          value: item,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: _selectedValue == item ? AppColors.primaryColor : AppColors.whiteColor,
                            ),
                            child: Text(
                              widget.displayStringForOption?.call(item!) ?? item.toString(),
                              style: AppTextStyles.medium.copyWith(
                                color: _selectedValue == item ? AppColors.whiteColor : AppColors.primaryColor,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    enabled: !widget.disabled,
                    itemAsString: (T? item) => item == null ? '' : widget._getDisplayString(item),
                    dropdownButtonProps: DropdownButtonProps(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                        color: widget.selectValueColor ?? AppColors.primaryColor,
                      ),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        fillColor: !widget.disabled ? AppColors.whiteColor : AppColors.grey,
                        filled: true,
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                        ),
                        suffixIconColor: AppColors.primaryColor,
                        contentPadding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.grey,
                            ),
                            ),
                        focusedBorder: !widget.disabled
                            ? const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey, width: 1.5), )
                            : const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.grey,)),
                        enabledBorder: !widget.disabled
                            ? const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey, width: 1.5),)
                            : const OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor), ),
                        border: !widget.disabled
                            ? const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey, width: 1.5),)
                            : const OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor),),
                      ),
                    ),
                    items: widget.items,
                    onChanged: (T? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    },
                    dropdownBuilder: (context, item) {
                      return Row(
                        children: [
                          Text(
                            item == null ? '' : widget.displayStringForOption?.call(item) ?? item.toString(),
                            style: AppTextStyles.medium.copyWith(
                              fontSize: 13.sp,
                              color: !widget.disabled ? widget.selectValueColor ?? AppColors.grey : widget.selectValueColor ?? AppColors.primaryColor,
                            ),
                          ),
                        ],
                      );
                    },
                    validator: widget.validator,
                    // <-- Use the passed validator here
                    selectedItem: _selectedValue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DropdownSearch1<T> extends SearchDelegate<T?> {
  final List<T> items;
  final String Function(T) displayStringForOption;
  final bool Function(T?, T?) compareValues;
  final T? initialValue;
  final Function(String)? onQueryChanged;

  DropdownSearch1(this.items, this.displayStringForOption, this.compareValues, {this.initialValue, this.onQueryChanged});

  @override
  void showResults(BuildContext context) {
    if (onQueryChanged != null) {
      onQueryChanged!(query);
    }
    super.showResults(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, initialValue);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (onQueryChanged != null) {
      onQueryChanged!(query);
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: AppTextStyles.medium.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      );
    }

    final results = items.where((item) => displayStringForOption(item).toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            displayStringForOption(results[index]),
            style: AppTextStyles.medium.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (onQueryChanged != null && query.isNotEmpty) {
      onQueryChanged!(query);
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          'No suggestions available',
          style: AppTextStyles.medium.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      );
    }

    final suggestions = items.where((item) => displayStringForOption(item).toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            displayStringForOption(suggestions[index]),
            style: AppTextStyles.medium.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          onTap: () {
            close(context, suggestions[index]);
          },
        );
      },
    );
  }
}
