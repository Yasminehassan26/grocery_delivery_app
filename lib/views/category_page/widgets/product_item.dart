import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/category_model.dart';
import 'package:grocery_delivery_app/models/product_model.dart';
import 'package:grocery_delivery_app/views/product_page/product_page.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../category_page/categoryPage.dart';

class ProductItem extends StatefulWidget {
  @override
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).pushNamed(
          ProductPage.routeName,
          arguments: product.name,
        );
      }),
      child: GridTile(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFFCFCFC),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.network(product.image),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(icon: Icon(Icons.inbox), onPressed: () {}),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextWidget(
              title: '  \$${product.price}',
              weight: FontWeight.bold,
              color: Colors.green),
          TextWidget(title: "  ${product.name}", weight: FontWeight.bold),
          TextWidget(title: "  ${product.weight}", color: Colors.grey),
          const SizedBox(
            height: 12,
          ),
        ],
      )),
    );
  }
}
