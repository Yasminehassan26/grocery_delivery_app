import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/category_model.dart';
import 'package:grocery_delivery_app/services/products.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../category_page/categoryPage.dart';

class CategoryItem extends StatelessWidget {
  // CategoryItem(this.category);
  // final category;

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
            padding: const EdgeInsets.only(top: 6.0),
            child: SizedBox(
              width: 20,
              height: 40,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: TextWidget(
                  title: category.name,
                  weight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  font: 16,
                ),
              ),
            )),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 42.0, bottom: 10, left: 20, right: 20),
          child: Image.network(
            category.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
