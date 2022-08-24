import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/services/categories.dart';
import 'package:grocery_delivery_app/views/category_page/widgets/category_appBar_widget.dart';
import 'package:grocery_delivery_app/views/category_page/widgets/products_grid.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final categoryName =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedCategory = Provider.of<Categories>(
      context,
      listen: false,
    ).findById(categoryName);

    return Scaffold(
      appBar: CategoryAppBar(loadedCategory: loadedCategory),
      body: Column(children: [ProductsGrid()]),
    );
  }
}
