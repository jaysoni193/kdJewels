import 'package:flutter/material.dart';
import 'package:kd_jewels/core/utils/app_utils.dart';
import '../../../../../../core/utils/custom_search_bar.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppUtils.appPadding),
      child: CustomSearchBar(
        controller: TextEditingController(),
        onChanged: (value) {
          print("Searching: $value");
        },
      ),
    );
  }
}
