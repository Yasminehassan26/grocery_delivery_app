import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/category_model.dart';
import 'package:grocery_delivery_app/views/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../Cat/categoryPage.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);
    return SizedBox(
      width: 30,
      height: 30,
      child: GridTile(
        header: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextWidget(title: category.name, weight: FontWeight.bold)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40.0, bottom: 10, left: 20, right: 20),
          child: GestureDetector(
            onTap: (() {
              Navigator.of(context).pushNamed(
                CategoryPage.routeName,
                arguments: category.name,
              );
            }),
            child: Image.network(
              category.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
