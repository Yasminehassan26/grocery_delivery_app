import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/category_model.dart';
import 'package:grocery_delivery_app/services/products.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../category_page/categoryPage.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);
    final products = Provider.of<Products>(context);

    return GestureDetector(
      onTap: (() {
        products.items = category.items;
        Navigator.of(context).pushNamed(
          CategoryPage.routeName,
          arguments: category.name,
        );
      }),
      child: GridTile(
        header: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextWidget(title: category.name, weight: FontWeight.bold,textAlign: TextAlign.center)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40.0, bottom: 10, left: 20, right: 20),
          child: Image.network(
            category.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
