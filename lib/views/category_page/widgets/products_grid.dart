import 'package:flutter/material.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';
import '../../../view_models/products_view_model.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsViewModel>(context).items;
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(top: 30, left: 20, bottom: 20, right: 10),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
