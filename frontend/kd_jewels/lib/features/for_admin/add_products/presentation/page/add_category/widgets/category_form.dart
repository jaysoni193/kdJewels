import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../core/utils/custom_text_form_field.dart';

class CategoryForm extends StatelessWidget {
  const CategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: AppUtils.appPadding,
        children: [
          //ProductCategory
          CustomTextFormField(
            hintText: AppStrings.lblProductCategory,
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]'))],
          ),
        ],
      ),
    );
  }
}
