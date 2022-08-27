import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/view_models/categories_view_model.dart';
import '../../services/categories.dart';
import 'widgets/category_appBar_widget.dart';
import 'widgets/products_grid.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';

  CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryName =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedCategory = Provider.of<CategoriesViewModel>(
      context,
      listen: false,
    ).findById(categoryName);

    return Scaffold(
      appBar: CategoryAppBar(loadedCategory: loadedCategory),
      body: Column(children: [ProductsGrid()]),
    );
  }
}
