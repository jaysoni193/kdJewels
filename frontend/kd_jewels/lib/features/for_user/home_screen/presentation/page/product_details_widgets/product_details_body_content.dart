import 'package:flutter/material.dart';
import 'package:kd_jewels/core/constants/app_strings.dart';
import '../../../data/model/related_product_model.dart';
import 'product_detail_sub_widget/related_product_widget.dart';
import 'gross_weight_widget.dart';
import 'price_break_up_widget.dart';
import 'product_description_widget.dart';
import 'product_details_widget.dart';
import 'product_image_carousel_widget.dart';
import 'product_specification.dart';
import 'styling_text_widget.dart';
import '../../../../../../core/extensions/widget_size_extension.dart';

class ProductDetailsBodyContent extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailsBodyContent({super.key, required this.product});

  @override
  State<ProductDetailsBodyContent> createState() => _ProductDetailsBodyContentState();
}
class _ProductDetailsBodyContentState extends State<ProductDetailsBodyContent> {
  List<RelatedProductModel> relatedProductsList = [];
  @override
  void initState() {
    relatedProductsList.addAll(RelatedProductModel.relatedProductsList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.0.hSpace,
          productImageCarouselWidget(product['images']),
          //Name,Price etc...
          productDetailsWidget(
            product['name'],
            product['price'],
            product['material'],
          ),
          //Gross weight
          18.0.hSpace,
          grossWeightWidget(product['weight']),
          //Styling
          18.0.hSpace,
          stylingTextWidget(),
          18.0.hSpace,
          productDescriptionWidget(),
          18.0.hSpace,
          priceBreakUpWidget(context),
          18.0.hSpace,
          productSpecificationWidget(context),
          18.0.hSpace,
          RelatedProductWidget(headerText: AppStrings.relatedProducts, onTap: () {}, listName: relatedProductsList,),
          50.0.hSpace,
        ],
      ),
    );
  }
}
