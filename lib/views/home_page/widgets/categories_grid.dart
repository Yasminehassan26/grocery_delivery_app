import 'package:flutter/material.dart';
import '../../../view_models/categories_view_model.dart';
import 'carousel_widget.dart';
import 'category_item.dart';
import 'package:provider/provider.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoriesViewModel>(context);
    final categories = categoriesData.items;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CarouselWidget(),
            GridView.builder(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (ctx, i) => Card(elevation: 5, child: CategoryItem(categories[i])),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
