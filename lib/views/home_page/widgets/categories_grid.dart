import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/services/categories.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);
    final categories = categoriesData.items;
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: categories[i],
          child: Card(elevation: 4, child: CategoryItem()),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.94,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
