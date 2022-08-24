import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../widgets/text_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      
        children: [
          Container(
    
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
            child: Image.network(fit: BoxFit.cover,height:120, loadedProduct.image),
          ),
      
          const SizedBox(
            height: 10,
          ),
          TextWidget(
              title: '  \$${loadedProduct.price}',
              weight: FontWeight.bold,
              color: Colors.green,font: 22,),
          TextWidget(
              title: "  ${loadedProduct.name}", weight: FontWeight.bold,font:25),
          TextWidget(
              title: "  ${loadedProduct.weight}", color: Colors.grey,font:20),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}