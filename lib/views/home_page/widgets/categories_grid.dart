import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/models/categories.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/category_item.dart';
import 'package:provider/provider.dart';

import '../../../models/products.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);
    final categories = categoriesData.items;
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: categories[i],
          child: Card(elevation: 4, child: CategoryItem()),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
