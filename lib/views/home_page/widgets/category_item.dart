import 'package:flutter/material.dart';
import '../../../models/category_model.dart';
import '../../../view_models/products_view_model.dart';
import '../../widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../category_page/categoryPage.dart';

class CategoryItem extends StatelessWidget {
  // CategoryItem(this.category);
  // final category;

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);
    final products = Provider.of<ProductsViewModel>(context);

    return GestureDetector(
      onTap: (() {
        products.items = category.items;
        Navigator.of(context).pushNamed(
          CategoryPage.routeName,
          arguments: category.name,
        );
      }),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: double.maxFinite,
        width: double.maxFinite,
        child: GridTile(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(children: [
              SizedBox(
                width: constraints.maxWidth - 10,
                height: constraints.maxHeight / 3,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TextWidget(
                      title: category.name,
                      weight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      font: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth - 10,
                height: constraints.maxHeight / 2,
                child: Image.network(
                  category.image,
                  fit: BoxFit.fill,
                ),
              )
            ]);
          }),
        ),
      ),
    );
  }
}
