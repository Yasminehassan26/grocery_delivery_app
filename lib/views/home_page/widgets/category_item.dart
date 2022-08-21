import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class CategoryItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // header: TextWidget(title: "hi"),
        // child: GestureDetector(
        //   onTap: () {},
        //   child: Image.network(
        //     product.image,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        header: Text(
          product.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        child: GestureDetector(
          child: Image.network(
            product.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
