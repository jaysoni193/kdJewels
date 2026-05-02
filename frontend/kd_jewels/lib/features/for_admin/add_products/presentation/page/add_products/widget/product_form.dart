import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/constants/app_strings.dart';
import '../../../../../../../core/utils/app_utils.dart';
import '../../../../../../../core/utils/custom_view/custom_drop_down.dart';
import '../../../../../../../core/utils/custom_view/custom_image_picker.dart';
import '../../../../../../../core/utils/custom_view/custom_text_form_field.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: AppUtils.appPadding,
        children: [
          //Image
          CustomImagePicker(),
          //ProductCategory
          CustomDropdown(
            items: ["test"],
            validator: (value) {
              return null;
            },
            onChanged: (value) {},
            label: AppStrings.lblProductCategory,
          ),
          //ProductName
          CustomTextFormField(
            hintText: AppStrings.productName,
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]'))],
          ),
          //ProductPrice
          CustomTextFormField(
            hintText: AppStrings.productPrice,
            obscureText: false,
            keyboardType: TextInputType.number,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')), FilteringTextInputFormatter.digitsOnly],
          ),
          //ProductDescription
          CustomTextFormField(
            hintText: AppStrings.lblProductDescription,
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
            isMaxLine: true,
            maxLength: 100,
            inputFormatters: [],
          ),
        ],
      ),
    );
  }
}
