import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../widgets/text_widget.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextWidget(
            title: "Product Details",
            weight: FontWeight.bold,
            font: 18,
          ),
          TextWidget(
            title: loadedProduct.description,
            color: Theme.of(context).secondaryHeaderColor,
            font: 18,
          ),
        ]);
  }
}
