import 'package:flutter/material.dart';
import 'package:grocery_delivery_app/views/home_page/widgets/category_item.dart';
import 'package:provider/provider.dart';

import '../../../models/products.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (c) => products[i],
          child: CategoryItem(),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
