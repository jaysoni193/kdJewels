import 'package:flutter/material.dart';
import 'product_list.dart';

class AddProductsBodyContent extends StatelessWidget {
  const AddProductsBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 10.0, children: [
      ProductList(),
    ]);
  }
}
